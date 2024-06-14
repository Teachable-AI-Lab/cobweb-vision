from tqdm import tqdm
import torch


def train(tree, tr_loader):
	imgs, labels = next(iter(tr_loader))
	for i in tqdm(range(imgs.shape[0])):
		tree.ifit(imgs[i], labels[i].item())

def test(tree, te_loader, predict_level='multiple', max_nodes=300):
	imgs, labels = next(iter(te_loader))

	correct_prediction = 0
	for i in tqdm(range(imgs.shape[0])):
		actual_label = labels[i]

		if predict_level == 'multiple':
			pred = tree.predict_probs(imgs[i], None, max_nodes=max_nodes)
			out_label = sorted([(pred[l], l) for l in pred], reverse=True)[0][1]
		else:
			# o = tree.categorize(imgs[i])
			o = tree.categorize(imgs[i], use_best=False, greedy=True, max_nodes=float('inf'))
			if predict_level == 'single-leaf':
				out, out_label = o.predict()
			elif predict_level == 'single-basic':
				out, out_label = o.get_basic().predict()

		# o = tree.categorize(imgs[i])
		# out, out_label = o.predict()

		predicted_label = torch.tensor(out_label)
		# print(out, out_label, predicted_label, actual_label)
		# print(type(predicted_label), type(actual_label))
		if predicted_label == actual_label:
			correct_prediction += 1

	accuracy = correct_prediction / len(imgs)
	return accuracy
	