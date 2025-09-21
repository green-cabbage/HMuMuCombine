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

NOTE: if the NLL curves looks jaggy, that could mean that that the fit parameter range is too large, and it would be fixed once the range is more constrained around the fit values.