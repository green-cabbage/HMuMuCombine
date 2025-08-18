#Documentation

# Doing scans
We first assume that bias fit test from copperheadV2 is done. Look at the directory's doc for instructions.

## Step0: copy the workspace and datacard
copy the relevant datacard and stage3 outputs to `my_workspace`. We will assume the datacard name for the example setting is `datacard_comb_sig_all_ggh.txt`


## Step1: get NLL values

Run:
```bash
sh combine_wrapper.sh
```

## Step2: plot NLL values

Run
```bash
python aggregate_nll.py
```