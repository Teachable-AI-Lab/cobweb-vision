#!/bin/bash

# Generate 6000 training splits (10 samples for each), and train with all the splits sequentially.
# After training with all the splits, test with the MNIST test set (so the model is evaluated only once)

python3 main.py --experiment=1 --model-type=cobweb --seed=123 --paper --exp1-type=asymptotic
python3 main.py --experiment=1 --model-type=cobweb --seed=456 --paper --exp1-type=asymptotic
python3 main.py --experiment=1 --model-type=cobweb --seed=789 --paper --exp1-type=asymptotic
python3 main.py --experiment=1 --model-type=cobweb --seed=0 --paper --exp1-type=asymptotic
python3 main.py --experiment=1 --model-type=cobweb --seed=50 --paper --exp1-type=asymptotic
python3 main.py --experiment=1 --model-type=cobweb --seed=150 --paper --exp1-type=asymptotic
python3 main.py --experiment=1 --model-type=cobweb --seed=250 --paper --exp1-type=asymptotic
python3 main.py --experiment=1 --model-type=cobweb --seed=350 --paper --exp1-type=asymptotic
python3 main.py --experiment=1 --model-type=cobweb --seed=450 --paper --exp1-type=asymptotic
python3 main.py --experiment=1 --model-type=cobweb --seed=550 --paper --exp1-type=asymptotic

python3 main.py --experiment=1 --model-type=fc --nn-ver=slow --seed=123 --paper --exp1-type=asymptotic
python3 main.py --experiment=1 --model-type=fc --nn-ver=slow --seed=456 --paper --exp1-type=asymptotic
python3 main.py --experiment=1 --model-type=fc --nn-ver=slow --seed=789 --paper --exp1-type=asymptotic
python3 main.py --experiment=1 --model-type=fc --nn-ver=slow --seed=0 --paper --exp1-type=asymptotic
python3 main.py --experiment=1 --model-type=fc --nn-ver=slow --seed=50 --paper --exp1-type=asymptotic
python3 main.py --experiment=1 --model-type=fc --nn-ver=slow --seed=150 --paper --exp1-type=asymptotic
python3 main.py --experiment=1 --model-type=fc --nn-ver=slow --seed=250 --paper --exp1-type=asymptotic
python3 main.py --experiment=1 --model-type=fc --nn-ver=slow --seed=350 --paper --exp1-type=asymptotic
python3 main.py --experiment=1 --model-type=fc --nn-ver=slow --seed=450 --paper --exp1-type=asymptotic
python3 main.py --experiment=1 --model-type=fc --nn-ver=slow --seed=550 --paper --exp1-type=asymptotic

python3 main.py --experiment=1 --model-type=fc-cnn --nn-ver=slow --seed=123 --paper --exp1-type=asymptotic
python3 main.py --experiment=1 --model-type=fc-cnn --nn-ver=slow --seed=456 --paper --exp1-type=asymptotic
python3 main.py --experiment=1 --model-type=fc-cnn --nn-ver=slow --seed=789 --paper --exp1-type=asymptotic
python3 main.py --experiment=1 --model-type=fc-cnn --nn-ver=slow --seed=0 --paper --exp1-type=asymptotic
python3 main.py --experiment=1 --model-type=fc-cnn --nn-ver=slow --seed=50 --paper --exp1-type=asymptotic
python3 main.py --experiment=1 --model-type=fc-cnn --nn-ver=slow --seed=150 --paper --exp1-type=asymptotic
python3 main.py --experiment=1 --model-type=fc-cnn --nn-ver=slow --seed=250 --paper --exp1-type=asymptotic
python3 main.py --experiment=1 --model-type=fc-cnn --nn-ver=slow --seed=350 --paper --exp1-type=asymptotic
python3 main.py --experiment=1 --model-type=fc-cnn --nn-ver=slow --seed=450 --paper --exp1-type=asymptotic
python3 main.py --experiment=1 --model-type=fc-cnn --nn-ver=slow --seed=550 --paper --exp1-type=asymptotic

