#!/bin/bash

# # core-PDF ----------------------
out_index="core"
for in_index in {0..2}; do
    sbatch slurm_setup.sub $in_index $out_index
done
# # core-PDF ----------------------
