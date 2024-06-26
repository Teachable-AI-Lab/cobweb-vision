import torch
from cobweb.cobweb_torch import CobwebTorchTree
from datasets_mnist import dataloaders_2, dataloaders_2_replay
import models_nn, models_nn_ewc, models_cobweb


def reconfig(general_config, model_config, data_config):
	"""
	Re-initialization for model_config and data_config based on requirements of experiments 1.
	"""
	if model_config['type'] == 'cobweb':
		general_config['cuda'] == False
		data_config['batch_size_tr'] = 60000
		data_config['batch_size_te'] = 10000


def exp2_nn(general_config, model_config, data_config, dataset_tr, dataset_te, verbose):

	reconfig(general_config, model_config, data_config)
	label = general_config['label']
	size_all_tr_each = data_config['size_all_tr_each']
	ewc = model_config['ewc']

	# Dataloaders:
	if model_config['replay']:
		dataloaders = dataloaders_2_replay(general_config, data_config, dataset_tr, dataset_te, verbose=verbose, 
			buffer_size=model_config['buffer_size'])
	else:
		dataloaders = dataloaders_2(general_config, data_config, dataset_tr, dataset_te, verbose=verbose)
	loaders_tr = dataloaders.training_loaders
	loaders_te = dataloaders.test_loaders

	# Models and optimizers:
	device = torch.device("cuda" if general_config['cuda'] else "cpu")
	model_module = models_nn_ewc if ewc else models_nn
	model, optimizer = model_module.build_model(model_config, data_config, device)

	# Store the test accuracies
	test_accs = []

	if verbose:
		print('\n\n' + ' START EXPERIMENTS '.center(70, '~'))
		print("Experiments type: 2")
		print("Experiments description: Train all data from label {} and some data ({}) from each remaining label first,"
			" then train the rest with sequential splits.".format(label, size_all_tr_each))
		print("Number of Train-test trials:", len(loaders_tr))
		print("Model:", model_config['type'])  # fc or cnn
		print("Seed:", general_config['seed'])
		print("The selected label:", label)
		print("Epochs:", model_config['epoch'])
		print("Replay?", model_config['replay'])
		if model_config['replay']:
			print("Replay Buffer Size:", model_config['buffer_size'])
		print("\nModel overview:")
		print(model)
		print("\nOptimizer:")
		print(optimizer)
		print("\nCUDA is {}used.".format("" if general_config['cuda'] else "NOT "))
		if ewc:
			print("\n -> Continal learning technique: Applies EWC")

	for i in range(len(loaders_tr)):
		if verbose:
			print("\n\n" + " Trial {} ".format(i+1).center(70, '='))
		
		for epoch in range(1, model_config['epoch'] + 1):
			if verbose:
				print("\n\n [Epoch {}]".format(epoch))
				print("\n====> Model Training with labels {} <====".format(dataloaders.labels_tr[i]))
			model_module.train(model, optimizer, loaders_tr[i], epoch, model_config['log_interval'], device)
			
		for j in range(len(loaders_te)):
			if verbose:
				print("\n----> Model Testing with labels {} <----".format(dataloaders.labels_te[j]))
			acc = model_module.test(model, loaders_te[j], device)
			test_accs.append(acc.item())

	print("\n\nThis is the end of the experiments.")
	print("There are {} test accuracy data in total.".format(len(test_accs)))
	return test_accs


def exp2_cobweb(general_config, model_config, data_config, dataset_tr, dataset_te, verbose):

	reconfig(general_config, model_config, data_config)
	label = general_config['label']
	size_all_tr_each = data_config['size_all_tr_each']

	# Dataloaders:
	dataloaders = dataloaders_2(general_config, data_config, dataset_tr, dataset_te, verbose=verbose)
	loaders_tr = dataloaders.training_loaders
	loaders_te = dataloaders.test_loaders

	# Models and optimizers:
	example_imgs, _ = next(iter(loaders_tr[0]))
	use_mutual_info = model_config['use_mutual_info']
	acuity_cutoff = model_config['acuity_cutoff']
	use_kl = model_config['use_kl']
	model = CobwebTorchTree(shape=example_imgs.shape[1:], 
		use_info=use_mutual_info, acuity_cutoff=acuity_cutoff, use_kl=use_kl)

	# Store the test accuracies
	test_accs = []

	if verbose:
		print('\n\n' + ' START EXPERIMENTS '.center(70, '~'))
		print("Experiments type: 2")
		print("Experiments description: Train all data from label {} and some data ({}) from each remaining label first,"
			" then train the rest with sequential splits.".format(label, size_all_tr_each))
		print("Number of Train-test trials:", len(loaders_tr))
		print("Model:", model_config['type'])  # cobweb
		print("Seed:", general_config['seed'])
		print("The selected label:", label)
		print("\nCUDA is {}used.".format("" if general_config['cuda'] else "NOT "))

	for i in range(len(loaders_tr)):
		if verbose:
			print("\n\n" + " Trial {} ".format(i+1).center(70, '='))
			print("\n====> Model Training with labels {} <====".format(dataloaders.labels_tr[i]))
		models_cobweb.train(model, loaders_tr[i])
		
		for j in range(len(loaders_te)):
			if verbose:
				print("\n----> Model Testing with labels {} <----".format(dataloaders.labels_te[j]))
			acc = models_cobweb.test(model, loaders_te[j], model_config['predict_level'], model_config['cobweb_nodes'])
			print("Test accuracy: {}".format(acc))
			test_accs.append(acc)

	print("\n\nThis is the end of the experiments.")
	print("There are {} test accuracy data in total.".format(len(test_accs)))
	return test_accs
