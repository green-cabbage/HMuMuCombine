#Documentation

# Doing scans
We first assume that bias fit test from copperheadV2 is done. Look at the directory's doc for instructions.

## Step0: copy the workspace and datacard
copy the relevant datacard and stage3 outputs to `my_workspace`. We will assume the datacard name for the example setting is `datacard_comb_sig_all_ggh.txt`


## Step1: get expected significance from data

Run:
```bash
sh getExpSigs.sh
python aggregate_results.py
```

This will generated expected significance for each core-function and then extract and save it to `exp_sigs.csv`

## Step2: get bias Scan for each core function

This would take lots of computing resources, so we use slurm. The script to use is:

```bash
sh slurm_wrapper.sh

```
then extract the results via:
```bash
python aggregate_bias_pull_fitDiagnostics.py
```


