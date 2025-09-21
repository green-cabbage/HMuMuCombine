#Documentation

# Doing scans
We first assume that bias fit test from copperheadV2 is done. Look at the directory's doc for instructions.

## Step0: copy the workspace and datacard
copy the relevant datacard and stage3 outputs to `my_workspace`. We will assume the datacard name for the example setting is `datacard_comb_sig_all_ggh.txt`


## Step1: get bias Scan for each core function

This would take lots of computing resources, so we use slurm. The script to use is:

```bash
sh slurm_wrapper.sh

```
then extract the results via:
```bash
python aggregate_bias_pull_fitDiagnostics.py
```

The key difference between this and coreFuncScan is that when running fittDiagnostics, you don't freeze the pdf index, and the range of the index goes from 0-2, not 0-6
