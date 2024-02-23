from tqdm import tqdm
import torch


def train(tree, tr_loader):
	imgs, labels = next(iter(tr_loader))
	for i in tqdm(range(imgs.shape[0])):
		tree.ifit(imgs[i], labels[i].item())

def test(tree, te_loader, max_nodes=300):
	imgs, labels = next(iter(te_loader))

	correct_prediction = 0
	for i in tqdm(range(imgs.shape[0])):
		actual_label = labels[i]

		# Dec 2023:
		pred = tree.predict_probs(imgs[i], None, max_nodes=max_nodes)
		out_label = sorted([(pred[l], l) for l in pred], reverse=True)[0][1]

		# o = tree.categorize(imgs[i])
		# out, out_label = o.predict()

		predicted_label = torch.tensor(out_label)
		# print(type(predicted_label), type(actual_label))
		if predicted_label == actual_label:
			correct_prediction += 1

	accuracy = correct_prediction / len(imgs)
	return accuracy
	