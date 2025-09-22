#Documentation



## Generating impact plots
Since we're extracting impact plots with discrete parameters, we have to be a bit careful:

given `index_value` = 0, 1 or 2
NOTE: for expected impacts, add `-t -1`
```bash
text2workspace.py datacard_comb_sig_all_ggh.txt -m 125
combineTool.py -M Impacts -d  datacard_comb_sig_all_ggh.root -m 125 --doInitialFit --robustFit 1  --freezeParameters pdf_index_ggh --setParameters pdf_index_ggh={index_value} --cminDefaultMinimizerStrategy=0 --X-rtd MINIMIZER_freezeDisassociatedParams  --cminRunAllDiscreteCombinations --expectSignal 1 &> intial_fit.log 
combineTool.py -M Impacts -d  datacard_comb_sig_all_ggh.root -m 125 --doFits --robustFit 1  --freezeParameters pdf_index_ggh --setParameters pdf_index_ggh={index_value} --cminDefaultMinimizerStrategy=0 --X-rtd MINIMIZER_freezeDisassociatedParams  --cminRunAllDiscreteCombinations --parallel 20 --expectSignal 1 &> doFits.log
combineTool.py -M Impacts -d datacard_comb_sig_all_ggh.root -m 125 -o impacts_allyears.json
plotImpacts.py -i impacts_allyears.json -o impacts_allyears
```


For plotting the combined NLL curve, do this:

```
sh nll.sh
```
