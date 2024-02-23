#!/bin/bash

# Generate 6000 training splits (10 samples for each), 
# and train with the first 100 splits (1,000 samples in total) only.
# After training with each split, test the model with the entire MNIST test set (so test 100 times)

python3 main.py --experiment=1 --model-type=cobweb --seed=123 --paper --exp1-type=all
python3 main.py --experiment=1 --model-type=cobweb --seed=456 --paper --exp1-type=all
python3 main.py --experiment=1 --model-type=cobweb --seed=789 --paper --exp1-type=all
python3 main.py --experiment=1 --model-type=cobweb --seed=0 --paper --exp1-type=all
python3 main.py --experiment=1 --model-type=cobweb --seed=50 --paper --exp1-type=all
python3 main.py --experiment=1 --model-type=cobweb --seed=150 --paper --exp1-type=all
python3 main.py --experiment=1 --model-type=cobweb --seed=250 --paper --exp1-type=all
python3 main.py --experiment=1 --model-type=cobweb --seed=350 --paper --exp1-type=all
python3 main.py --experiment=1 --model-type=cobweb --seed=450 --paper --exp1-type=all
python3 main.py --experiment=1 --model-type=cobweb --seed=550 --paper --exp1-type=all

python3 main.py --experiment=1 --model-type=fc --nn-ver=slow --seed=123 --paper --exp1-type=all
python3 main.py --experiment=1 --model-type=fc --nn-ver=slow --seed=456 --paper --exp1-type=all
python3 main.py --experiment=1 --model-type=fc --nn-ver=slow --seed=789 --paper --exp1-type=all
python3 main.py --experiment=1 --model-type=fc --nn-ver=slow --seed=0 --paper --exp1-type=all
python3 main.py --experiment=1 --model-type=fc --nn-ver=slow --seed=50 --paper --exp1-type=all
python3 main.py --experiment=1 --model-type=fc --nn-ver=slow --seed=150 --paper --exp1-type=all
python3 main.py --experiment=1 --model-type=fc --nn-ver=slow --seed=250 --paper --exp1-type=all
python3 main.py --experiment=1 --model-type=fc --nn-ver=slow --seed=350 --paper --exp1-type=all
python3 main.py --experiment=1 --model-type=fc --nn-ver=slow --seed=450 --paper --exp1-type=all
python3 main.py --experiment=1 --model-type=fc --nn-ver=slow --seed=550 --paper --exp1-type=all

python3 main.py --experiment=1 --model-type=fc-cnn --nn-ver=slow --seed=123 --paper --exp1-type=all
python3 main.py --experiment=1 --model-type=fc-cnn --nn-ver=slow --seed=456 --paper --exp1-type=all
python3 main.py --experiment=1 --model-type=fc-cnn --nn-ver=slow --seed=789 --paper --exp1-type=all
python3 main.py --experiment=1 --model-type=fc-cnn --nn-ver=slow --seed=0 --paper --exp1-type=all
python3 main.py --experiment=1 --model-type=fc-cnn --nn-ver=slow --seed=50 --paper --exp1-type=all
python3 main.py --experiment=1 --model-type=fc-cnn --nn-ver=slow --seed=150 --paper --exp1-type=all
python3 main.py --experiment=1 --model-type=fc-cnn --nn-ver=slow --seed=250 --paper --exp1-type=all
python3 main.py --experiment=1 --model-type=fc-cnn --nn-ver=slow --seed=350 --paper --exp1-type=all
python3 main.py --experiment=1 --model-type=fc-cnn --nn-ver=slow --seed=450 --paper --exp1-type=all
python3 main.py --experiment=1 --model-type=fc-cnn --nn-ver=slow --seed=550 --paper --exp1-type=all


