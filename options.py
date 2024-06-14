"""
Define options.
"""

def general_options(parser):
	parser.add_argument('--experiment', type=int, default=1, choices=[1, 2], help='type of experiments')
	parser.add_argument('--label', type=lambda x: int(x) if x.isdigit() else x, default=0, 
		help='the label to be separated from in the experiments')
	parser.add_argument('--no-cuda', action='store_true', help='do NOT use cuda (even if the condition holds)')
	parser.add_argument('--test', type=str, default='all', choices=['all', 'chosen', 'rest', 'entire'], 
		help='The test set geenrated in every collection of test sets')
	parser.add_argument('--paper', action='store_true', help='setting up all options for the experiment in the original paper (CogSci-24)')
	parser.add_argument('--exp1-type', type=str, default='all', choices=['all', 'asymptotic'], 
		help='when running experiment 1, after obtaining all the training splits, you can either test the performance after training on each split (all), \
		or test after training all splits (asymptotic)')
	parser.add_argument('--test-once', action='store_true', help='only test the trained model with the test data after the last training split')
	parser.add_argument('--compare-cobweb', action='store_true', help='indicate that the experiment is used to compare configurations within Cobweb,\
		and the output csv will include the information of the cobweb configurations')
	return parser


def data_options(parser):
	parser.add_argument('--no-shuffle', action='store_true', help='do NOT shuffle the data when generating a dataset')
	parser.add_argument('--normalize', action='store_true', help='normalize every data')
	parser.add_argument('--seed', type=int, default=123, help='random seed')
	parser.add_argument('--n-split', type=int, default=10, help='the number of training splits in an experiment')
	parser.add_argument('--batch-size-tr', type=int, default=64, help='batch size of every training data loader')
	parser.add_argument('--batch-size-te', type=int, default=64, help='batch size of every test data loader')
	parser.add_argument('--pad', action='store_true', help='whether pad each image by 2 pixels')
	parser.add_argument('--drop-last', action='store_true', 
		help='whether drop the last batch if its size is less than batch size')
	parser.add_argument('--permutation', action='store_true', help='whether permute the pixels of all images')
	parser.add_argument('--size-all-tr-each', type=int, default=600, 
		help='the size of training data from each label that forms the concatenated training set (which has the size n_label * size_all_tr_each)')
	parser.add_argument('--relearning-split', nargs='*', type=int, default=None, 
		help='a series of indices of splits that used as relearning splits')
	parser.add_argument('--n-split-trained', type=int,
		help='the number of splits used as training splits. so if it is n, the first n splits are used as training splits. may be different from the variable n_split')
	return parser


def model_options(parser):
	parser.add_argument('--model-type', type=str, default='cobweb', choices=['cobweb', 'fc', 'fc-cnn'], 
		help='type of approach')
	parser.add_argument('--nn-ver', type=str, default='none', choices=['fast', 'slow', 'none'], 
		help='version of neural network. A choice other than "none" overrides the hyperparams automatically')
	parser.add_argument('--lr', type=float, default=0.01, help='learning rate')
	parser.add_argument('--epoch', type=int, default=1, help='# of epochs of training (applied to NN approaches only)')
	parser.add_argument('--log-interval', type=int, default=10, help='size of log interval')
	parser.add_argument('--momentum', type=float, default=0.5, help='the value of momentum parameter in optimizer SGD')
	parser.add_argument('--kernel', type=int, default=5, help='kernel size of the CNN model layers')
	parser.add_argument('--n-hidden', type=int, default=1, help='# of fc hidden layers in an NN model')
	parser.add_argument('--n-nodes', type=int, default=100, help='# of nodes in each fc hidden layer in an NN model')
	parser.add_argument('--ewc', action='store_true', help='if employing the EWC regularization technique')
	parser.add_argument('--replay', action='store_true', help='if employing the naïve replay technique')
	parser.add_argument('--buffer-size', type=int, default=1000, help='the buffer size if employing the naïve replay technique')
	parser.add_argument('--cobweb-nodes', type=int, default=300, 
		help='the maximum number of nodes considered in predictions resembling for Cobweb/4V')
	parser.add_argument('--ewc-sample-size', type=int, default=1024, help='the sample size when employing the EWC technique')
	parser.add_argument('--ewc-lambda', type=int, default=100, help='the value of lambda when employing the EWC technique')
	parser.add_argument('--acuity-cutoff', action='store_true', help='do acuity cutoff in the Cobweb tree (align to original Cobweb/3)')
	parser.add_argument('--no-mutual-info', action='store_true', help='use probabilistic CU instead of mutual information CU in Cobweb tree')
	parser.add_argument('--predict-level', type=str, default='multiple', choices=['single-leaf', 'single-basic'], help='way of prediction in cobweb tree')
	parser.add_argument('--no-kl', action='store_true', help='do not use KL divergence')
	return parser



