import os
import pandas as pd
import numpy as np
import time
import torch
from torch import optim
import argparse
from tqdm import tqdm

from options import general_options, data_options, model_options
from datasets_mnist import MNIST_dataset
from exp1 import exp1_nn, exp1_cobweb
from exp2 import exp2_nn, exp2_cobweb


def checkattr(args, attr):
	'''
	Check whether attribute exists, whether it's a boolean and whether its value is True.
	'''
	return hasattr(args, attr) and type(getattr(args, attr)) == bool and getattr(args, attr)


def accuracy2csv(general_config, model_config, data_config, test_accs, specific_name=False):
	"""
	Output test accuracies from an experiment to a csv file.
	"""

	model = model_config['type']
	if model == 'cobweb':
		model = 'cobweb4v'
	seed = general_config['seed']
	label = general_config['label']
	experiment = general_config['type']
	n_split = data_config['n_split']
	if data_config['n_split_trained'] is not None:
		n_split = data_config['n_split_trained']


	# Experiment 1: Output the asymptotic performance only.
	if experiment == 1 and general_config['exp1_type'] == 'asymptotic':
		data = {
		'TrainSet': "D6000",
		'TestSet': "All",
		'Model': model,
		'Seed': seed,
		'Experiment': experiment,
		'TestAccuracy': test_accs,
		}
		if model != 'cobweb4v':
			if model_config['ewc']:
				data['nn-ver'] = model_config['nn_ver'] + '-ewc'
			elif model_config['replay']:
				data['nn-ver'] = model_config['nn_ver'] + '-replay'
			else:
				data['nn-ver'] = model_config['nn_ver']

	else:
		# Any other case:

		trainset = []
		test = general_config['test']
		if test == 'all':
			n_test_set = 11
		elif test == 'rest':
			n_test_set = 9
		else:
			n_test_set = 1

		if specific_name:
			if experiment == 0:
				for i in range(1, n_split + 1):
					trainset += ["S%d" % i] * n_test_set
			elif experiment == 1 or experiment == 2:
				for i in range(0, n_split):
					trainset += ["S%d" % i] * n_test_set
			elif experiment == 3:
				n_relearning = data_config['n_relearning']
				for i in range(0, n_split - n_relearning):
					trainset += ["S%d" % i] * n_test_set
				for i in range(1, n_relearning + 1):
					trainset += ["R%d" % i] * n_test_set
			else:
				n_relearning = data_config['n_relearning']
				middle_split = n_split // 2
				if n_relearning % 2 != 0:
					index_start_relearning = int(middle_split - (n_relearning // 2))
				else:
					index_start_relearning = int(middle_split - (n_relearning / 2 - 1))
				for i in range(0, index_start_relearning):
					trainset += ["S%d" % i] * n_test_set
				for i in range(1, n_relearning + 1):
					trainset += ["R%d" % i] * n_test_set
				for i in range(n_split - n_relearning - index_start_relearning):
					trainset += ["S%d" % (i + index_start_relearning)] * n_test_set
		else:
			for i in range(1, n_split + 1):
				trainset += ["D%d" % i] * n_test_set
		
		if test == 'entire':
			testset = ['All']
		elif test == 'chosen':
			testset = ["L0"]
		elif test == 'rest':
			testset = [f"L{i}" for i in range(1, 10)]
		else:
			testset = [f"L{i}" for i in range(10)]
			testset[label] = "L0"
			for i in range(len(testset)):
				if i != label:
					testset[i] = f"L{i + 1}"
				else:
					break
			testset.append("All")
		testset = testset * n_split

		data = {
		'TrainSet': trainset,
		'TestSet': testset,
		'Model': [model] * len(trainset),
		'Seed': [seed] * len(trainset),
		'Experiment': [experiment] * len(trainset),
		'TestAccuracy': test_accs,
		}

		if model != 'cobweb4v':
			if model_config['ewc']:
				data['nn-ver'] = [model_config['nn_ver'] + '-ewc'] * len(trainset)
			elif model_config['replay']:
				data['nn-ver'] = [model_config['nn_ver'] + '-replay'] * len(trainset)
			else:
				data['nn-ver'] = [model_config['nn_ver']] * len(trainset)
	

	df = pd.DataFrame(data)

	folder_name = 'test_accs'
	experiment_name = f'exp{experiment}'

	if not os.path.exists(folder_name):
		os.makedirs(folder_name)
	folder_path = os.path.join(folder_name, experiment_name)
	if not os.path.exists(folder_path):
		os.makedirs(folder_path)

	if model != 'cobweb4v' and model_config['nn_ver'] != 'none':
		if model_config['ewc']:
			file_name = f"L{label}_{model}-{model_config['nn_ver']}_S{seed}_EWC.csv"
		elif model_config['replay']:
			file_name = f"L{label}_{model}-{model_config['nn_ver']}_S{seed}_replay.csv"
		else:
			file_name = f"L{label}_{model}-{model_config['nn_ver']}_S{seed}.csv"
	else:
		file_name = f"L{label}_{model}_S{seed}.csv"
	file_path = os.path.join(folder_path, file_name)
	df.to_csv(file_path, index=False)



def experiments(args):

	verbose = True

	general_config = {
	'type': args.experiment,
	'label': args.label,
	'seed': args.seed,
	'cuda': False,
	'test': args.test,
	'paper': False,
	'test_once': False,
	'exp1_type': args.exp1_type,
	}

	model_config = {
	'type': args.model_type,
	'lr': args.lr,
	'epoch': args.epoch,
	'log_interval': args.log_interval,
	'momentum': args.momentum,
	'kernel': args.kernel,
	'n_hidden': args.n_hidden,
	'n_nodes': args.n_nodes,
	'nn_ver': args.nn_ver,
	'ewc': False,
	'replay': False,
	'buffer_size': args.buffer_size,
	'cobweb_nodes': args.cobweb_nodes,
	'sample_size': args.ewc_sample_size,
	'lambda': args.ewc_lambda,
	}

	data_config = {
	# Basic info of the initial dataset:
	# 'dataset': args.dataset,
	'available_labels': 10,
	'image_size': 28,

	# Size of each dataset:
	'size_all_tr_each': args.size_all_tr_each,
	'n_split': args.n_split,
	'n_split_trained': args.n_split_trained,
	'relearning_split': args.relearning_split,

	# Other settings:
	'shuffle': True,
	'normalize': False,
	'batch_size_tr': args.batch_size_tr,
	'batch_size_te': args.batch_size_te,
	'drop_last': False,
	'pad': False,
	'permutation': False,
	}

	if checkattr(args, 'no_shuffle'):
		data_config['shuffle'] = False
	if checkattr(args, 'normalize'):
		data_config['normalize'] = True
	if checkattr(args, 'drop_last'):
		data_config['drop_last'] = True
	if checkattr(args, 'pad'):
		data_config['pad'] = True
	if checkattr(args, 'permutation'):
		data_config['permutation'] = True
	if checkattr(args, 'ewc'):
		model_config['ewc'] = True
	if checkattr(args, 'replay'):
		model_config['replay'] = True
	if checkattr(args, 'paper'):
		general_config['paper'] = True
	if checkattr(args, 'test_once'):
		general_config['test_once'] = True


	# Cuda:
	if torch.cuda.is_available():
		model_config['cuda'] = True
	if checkattr(args, 'no_cuda'):
		model_config['cuda'] = False
	device = torch.device("cuda" if general_config['cuda'] else "cpu")

	# Import initial MNIST dataset:
	dataset_tr = MNIST_dataset(split='train', 
		pad=data_config['pad'], 
		normalize=data_config['normalize'], 
		permutation=data_config['permutation'], 
		download=True, verbose=verbose)
	dataset_te = MNIST_dataset(split='test', 
		pad=data_config['pad'], 
		normalize=data_config['normalize'], 
		permutation=data_config['permutation'], 
		download=True, verbose=verbose)

	experiment = general_config['type']
	model_type = model_config['type']
	label = general_config['label']
	log_interval = model_config['log_interval']


	# If realizing the paper settings, do hyperparameters override:
	if general_config['paper']:

		if model_type != 'cobweb':
			model_config['n_hidden'] = 1
			model_config['n_nodes'] = 128
			model_config['epoch'] = 5
			model_config['momentum'] = 0.9
			model_config['lr'] = 0.0365 if model_config['nn_ver'] == 'fast' else 0.00365
		else:
			model_config['cobweb_nodes'] = 300

		if general_config['type'] == 1:
			general_config['test'] = 'entire'
			data_config['batch_size_tr'] = 5
			data_config['n_split'] = 6000
			if general_config['exp1_type'] == 'all':
				data_config['n_split_trained'] = 100
			else:
				data_config['n_split_trained'] = data_config['n_split']  # 6000
			if general_config['exp1_type'] == 'asymptotic' and model_type == 'cobweb':
				data_config['n_split'] = 1
				data_config['n_split_trained'] = 1

		if general_config['type'] == 2:
			general_config['test'] = 'chosen'
			data_config['batch_size_tr'] = 64
			model_config['buffer_size'] = 1000
			data_config['n_split'] = 10
			if model_config['replay']:
				model_config['buffer_size'] = 1000




	# Experiments:
	if experiment == 1:
		if model_type == 'cobweb':
			test_accs = exp1_cobweb(general_config, model_config, data_config, dataset_tr, dataset_te, verbose)
		else:
			test_accs = exp1_nn(general_config, model_config, data_config, dataset_tr, dataset_te, verbose)
	if experiment == 2:
		if model_type == 'cobweb':
			test_accs = exp2_cobweb(general_config, model_config, data_config, dataset_tr, dataset_te, verbose)
		else:
			test_accs = exp2_nn(general_config, model_config, data_config, dataset_tr, dataset_te, verbose)
	
	accuracy2csv(general_config, model_config, data_config, test_accs)


if __name__ == '__main__':

	parser = argparse.ArgumentParser("./main.py",
									 description="Run sets of experiments based on the MNIST dataset.")
	parser = general_options(parser)
	parser = data_options(parser)
	parser = model_options(parser)
	args = parser.parse_args()

	experiments(args)

