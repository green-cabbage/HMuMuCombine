import ROOT
import numpy as np
import argparse
import glob
ROOT.gROOT.SetBatch(True)
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

def extractNLL(fname):
    f = ROOT.TFile(fname)
    t = f.Get("limit")
    # t.Print("V")

    sigma_values = np.array([])
    NLL_vals = []
    r_vals = [] 
    for i_toy in range(t.GetEntries()):
        if i_toy ==0: # skip first value
            continue
        t.GetEntry(i_toy)
        r = getattr(t, "r")
        deltaNLL = getattr(t, "deltaNLL")
        nll = getattr(t, "nll")
        nll0 = getattr(t, "nll0")
        NLL_val = 2*(deltaNLL+nll+nll0)
        NLL_vals.append(NLL_val)
        r_vals.append(r)

    return np.array(r_vals), np.array(NLL_vals)



cat_map = {
    0 : "BWZRedux",
    1 : "BwzGamma",
    2 : "BWZxBern",
    3 : "sumExp",
    4 : "PowerLaw",
    5 : "FEWZxBern",
    6 : "LandauxBern",
    "Envelope": "Envelope",
}

if __name__ == "__main__":
    plt.figure(figsize=(6,4)) # intialize the plot canvas

    cat_len = 7
    total_NLL_vals = []
    # categories = list(range(cat_len)) + ["Envelope"]
    categories = list(range(cat_len)) 
    for ix in categories:
        fname = f"higgsCombinefixed_pdf_{ix}.MultiDimFit.mH125.root"
        # fname = f"Aug17_2025/higgsCombinefixed_pdf_{ix}.MultiDimFit.mH125.root"
        print(fname)
        r_vals, NLL_vals = extractNLL(fname)
        # Plot
        label = cat_map[ix]
        print(f"ix {ix} r_vals: {r_vals}")
        print(f"ix {ix} NLL_vals: {NLL_vals}")
        if ix == "Envelope":
            plt.plot(r_vals, NLL_vals, linestyle='--', color="black", label=label)
        else:
            plt.plot(r_vals, NLL_vals, linestyle='-',  label=label)
        total_NLL_vals.extend(NLL_vals)

    min_nll = np.array(total_NLL_vals).min()
    max_nll = np.array(total_NLL_vals).max()
    plt.legend()
    plt.xlim(-5, 10)
    # plt.xlim(-1, 3)
    plt.xlabel(r"$r$")
    plt.ylabel(r"2*(deltaNLL+nll+nll0)")
    plt.title("NLL scan of mutliple background core functions")
    plt.grid(True)
    plt.tight_layout()
    # plt.show()
    plt.savefig("CoreFuncs_nll.pdf")
    plt.ylim(min_nll-1, min_nll+50)
    plt.savefig("CoreFuncs_nll_zoomed.pdf")

    plt.ylim(max_nll-550, max_nll-450)
    plt.savefig("CoreFuncs_nll_zoomed_mid.pdf")


    plt.ylim(max_nll-100, max_nll+10)
    plt.savefig("CoreFuncs_nll_zoomed_up.pdf")



    
    