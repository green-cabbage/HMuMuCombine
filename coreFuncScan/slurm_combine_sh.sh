#!/bin/sh
# setup env -----------------------------------------------------------
ulimit -s unlimited
set -e
cd /depot/cms/private/users/yun79/combine/CMSSW_14_1_0_pre4/src
export SCRAM_ARCH=el8_amd64_gcc12
source /cvmfs/cms.cern.ch/cmsset_default.sh
eval `scramv1 runtime -sh`
# slurm_dir=slurmJob_$1
# slurm_path=/depot/cms/users/yun79/hig-19-006-datacards/ggH/HMuMuCombine/${slurm_dir}
# mkdir -p ${slurm_path}
# # cd /depot/cms/users/yun79/hig-19-006-datacards/ggH/HMuMuCombine/${slurm_dir}
# cd /depot/cms/users/yun79/hig-19-006-datacards/ggH/HMuMuCombine/${slurm_dir}
#-----------------------------------------------------------


ntoys="10"
nGeneratedToys="10"
# true_idx="1"
# out_idx="core"
true_idx=$3
out_idx=$4
minStrat="0"
# Use arithmetic expansion to perform the modulo operation
if (( $1 % 2 == 0 )); then
  random_seed="$1${2:0:3}"
else
  random_seed="${2:0:3}$1"
fi
# random_seed=$1${$2:0:2}

cat="all"

slurm_dir=slurmJobs/slurmJob_in${true_idx}_out${out_idx}_${1}_${2}
# slurm_path=/depot/cms/users/yun79/hig-19-006-datacards/ggH/HMuMuCombine/${slurm_dir}
start_dir=/depot/cms/users/yun79/hig-19-006-datacards/ggH/HMuMuCombine/coreFuncScan
slurm_path=${start_dir}/${slurm_dir}
datacard_name="datacard_comb_sig_all_ggh.txt"
ws_path="my_workspace"

mkdir -p ${slurm_path}

cd ${start_dir}
cp -f ${datacard_name} ${slurm_path}
cp -f -r ${ws_path} ${slurm_path}
echo "slurm_path: ${slurm_path}"
cd ${slurm_path}
# text2workspace.py -m 125 datacard_comb_sig_${cat}_ggh.txt 
# cp ../../datacard_comb_sig_${cat}_ggh.root .
# echo "random_seed: ${random_seed}"
# echo "slurm_dir: ${slurm_dir}"

# combineTool.py datacard_comb_sig_${cat}_ggh.root -M GenerateOnly -m 125 --setParameters pdf_index_ggh=${true_idx} -t ${nGeneratedToys}  --expectSignal 1 --saveToys -m 125 --freezeParameters pdf_index_ggh --X-rtd MINIMIZER_MaxCalls=20000000000 -s ${random_seed}
# time(combineTool.py datacard_comb_sig_${cat}_ggh.root -M FitDiagnostics   -m 125 --toysFile higgsCombine.Test.GenerateOnly.mH125.${random_seed}.root   -t ${ntoys}  --expectSignal 1  --rMin -20 --rMax 20  --cminDefaultMinimizerStrategy=${minStrat}  --cminRunAllDiscreteCombinations --X-rtd MINIMIZER_MaxCalls=20000000000 -n bias_in${true_idx}_out${out_idx}_nToys${ntoys}_${cat}_minStrat${minStrat}_asimovDataset)
