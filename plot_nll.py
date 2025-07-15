import uproot
import matplotlib.pyplot as plt
import glob
import awkward as ak
import numpy as np

def getRandNLL(load_path: str):
    file = uproot.open(load_path)
    nll = file['limit']['nll'].array()
    nll0 = file['limit']['nll0'].array()
    deltaNLL = file['limit']['deltaNLL'].array()
    y_arr = 2*(deltaNLL + nll0 + nll)[1:]
    # y_arr = 2*(deltaNLL)[1:]
    x_arr = file['limit']['r'].array()[1:]
    print(f"x_arr: {x_arr}")
    # print(f"file['limit']['r']: {file['limit']['r'].array()}")
    return x_arr, y_arr

def getRandNLL_batch(filelist):
    x_arrs = []
    y_arrs = []
    for root_file in filelist:
        x_arr, y_arr = getRandNLL(root_file)
        x_arrs.append(x_arr)
        y_arrs.append(y_arr)
    x_arr_tot = ak.concatenate(x_arrs)
    y_arr_tot = ak.concatenate(y_arrs)
    x_arr_tot = ak.to_numpy(x_arr_tot)
    y_arr_tot = ak.to_numpy(y_arr_tot)
    # print(f"x_arr_tot: {x_arr_tot}")
    # print(f"y_arr_tot: {y_arr_tot}")
    # sort by increasing r value
    order = np.argsort(x_arr_tot)
    # print(f"order: {order}")
    x_arr_tot = x_arr_tot[order]
    y_arr_tot = y_arr_tot[order]
    return x_arr_tot, y_arr_tot


load_path_dict = {
    "Envelope": "./higgsCombineEnvelope*.MultiDimFit.mH125.root",
    # "SumExp": "./higgsCombinefixed_pdf_0*.MultiDimFit.mH125.root",
    # "BWZ_Redux": "./higgsCombinefixed_pdf_1*.MultiDimFit.mH125.root",
    # "FEWZxBern": "./higgsCombinefixed_pdf_2*.MultiDimFit.mH125.root",

}
color_map = {
    "BWZ_Redux": "Green",
    "SumExp": "Blue",
    "FEWZxBern": "Red",
    # "PowerLaw": "Red",
    # "BWZxBern": "Purple",
}
for process, load_path in load_path_dict.items():
    # x_arr,y_arr = getRandNLL(load_path)
    load_filelist = glob.glob(load_path)
    print(f"load_filelist: {load_filelist}")
    x_arr,y_arr = getRandNLL_batch(load_filelist)
    # print(f"x_arr: {(x_arr)}")
    # print(f"y_arr: {y_arr}")
    if "Envelope" in load_path:
        plt.plot(x_arr,y_arr, color='orange', marker='o', label=process)
    else:
        plt.plot(x_arr,y_arr, color=color_map[process], label=process)
plt.legend()
plt.xlabel("Signal Strength (r)")
# plt.ylabel("-2lnL(r) + c")
plt.ylabel("-2$\\Delta$Ln[L(r)]")
plt.savefig("test.pdf")