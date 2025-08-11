#!/bin/bash
datacard_name="datacard_comb_sig_all_ggh.txt"
ws_path="my_workspace"
for out_index in {0..6}; do
    dir_name="out${out_index}_combined"
    mkdir -p "$dir_name"
    cp -f ${datacard_name} "$dir_name/"
    cp -f -r ${ws_path} "$dir_name/"
    cd "$dir_name/"
    text2workspace.py -m 125 datacard_comb_sig_all_ggh.txt
    combine -M Significance -d datacard_comb_sig_all_ggh.root -m 125 -n _signif_comb_ggh --cminDefaultMinimizerStrategy=0 -t -1 --toysFrequentist --expectSignal 1 --X-rtd FITTER_NEWER_GIVE_UP --X-rtd FITTER_BOUND --setParameters pdf_index_ggh=${out_index} --freezeParameters pdf_index_ggh --cminRunAllDiscreteCombinations --setParameterRanges r=0,10 --X-rtd MINIMIZER_freezeDisassociatedParams --cminDefaultMinimizerTolerance 0.01 --X-rtd MINIMIZER_MaxCalls=9999999 --X-rtd FAST_VERTICAL_MORPH > comb_expSignificance.log
    cd -
done

# for in_index in {0..6}; do
#     for out_index in {0..6}; do
#         dir_name="in${in_index}_out${out_index}_combined"
#         mkdir -p "$dir_name"
#         cp -f ${datacard_name} "$dir_name/"
#         cp -f -r ${ws_path} "$dir_name/"
        
#     done
# done
