#!/bin/bash


python plot1DScan.py higgsCombinefixed_pdf_0.MultiDimFit.mH125.root --main-label "BWZRedux" --main-color 1 \
    --others higgsCombinefixed_pdf_3.MultiDimFit.mH125.root:"sumExp":2 \
    higgsCombinefixed_pdf_4.MultiDimFit.mH125.root:"PowerLaw":3 \
    -o nll_scan_zoomedBigRange
        # -o nll_scan_zoomed


python plot1DScan.py higgsCombinefixed_pdf_5.MultiDimFit.mH125.root --main-label "BwzGamma" --main-color 5 \
    --others higgsCombinefixed_pdf_2.MultiDimFit.mH125.root:"BWZxBern":2 \
    higgsCombinefixed_pdf_1.MultiDimFit.mH125.root:"BwzGamma":7 \
    higgsCombinefixed_pdf_6.MultiDimFit.mH125.root:"LandauxBern":6 \
    -o nll_scan_zoomedBigRange_up
        # -o nll_scan_zoomed_up


# python plot1DScan.py higgsCombinefixed_pdf_2.MultiDimFit.mH125.root --main-label "BWZxBern" --main-color 1 \
#     -o nll_scan_zoomed_up



# python plot1DScan.py higgsCombinefixed_pdf_6.MultiDimFit.mH125.root --main-label "LandauxBern" --main-color 1 \
#     -o nll_scan_zoomed_up