import ROOT
import numpy as np
import argparse

ROOT.gROOT.SetBatch(True)

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument(
    "--in_file",
    dest="in_file",
    default=None,
    action="store",
    help="save path to store stage1 output files",
    )
    parser.add_argument(
    "--out_file",
    dest="out_file",
    default=None,
    action="store",
    help="save path to store stage1 output files",
    )
    parser.add_argument(
    "--ntoys",
    dest="ntoys",
    default=None,
    action="store",
    help="save path to store stage1 output files",
    )
    args = parser.parse_args()
    # N_toys = 1000
    N_toys = int(args.ntoys)
    plot_dir = "."
    fname = args.in_file
    out_fname = f"{plot_dir}/{args.out_file}.pdf"


    r_truth = 1

    truth_function = "exp"
    fit_function = "poly"

    name = "truth_%s_fit_%s" % (truth_function, fit_function)

    # Open file with fits
    # f = ROOT.TFile("higgsCombine.bias_%s.MultiDimFit.mH125.123456.root" % name)
    f = ROOT.TFile(fname)
    t = f.Get("tree_fit_sb")
    # t.Print("V")

    # hist_pull = ROOT.TH1F("pull_%s" % name, "Pull distribution: truth=%s, fit=%s" % (truth_function, fit_function), 80, -5, 5)
    hist_pull = ROOT.TH1F("pull_%s" % name, "Pull distribution: truth=%s, fit=%s" % (truth_function, fit_function), 1000, -5, 5)
    hist_pull.GetXaxis().SetTitle("Pull = (r_{truth}-r_{fit})/#sigma_{fit}")
    hist_pull.GetYaxis().SetTitle("Entries")

    sigma_values = np.array([])

    for i_toy in range(N_toys):
        # Best-fit value
        t.GetEntry(i_toy)
        r_fit = getattr(t, "r")
        rHiErr = getattr(t, "rHiErr")
        rLoErr = getattr(t, "rLoErr")

        hist_pull.Fill((r_fit-1)/(0.5*(rHiErr+rLoErr)))

    canv = ROOT.TCanvas()
    hist_pull.Draw()

    # Fit Gaussian to pull distribution
    ROOT.gStyle.SetOptFit(111)
    hist_pull.Fit("gaus")

    # canv.SaveAs("%s/part4_pull_%s.png" % (plot_dir, name))
    canv.SaveAs(out_fname)
    