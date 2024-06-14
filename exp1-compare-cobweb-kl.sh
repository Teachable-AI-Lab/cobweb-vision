#!/bin/bash

# ==============================================================================
# Experiment 1 - all

# python3 main.py --experiment=1 --model-type=cobweb --seed=123 --paper --exp1-type=all --compare-cobweb
# python3 main.py --experiment=1 --model-type=cobweb --seed=456 --paper --exp1-type=all --compare-cobweb
# python3 main.py --experiment=1 --model-type=cobweb --seed=789 --paper --exp1-type=all --compare-cobweb
# python3 main.py --experiment=1 --model-type=cobweb --seed=0 --paper --exp1-type=all --compare-cobweb
# python3 main.py --experiment=1 --model-type=cobweb --seed=50 --paper --exp1-type=all --compare-cobweb
# python3 main.py --experiment=1 --model-type=cobweb --seed=150 --paper --exp1-type=all --compare-cobweb
# python3 main.py --experiment=1 --model-type=cobweb --seed=250 --paper --exp1-type=all --compare-cobweb
# python3 main.py --experiment=1 --model-type=cobweb --seed=350 --paper --exp1-type=all --compare-cobweb
# python3 main.py --experiment=1 --model-type=cobweb --seed=450 --paper --exp1-type=all --compare-cobweb
# python3 main.py --experiment=1 --model-type=cobweb --seed=550 --paper --exp1-type=all --compare-cobweb

# python3 main.py --experiment=1 --model-type=cobweb --seed=123 --paper --exp1-type=all --compare-cobweb --acuity-cutoff
# python3 main.py --experiment=1 --model-type=cobweb --seed=456 --paper --exp1-type=all --compare-cobweb --acuity-cutoff
# python3 main.py --experiment=1 --model-type=cobweb --seed=789 --paper --exp1-type=all --compare-cobweb --acuity-cutoff
# python3 main.py --experiment=1 --model-type=cobweb --seed=0 --paper --exp1-type=all --compare-cobweb --acuity-cutoff
# python3 main.py --experiment=1 --model-type=cobweb --seed=50 --paper --exp1-type=all --compare-cobweb --acuity-cutoff
# python3 main.py --experiment=1 --model-type=cobweb --seed=150 --paper --exp1-type=all --compare-cobweb --acuity-cutoff
# python3 main.py --experiment=1 --model-type=cobweb --seed=250 --paper --exp1-type=all --compare-cobweb --acuity-cutoff
# python3 main.py --experiment=1 --model-type=cobweb --seed=350 --paper --exp1-type=all --compare-cobweb --acuity-cutoff
# python3 main.py --experiment=1 --model-type=cobweb --seed=450 --paper --exp1-type=all --compare-cobweb --acuity-cutoff
# python3 main.py --experiment=1 --model-type=cobweb --seed=550 --paper --exp1-type=all --compare-cobweb --acuity-cutoff

# python3 main.py --experiment=1 --model-type=cobweb --seed=123 --paper --exp1-type=all --compare-cobweb --no-mutual-info
# python3 main.py --experiment=1 --model-type=cobweb --seed=456 --paper --exp1-type=all --compare-cobweb --no-mutual-info
# python3 main.py --experiment=1 --model-type=cobweb --seed=789 --paper --exp1-type=all --compare-cobweb --no-mutual-info
# python3 main.py --experiment=1 --model-type=cobweb --seed=0 --paper --exp1-type=all --compare-cobweb --no-mutual-info
# python3 main.py --experiment=1 --model-type=cobweb --seed=50 --paper --exp1-type=all --compare-cobweb --no-mutual-info
# python3 main.py --experiment=1 --model-type=cobweb --seed=150 --paper --exp1-type=all --compare-cobweb --no-mutual-info
# python3 main.py --experiment=1 --model-type=cobweb --seed=250 --paper --exp1-type=all --compare-cobweb --no-mutual-info
# python3 main.py --experiment=1 --model-type=cobweb --seed=350 --paper --exp1-type=all --compare-cobweb --no-mutual-info
# python3 main.py --experiment=1 --model-type=cobweb --seed=450 --paper --exp1-type=all --compare-cobweb --no-mutual-info
# python3 main.py --experiment=1 --model-type=cobweb --seed=550 --paper --exp1-type=all --compare-cobweb --no-mutual-info

# python3 main.py --experiment=1 --model-type=cobweb --seed=123 --paper --exp1-type=all --compare-cobweb --acuity-cutoff --no-mutual-info
# python3 main.py --experiment=1 --model-type=cobweb --seed=456 --paper --exp1-type=all --compare-cobweb --acuity-cutoff --no-mutual-info
# python3 main.py --experiment=1 --model-type=cobweb --seed=789 --paper --exp1-type=all --compare-cobweb --acuity-cutoff --no-mutual-info
# python3 main.py --experiment=1 --model-type=cobweb --seed=0 --paper --exp1-type=all --compare-cobweb --acuity-cutoff --no-mutual-info
# python3 main.py --experiment=1 --model-type=cobweb --seed=50 --paper --exp1-type=all --compare-cobweb --acuity-cutoff --no-mutual-info
# python3 main.py --experiment=1 --model-type=cobweb --seed=150 --paper --exp1-type=all --compare-cobweb --acuity-cutoff --no-mutual-info
# python3 main.py --experiment=1 --model-type=cobweb --seed=250 --paper --exp1-type=all --compare-cobweb --acuity-cutoff --no-mutual-info
# python3 main.py --experiment=1 --model-type=cobweb --seed=350 --paper --exp1-type=all --compare-cobweb --acuity-cutoff --no-mutual-info
# python3 main.py --experiment=1 --model-type=cobweb --seed=450 --paper --exp1-type=all --compare-cobweb --acuity-cutoff --no-mutual-info
# python3 main.py --experiment=1 --model-type=cobweb --seed=550 --paper --exp1-type=all --compare-cobweb --acuity-cutoff --no-mutual-info

# ==============================================================================
# Experiment 1 - asymptotic

python3 main.py --experiment=1 --model-type=cobweb --seed=123 --paper --exp1-type=asymptotic --compare-cobweb
python3 main.py --experiment=1 --model-type=cobweb --seed=456 --paper --exp1-type=asymptotic --compare-cobweb
python3 main.py --experiment=1 --model-type=cobweb --seed=789 --paper --exp1-type=asymptotic --compare-cobweb
python3 main.py --experiment=1 --model-type=cobweb --seed=0 --paper --exp1-type=asymptotic --compare-cobweb
python3 main.py --experiment=1 --model-type=cobweb --seed=50 --paper --exp1-type=asymptotic --compare-cobweb
python3 main.py --experiment=1 --model-type=cobweb --seed=150 --paper --exp1-type=asymptotic --compare-cobweb
python3 main.py --experiment=1 --model-type=cobweb --seed=250 --paper --exp1-type=asymptotic --compare-cobweb
python3 main.py --experiment=1 --model-type=cobweb --seed=350 --paper --exp1-type=asymptotic --compare-cobweb
python3 main.py --experiment=1 --model-type=cobweb --seed=450 --paper --exp1-type=asymptotic --compare-cobweb
python3 main.py --experiment=1 --model-type=cobweb --seed=550 --paper --exp1-type=asymptotic --compare-cobweb

python3 main.py --experiment=1 --model-type=cobweb --seed=123 --paper --exp1-type=asymptotic --compare-cobweb --acuity-cutoff
python3 main.py --experiment=1 --model-type=cobweb --seed=456 --paper --exp1-type=asymptotic --compare-cobweb --acuity-cutoff
python3 main.py --experiment=1 --model-type=cobweb --seed=789 --paper --exp1-type=asymptotic --compare-cobweb --acuity-cutoff
python3 main.py --experiment=1 --model-type=cobweb --seed=0 --paper --exp1-type=asymptotic --compare-cobweb --acuity-cutoff
python3 main.py --experiment=1 --model-type=cobweb --seed=50 --paper --exp1-type=asymptotic --compare-cobweb --acuity-cutoff
python3 main.py --experiment=1 --model-type=cobweb --seed=150 --paper --exp1-type=asymptotic --compare-cobweb --acuity-cutoff
python3 main.py --experiment=1 --model-type=cobweb --seed=250 --paper --exp1-type=asymptotic --compare-cobweb --acuity-cutoff
python3 main.py --experiment=1 --model-type=cobweb --seed=350 --paper --exp1-type=asymptotic --compare-cobweb --acuity-cutoff
python3 main.py --experiment=1 --model-type=cobweb --seed=450 --paper --exp1-type=asymptotic --compare-cobweb --acuity-cutoff
python3 main.py --experiment=1 --model-type=cobweb --seed=550 --paper --exp1-type=asymptotic --compare-cobweb --acuity-cutoff

python3 main.py --experiment=1 --model-type=cobweb --seed=123 --paper --exp1-type=asymptotic --compare-cobweb --no-mutual-info
python3 main.py --experiment=1 --model-type=cobweb --seed=456 --paper --exp1-type=asymptotic --compare-cobweb --no-mutual-info
python3 main.py --experiment=1 --model-type=cobweb --seed=789 --paper --exp1-type=asymptotic --compare-cobweb --no-mutual-info
python3 main.py --experiment=1 --model-type=cobweb --seed=0 --paper --exp1-type=asymptotic --compare-cobweb --no-mutual-info
python3 main.py --experiment=1 --model-type=cobweb --seed=50 --paper --exp1-type=asymptotic --compare-cobweb --no-mutual-info
python3 main.py --experiment=1 --model-type=cobweb --seed=150 --paper --exp1-type=asymptotic --compare-cobweb --no-mutual-info
python3 main.py --experiment=1 --model-type=cobweb --seed=250 --paper --exp1-type=asymptotic --compare-cobweb --no-mutual-info
python3 main.py --experiment=1 --model-type=cobweb --seed=350 --paper --exp1-type=asymptotic --compare-cobweb --no-mutual-info
python3 main.py --experiment=1 --model-type=cobweb --seed=450 --paper --exp1-type=asymptotic --compare-cobweb --no-mutual-info
python3 main.py --experiment=1 --model-type=cobweb --seed=550 --paper --exp1-type=asymptotic --compare-cobweb --no-mutual-info

python3 main.py --experiment=1 --model-type=cobweb --seed=123 --paper --exp1-type=asymptotic --compare-cobweb --no-mutual-info --acuity-cutoff
python3 main.py --experiment=1 --model-type=cobweb --seed=456 --paper --exp1-type=asymptotic --compare-cobweb --no-mutual-info --acuity-cutoff
python3 main.py --experiment=1 --model-type=cobweb --seed=789 --paper --exp1-type=asymptotic --compare-cobweb --no-mutual-info --acuity-cutoff
python3 main.py --experiment=1 --model-type=cobweb --seed=0 --paper --exp1-type=asymptotic --compare-cobweb --no-mutual-info --acuity-cutoff
python3 main.py --experiment=1 --model-type=cobweb --seed=50 --paper --exp1-type=asymptotic --compare-cobweb --no-mutual-info --acuity-cutoff
python3 main.py --experiment=1 --model-type=cobweb --seed=150 --paper --exp1-type=asymptotic --compare-cobweb --no-mutual-info --acuity-cutoff
python3 main.py --experiment=1 --model-type=cobweb --seed=250 --paper --exp1-type=asymptotic --compare-cobweb --no-mutual-info --acuity-cutoff
python3 main.py --experiment=1 --model-type=cobweb --seed=350 --paper --exp1-type=asymptotic --compare-cobweb --no-mutual-info --acuity-cutoff
python3 main.py --experiment=1 --model-type=cobweb --seed=450 --paper --exp1-type=asymptotic --compare-cobweb --no-mutual-info --acuity-cutoff
python3 main.py --experiment=1 --model-type=cobweb --seed=550 --paper --exp1-type=asymptotic --compare-cobweb --no-mutual-info --acuity-cutoff

python3 main.py --experiment=1 --model-type=cobweb --seed=123 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-leaf
python3 main.py --experiment=1 --model-type=cobweb --seed=456 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-leaf
python3 main.py --experiment=1 --model-type=cobweb --seed=789 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-leaf
python3 main.py --experiment=1 --model-type=cobweb --seed=0 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-leaf
python3 main.py --experiment=1 --model-type=cobweb --seed=50 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-leaf
python3 main.py --experiment=1 --model-type=cobweb --seed=150 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-leaf
python3 main.py --experiment=1 --model-type=cobweb --seed=250 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-leaf
python3 main.py --experiment=1 --model-type=cobweb --seed=350 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-leaf
python3 main.py --experiment=1 --model-type=cobweb --seed=450 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-leaf
python3 main.py --experiment=1 --model-type=cobweb --seed=550 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-leaf

python3 main.py --experiment=1 --model-type=cobweb --seed=123 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-basic
python3 main.py --experiment=1 --model-type=cobweb --seed=456 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-basic
python3 main.py --experiment=1 --model-type=cobweb --seed=789 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-basic
python3 main.py --experiment=1 --model-type=cobweb --seed=0 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-basic
python3 main.py --experiment=1 --model-type=cobweb --seed=50 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-basic
python3 main.py --experiment=1 --model-type=cobweb --seed=150 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-basic
python3 main.py --experiment=1 --model-type=cobweb --seed=250 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-basic
python3 main.py --experiment=1 --model-type=cobweb --seed=350 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-basic
python3 main.py --experiment=1 --model-type=cobweb --seed=450 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-basic
python3 main.py --experiment=1 --model-type=cobweb --seed=550 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-basic

python3 main.py --experiment=1 --model-type=cobweb --seed=123 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-leaf --acuity-cutoff
python3 main.py --experiment=1 --model-type=cobweb --seed=456 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-leaf --acuity-cutoff
python3 main.py --experiment=1 --model-type=cobweb --seed=789 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-leaf --acuity-cutoff
python3 main.py --experiment=1 --model-type=cobweb --seed=0 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-leaf --acuity-cutoff
python3 main.py --experiment=1 --model-type=cobweb --seed=50 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-leaf --acuity-cutoff
python3 main.py --experiment=1 --model-type=cobweb --seed=150 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-leaf --acuity-cutoff
python3 main.py --experiment=1 --model-type=cobweb --seed=250 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-leaf --acuity-cutoff
python3 main.py --experiment=1 --model-type=cobweb --seed=350 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-leaf --acuity-cutoff
python3 main.py --experiment=1 --model-type=cobweb --seed=450 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-leaf --acuity-cutoff
python3 main.py --experiment=1 --model-type=cobweb --seed=550 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-leaf --acuity-cutoff

python3 main.py --experiment=1 --model-type=cobweb --seed=123 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-basic --acuity-cutoff
python3 main.py --experiment=1 --model-type=cobweb --seed=456 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-basic --acuity-cutoff
python3 main.py --experiment=1 --model-type=cobweb --seed=789 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-basic --acuity-cutoff
python3 main.py --experiment=1 --model-type=cobweb --seed=0 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-basic --acuity-cutoff
python3 main.py --experiment=1 --model-type=cobweb --seed=50 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-basic --acuity-cutoff
python3 main.py --experiment=1 --model-type=cobweb --seed=150 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-basic --acuity-cutoff
python3 main.py --experiment=1 --model-type=cobweb --seed=250 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-basic --acuity-cutoff
python3 main.py --experiment=1 --model-type=cobweb --seed=350 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-basic --acuity-cutoff
python3 main.py --experiment=1 --model-type=cobweb --seed=450 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-basic --acuity-cutoff
python3 main.py --experiment=1 --model-type=cobweb --seed=550 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-basic --acuity-cutoff

python3 main.py --experiment=1 --model-type=cobweb --seed=123 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-leaf --no-mutual-info
python3 main.py --experiment=1 --model-type=cobweb --seed=456 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-leaf --no-mutual-info
python3 main.py --experiment=1 --model-type=cobweb --seed=789 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-leaf --no-mutual-info
python3 main.py --experiment=1 --model-type=cobweb --seed=0 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-leaf --no-mutual-info
python3 main.py --experiment=1 --model-type=cobweb --seed=50 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-leaf --no-mutual-info
python3 main.py --experiment=1 --model-type=cobweb --seed=150 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-leaf --no-mutual-info
python3 main.py --experiment=1 --model-type=cobweb --seed=250 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-leaf --no-mutual-info
python3 main.py --experiment=1 --model-type=cobweb --seed=350 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-leaf --no-mutual-info
python3 main.py --experiment=1 --model-type=cobweb --seed=450 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-leaf --no-mutual-info
python3 main.py --experiment=1 --model-type=cobweb --seed=550 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-leaf --no-mutual-info

python3 main.py --experiment=1 --model-type=cobweb --seed=123 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-basic --no-mutual-info
python3 main.py --experiment=1 --model-type=cobweb --seed=456 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-basic --no-mutual-info
python3 main.py --experiment=1 --model-type=cobweb --seed=789 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-basic --no-mutual-info
python3 main.py --experiment=1 --model-type=cobweb --seed=0 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-basic --no-mutual-info
python3 main.py --experiment=1 --model-type=cobweb --seed=50 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-basic --no-mutual-info
python3 main.py --experiment=1 --model-type=cobweb --seed=150 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-basic --no-mutual-info
python3 main.py --experiment=1 --model-type=cobweb --seed=250 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-basic --no-mutual-info
python3 main.py --experiment=1 --model-type=cobweb --seed=350 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-basic --no-mutual-info
python3 main.py --experiment=1 --model-type=cobweb --seed=450 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-basic --no-mutual-info
python3 main.py --experiment=1 --model-type=cobweb --seed=550 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-basic --no-mutual-info

python3 main.py --experiment=1 --model-type=cobweb --seed=123 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-leaf --no-mutual-info --acuity-cutoff
python3 main.py --experiment=1 --model-type=cobweb --seed=456 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-leaf --no-mutual-info --acuity-cutoff
python3 main.py --experiment=1 --model-type=cobweb --seed=789 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-leaf --no-mutual-info --acuity-cutoff
python3 main.py --experiment=1 --model-type=cobweb --seed=0 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-leaf --no-mutual-info --acuity-cutoff
python3 main.py --experiment=1 --model-type=cobweb --seed=50 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-leaf --no-mutual-info --acuity-cutoff
python3 main.py --experiment=1 --model-type=cobweb --seed=150 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-leaf --no-mutual-info --acuity-cutoff
python3 main.py --experiment=1 --model-type=cobweb --seed=250 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-leaf --no-mutual-info --acuity-cutoff
python3 main.py --experiment=1 --model-type=cobweb --seed=350 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-leaf --no-mutual-info --acuity-cutoff
python3 main.py --experiment=1 --model-type=cobweb --seed=450 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-leaf --no-mutual-info --acuity-cutoff
python3 main.py --experiment=1 --model-type=cobweb --seed=550 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-leaf --no-mutual-info --acuity-cutoff

python3 main.py --experiment=1 --model-type=cobweb --seed=123 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-basic --no-mutual-info --acuity-cutoff
python3 main.py --experiment=1 --model-type=cobweb --seed=456 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-basic --no-mutual-info --acuity-cutoff
python3 main.py --experiment=1 --model-type=cobweb --seed=789 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-basic --no-mutual-info --acuity-cutoff
python3 main.py --experiment=1 --model-type=cobweb --seed=0 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-basic --no-mutual-info --acuity-cutoff
python3 main.py --experiment=1 --model-type=cobweb --seed=50 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-basic --no-mutual-info --acuity-cutoff
python3 main.py --experiment=1 --model-type=cobweb --seed=150 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-basic --no-mutual-info --acuity-cutoff
python3 main.py --experiment=1 --model-type=cobweb --seed=250 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-basic --no-mutual-info --acuity-cutoff
python3 main.py --experiment=1 --model-type=cobweb --seed=350 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-basic --no-mutual-info --acuity-cutoff
python3 main.py --experiment=1 --model-type=cobweb --seed=450 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-basic --no-mutual-info --acuity-cutoff
python3 main.py --experiment=1 --model-type=cobweb --seed=550 --paper --exp1-type=asymptotic --compare-cobweb --predict-level=single-basic --no-mutual-info --acuity-cutoff



