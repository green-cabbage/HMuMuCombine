#!/bin/bash

# for in_index in {0..6}; do
#     for out_index in {0..6}; do
for in_index in {0..1}; do
    for out_index in {0..2}; do
        sbatch slurm_setup.sub $in_index $out_index
    done
done
