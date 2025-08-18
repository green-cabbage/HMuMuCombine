#!/bin/bash

# text2workspace.py -m 125 datacard_comb_sig_all_ggh.txt 
# for index_val in {0..6}
# # for index_val in {0..1}
# do
#   echo "Running combine with pdf_index_ggh=${index_val}"
#   combine -M MultiDimFit -d datacard_comb_sig_all_ggh.txt \
#     --algo grid \
#     --setParameterRanges r=-1,5 \
#     --cminDefaultMinimizerStrategy 0 \
#     --saveNLL \
#     -n fixed_pdf_${index_val} \
#     -m 125 \
#     --setParameters pdf_index_ggh=${index_val} \
#     --freezeParameters pdf_index_ggh \
#     --X-rtd REMOVE_CONSTANT_ZERO_POINT=1 \
#     --points 10 # 20
# done

index_val="Envelope"
echo "Running combine with pdf_index_ggh=${index_val}"
combine -M MultiDimFit -d datacard_comb_sig_all_ggh.txt \
    --algo grid \
    --setParameterRanges r=-1,5 \
    --cminDefaultMinimizerStrategy 0 \
    --cminRunAllDiscreteCombinations \
    --saveNLL \
    -n fixed_pdf_${index_val} \
    -m 125 \
    --setParameters pdf_index_ggh=-1 \
    --X-rtd REMOVE_CONSTANT_ZERO_POINT=1 \
    --points 10 # 20