import torch
from torch import optim, nn
import torch.nn.functional as F
from tqdm import tqdm

from torch import autograd

"""
EWC Implementation Reference: https://github.com/kuc2477/pytorch-ewc/
"""


class FC_EWC(nn.Module):
	def __init__(self, n_hidden, n_nodes, available_labels=10, image_size=28,
		sample_size=1024, lamda=100):
		super(FC_EWC, self).__init__()
		self.n_hidden = n_hidden
		self.hidden_layers = nn.ModuleList([nn.Linear(image_size * image_size, n_nodes)])
		for _ in range(self.n_hidden):
			self.hidden_layers.append(nn.Linear(n_nodes, n_nodes))
		self.fc_out = nn.Linear(n_nodes, available_labels)

		self.sample_size = sample_size
		self.lamda = lamda


	def forward(self, x):
		x = x.view(x.size(0), -1)
		for layer in self.hidden_layers:
			x = F.relu(layer(x))
		x = self.fc_out(x)
		return F.log_softmax(x)


	def _is_on_cuda(self):
		return next(self.parameters()).is_cuda


	def estimate_fisher(self, data_loader):

		log_ll = []  # log-likelihoods
		batch_size = data_loader.batch_size
		for x, y in data_loader:
			# x = x.view(batch_size, -1)
			# x = Variable(x).cuda() if self._is_on_cuda() else Variable(x)
			# y = Variable(y).cuda() if self._is_on_cuda() else Variable(y)
			log_ll.append(self(x)[range(batch_size), y.data])
			if len(log_ll) >= self.sample_size // batch_size:
				break

		# Estimate the fisher information of the parameters.
		log_ll = torch.cat(log_ll).unbind()
		log_ll_grads = zip(*[
			autograd.grad(l, 
			self.parameters(), 
			retain_graph=(i < len(log_ll))) for i, l in enumerate(log_ll, 1)])
		log_ll_grads = [torch.stack(gs) for gs in log_ll_grads]
		fisher_diagonals = [(g ** 2).mean(0) for g in log_ll_grads]
		param_names = [n.replace('.', '__') for n, p in self.named_parameters()]
		return {n: f.detach() for n, f in zip(param_names, fisher_diagonals)}


	def consolidate(self, fisher):
		for n, p in self.named_parameters():
			n = n.replace('.', '__')
			self.register_buffer('{}_mean'.format(n), p.data.clone())
			self.register_buffer('{}_fisher'.format(n), fisher[n].data.clone())


	def ewc_loss(self, device):
		try:
			losses = []
			for n, p in self.named_parameters():
				# retrieve the consolidated mean and fisher information.
				n = n.replace('.', '__')
				mean = getattr(self, '{}_mean'.format(n))
				fisher = getattr(self, '{}_fisher'.format(n))
				
				# wrap mean and fisher in variables.
				# mean = Variable(mean)
				# fisher = Variable(fisher)
				
				# calculate a ewc loss. (assumes the parameter's prior as
				# gaussian distribution with the estimated mean and the
				# estimated cramer-rao lower bound variance, which is
				# equivalent to the inverse of fisher information)
				losses.append((fisher * (p - mean) ** 2).sum())
			
			return (self.lamda / 2) * sum(losses)
		
		except AttributeError:
			# ewc loss is 0 if there's no consolidated parameters.
			return torch.zeros(1).to(device)


class FC_CNN_EWC(nn.Module):
	def __init__(self, n_hidden, n_nodes, available_labels=10, kernel_size=5,
		sample_size=1024, lamba=100):
		super(FC_CNN_EWC, self).__init__()

		# CNN Layers:
		self.conv1 = nn.Conv2d(1, 10, kernel_size=kernel_size)
		self.conv2 = nn.Conv2d(10, 20, kernel_size=kernel_size)

		# FC layers:
		self.n_hidden = n_hidden
		self.hidden_layers = nn.ModuleList([nn.Linear(320, n_nodes)])
		if self.n_hidden > 1:
			for _ in range(self.n_hidden - 1):
				self.hidden_layers.append(nn.Linear(n_nodes, n_nodes))
		self.fc_out = nn.Linear(n_nodes, available_labels)

		self.sample_size = sample_size
		self.lamda = lamda


	def forward(self, x):
		x = F.relu(F.max_pool2d(self.conv1(x), 2))
		x = F.relu(F.max_pool2d(self.conv2(x), 2))
		x = x.view(-1, 320)
		for layer in self.hidden_layers:
			x = F.relu(layer(x))
		x = self.fc_out(x)
		return F.log_softmax(x)


	def _is_on_cuda(self):
		return next(self.parameters()).is_cuda


	def estimate_fisher(self, data_loader):

		log_ll = []  # log-likelihoods
		batch_size = data_loader.batch_size
		for x, y in data_loader:
			# x = x.view(batch_size, -1)
			# x = Variable(x).cuda() if self._is_on_cuda() else Variable(x)
			# y = Variable(y).cuda() if self._is_on_cuda() else Variable(y)
			log_ll.append(self(x)[range(batch_size), y.data])
			if len(log_ll) >= self.sample_size // batch_size:
				break

		# Estimate the fisher information of the parameters.
		log_ll = torch.cat(log_ll).unbind()
		log_ll_grads = zip(*[
			autograd.grad(l, 
			self.parameters(), 
			retain_graph=(i < len(log_ll))) for i, l in enumerate(log_ll, 1)])
		log_ll_grads = [torch.stack(gs) for gs in log_ll_grads]
		fisher_diagonals = [(g ** 2).mean(0) for g in log_ll_grads]
		param_names = [n.replace('.', '__') for n, p in self.named_parameters()]
		return {n: f.detach() for n, f in zip(param_names, fisher_diagonals)}


	def consolidate(self, fisher):
		for n, p in self.named_parameters():
			n = n.replace('.', '__')
			self.register_buffer('{}_mean'.format(n), p.data.clone())
			self.register_buffer('{}_fisher'.format(n), fisher[n].data.clone())


	def ewc_loss(self, device):
		try:
			losses = []
			for n, p in self.named_parameters():
				# retrieve the consolidated mean and fisher information.
				n = n.replace('.', '__')
				mean = getattr(self, '{}_mean'.format(n))
				fisher = getattr(self, '{}_fisher'.format(n))
				
				# wrap mean and fisher in variables.
				# mean = Variable(mean)
				# fisher = Variable(fisher)
				
				# calculate a ewc loss. (assumes the parameter's prior as
				# gaussian distribution with the estimated mean and the
				# estimated cramer-rao lower bound variance, which is
				# equivalent to the inverse of fisher information)
				losses.append((fisher * (p - mean) ** 2).sum())
			
			return (self.lamda / 2) * sum(losses)
		
		except AttributeError:
			# ewc loss is 0 if there's no consolidated parameters.
			return torch.zeros(1).to(device)



def build_model(model_config, data_config, device):

	available_labels = data_config['available_labels']
	image_size = data_config['image_size']
	lr = model_config['lr']
	kernel_size = model_config['kernel']
	momentum = model_config['momentum']
	n_hidden = model_config['n_hidden']
	n_nodes = model_config['n_nodes']

	sample_size = model_config['sample_size']
	lamda = model_config['lambda']
	
	if model_config['type'] == 'fc':
		model = FC_EWC(n_hidden=n_hidden, n_nodes=n_nodes, 
			available_labels=available_labels, image_size=image_size, 
			sample_size=sample_size, lamba=lamda).to(device)
	else:
		model = FC_CNN_EWC(n_hidden=n_hidden, n_nodes=n_nodes,
			available_labels=available_labels, kernel_size=kernel_size,
			sample_size=sample_size, lamba=lamda).to(device)

	optimizer = optim.SGD(model.parameters(), lr=lr, momentum=momentum)
	return model, optimizer



def train(model, optimizer, train_loader, epoch, log_interval, device, consolidate=True):
	model.train()
	running_loss = 0.0
	criterion = nn.CrossEntropyLoss()
	with tqdm(train_loader, unit='batch') as tepoch:  # include a progress bar
		tepoch.set_description(f"Epoch {epoch}")
		for batch_id, (imgs, labels) in enumerate(train_loader):

			optimizer.zero_grad()
			outputs = model(imgs)
			# loss_ce = F.nll_loss(outputs, labels)
			loss_ce = criterion(outputs, labels)
			loss_ewc = model.ewc_loss(device=device)
			loss = loss_ce + loss_ewc
			loss.backward()
			optimizer.step()

			if batch_id % log_interval == 0:
				print("Train Epoch: {} [{}/{} ({:.0f}%)]\tLoss: {:.6f}".format(
					epoch, 
					batch_id * len(imgs), 
					len(train_loader.dataset), 
					100. * batch_id / len(train_loader), 
					loss.item()))
			running_loss += loss.item()
			tepoch.set_postfix(loss=running_loss / len(tepoch))

		if consolidate:
			model.consolidate(model.estimate_fisher(train_loader, sample_size))
			print("Consolidate done.")



def test(model, test_loader, device):
	model.eval()
	test_loss = 0
	correct = 0
	accuracy = 0.
	with tqdm(test_loader, unit='batch') as tepoch:  # include a progress bar
		tepoch.set_description("Testing")
		with torch.no_grad():
			for imgs, labels in test_loader:
				imgs, labels = imgs.to(device), labels.to(device)
				outputs = model(imgs)
				test_loss += F.nll_loss(outputs, labels, size_average=False).item()
				preds = outputs.data.max(1, keepdim=True)[1]
				correct += preds.eq(labels.data.view_as(preds)).sum()
		test_loss /= len(test_loader.dataset)
		accuracy = correct / len(test_loader.dataset)
		print('\nTest set: Avg. loss: {:.4f}, Accuracy: {}/{} ({:.3f}%)\n'.format(
			test_loss, correct, len(test_loader.dataset), 100. * accuracy))
		tepoch.set_postfix(accuracy=accuracy.item())
	return accuracy







