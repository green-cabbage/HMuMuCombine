#!/bin/bash

# pdf_index="0"
# pdf_index="1"
pdf_index="2"
text2workspace.py datacard_comb_sig_all_ggh.txt -m 125 
combineTool.py -M Impacts -d  datacard_comb_sig_all_ggh.root -m 125 -t -1 --expectSignal 1 --setParameterRanges r=-1,3 --doInitialFit --robustFit 1  --freezeParameters pdf_index_ggh --setParameters pdf_index_ggh=${pdf_index} --cminDefaultMinimizerStrategy=0 --X-rtd MINIMIZER_freezeDisassociatedParams   &> intial_fit.log 
combineTool.py -M Impacts -d  datacard_comb_sig_all_ggh.root -m 125 -t -1 --expectSignal 1 --setParameterRanges r=-1,3 --doFits --robustFit 1  --freezeParameters pdf_index_ggh --setParameters pdf_index_ggh=${pdf_index} --cminDefaultMinimizerStrategy=0 --X-rtd MINIMIZER_freezeDisassociatedParams  --parallel 60 &> doFits.log
# combineTool.py -M Impacts -d  datacard_comb_sig_all_ggh.root -m 125 -t -1 --expectSignal 1 --setParameterRanges r=0,2 --doInitialFit --robustFit 1  --freezeParameters pdf_index_ggh --setParameters pdf_index_ggh=${pdf_index} --cminDefaultMinimizerStrategy=0 --X-rtd MINIMIZER_freezeDisassociatedParams   &> intial_fit.log 
# combineTool.py -M Impacts -d  datacard_comb_sig_all_ggh.root -m 125 -t -1 --expectSignal 1 --setParameterRanges r=0,2 --doFits --robustFit 1  --freezeParameters pdf_index_ggh --setParameters pdf_index_ggh=${pdf_index} --cminDefaultMinimizerStrategy=0 --X-rtd MINIMIZER_freezeDisassociatedParams  --parallel 60 &> doFits.log
combineTool.py -M Impacts -d datacard_comb_sig_all_ggh.root -m 125 -o impacts_allyears.json
plotImpacts.py -i impacts_allyears.json -o impacts_allyears
