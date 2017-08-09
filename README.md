# Chlorophyll-a detection and value extraction from raster imagery

This project is designed to spatially and spectrally resample imagery to mimic the 
configurations of WorldView-2, Sentinel-2, Landsat-8, MODIS, and MERIS sensors (01A and 01B).
The next step is to run the cholorophyll-a detection algorithms on each sensor including the
original dataset (02). The new raster values are extracted from the locations of a shapefile,
and converted into a CSV file (03). Finally, the values extracted to the CSV file 
are used to run linear modeling(04A) and geometric modeling (04B) to derive Pearson's R,
R_squared, slope, and intercept values.

### NOTES:

These script were written for a specfic location and dataset. An attempt was made
to keep all files as generic as possible, but there are locations where the user defined
inputs and outputs will need to be specfied. 

### Contact: 
If you have problems, questions, or suggestions, please contact me at:
johansra@mail.uc.edu


### Copyright (c) 2017, Richard A Johansen