#### Spectrally Resampling CASI QUAC 48 Bands to other satellite band formation.####

#Download Packages
library(raster)

#Set Workspace if needed
setwd("D:/")

#Input Original CASI Image:a
Input_CASI <- stack("D:/CASI_300m.tif")

#Select Appropiate Satellite Transformation

## WORLD VIEW 2 ----------------------------------------------------------------
# Spectrally reallocate the CASI bands to estimated WV2 8 Bands 
WVB1 <- ((Input_CASI[[3]] + Input_CASI[[4]] + Input_CASI[[5]] + Input_CASI[[6]])/ 4) # Synthetic Center 428.9
WVB2 <- ((Input_CASI[[7]] + Input_CASI[[8]] + Input_CASI[[9]] + Input_CASI[[10]] + Input_CASI[[11]])/ 5) # Synthetic Center 486.45
WVB3 <- ((Input_CASI[[11]] + Input_CASI[[12]] + Input_CASI[[13]] + Input_CASI[[14]] + Input_CASI[[15]] + Input_CASI[[16]])/ 6) # Sythetic Center 550.8
WVB4 <- ((Input_CASI[[16]] + Input_CASI[[17]] + Input_CASI[[18]] + Input_CASI[[19]])/ 4) # Sythetic Center 607.9
WVB5 <- ((Input_CASI[[19]] + Input_CASI[[20]] + Input_CASI[[21]] + Input_CASI[[22]] + Input_CASI[[23]])/ 5) # Sythetic Center 657.75
WVB6 <- ((Input_CASI[[24]] + Input_CASI[[25]] + Input_CASI[[26]] + Input_CASI[[27]])/ 4) # Sythetic Center 721.75
WVB7 <- ((Input_CASI[[29]] + Input_CASI[[30]] + Input_CASI[[31]] + Input_CASI[[32]] + Input_CASI[[33]] + Input_CASI[[34]] + Input_CASI[[35]] + Input_CASI[[36]] + Input_CASI[[37]] + Input_CASI[[38]])/ 10) # Sythetic Center 835.6
WVB8 <- ((Input_CASI[[35]] + Input_CASI[[36]] + Input_CASI[[37]] + Input_CASI[[38]] + Input_CASI[[39]] + Input_CASI[[40]] + Input_CASI[[41]] + Input_CASI[[42]] + Input_CASI[[43]] + Input_CASI[[44]] + Input_CASI[[45]] + Input_CASI[[46]] + Input_CASI[[47]] + Input_CASI[[48]] )/ 14) # Sythetic Center 949.8

WV2<- stack(WVB1,WVB2,WVB3,WVB4,WVB5,WVB6,WVB7,WVB8)
writeRaster(x = WV2,
            filename="D:/Synth_WV2.tif",
            format = "GTiff", # save as a tif
            datatype='FLT4S', # save as a float
            overwrite = F) #Overwrites same named file

## Sentinel-2 ------------------------------------------------------------------
# Spectrally reallocate the CASI bands to estimated Sentinel-2 10 Bands 
S2B1 <- ((Input_CASI[[5]] + Input_CASI[[6]] + Input_CASI[[7]])/ 3) # Synthetic Center 443.4
S2B2 <- ((Input_CASI[[7]] + Input_CASI[[8]] + Input_CASI[[9]] + Input_CASI[[10]] + Input_CASI[[11]] + Input_CASI[[12]])/ 6) # Synthetic Center 493.4
S2B3 <- ((Input_CASI[[13]] + Input_CASI[[14]] + Input_CASI[[15]])/ 3) # Sythetic Center 557.95
S2B4 <- ((Input_CASI[[20]] + Input_CASI[[21]] + Input_CASI[[22]] + Input_CASI[[23]])/ 4) # Sythetic Center 664.85
S2B5 <- ((Input_CASI[[24]] + Input_CASI[[25]])/ 2) # Sythetic Center 707.5
S2B6 <- ((Input_CASI[[26]] + Input_CASI[[27]] + Input_CASI[[28]])/ 3) # Sythetic Center 743.1
S2B7 <- ((Input_CASI[[29]] + Input_CASI[[30]] + Input_CASI[[31]])/ 3) # Sythetic Center 785.75
S2B8 <- ((Input_CASI[[30]] + Input_CASI[[31]] + Input_CASI[[32]] + Input_CASI[[33]] + Input_CASI[[34]] + Input_CASI[[35]] + Input_CASI[[36]] + Input_CASI[[37]] + Input_CASI[[38]])/ 9) # Sythetic Center 842.75
S2B8b <- ((Input_CASI[[35]] + Input_CASI[[36]] + Input_CASI[[37]])/ 3) # Sythetic Center 864.05
S2B9 <- ((Input_CASI[[40]] + Input_CASI[[41]] + Input_CASI[[42]])/ 3) # Sythetic Center 942.5

S2 <- stack(S2B1,S2B2,S2B3,S2B4,S2B5,S2B6,S2B7,S2B8,S2B8b,S2B9)
writeRaster(x = S2,
            filename="D:/Synth_S2.tif",
            format = "GTiff", # save as a tif
            datatype='FLT4S', # save as a float
            overwrite = F) #Overwrites same named file
## Landsat-8 -------------------------------------------------------------------
# Spectrally reallocate the CASI bands to estimated Landsat-8 5 Bands 
L8B1 <- ((Input_CASI[[5]] + Input_CASI[[6]] + Input_CASI[[7]])/ 3) # Synthetic Center 443.4
L8B2 <- ((Input_CASI[[7]] + Input_CASI[[8]] + Input_CASI[[9]] + Input_CASI[[10]])/ 4) # Synthetic Center 479.3
L8B3 <- ((Input_CASI[[12]] + Input_CASI[[13]] + Input_CASI[[14]] + Input_CASI[[15]] + Input_CASI[[16]])/ 5) # Sythetic Center 557.95 
L8B4 <- ((Input_CASI[[20]] + Input_CASI[[21]] + Input_CASI[[22]])/ 3) # Sythetic Center 657.75
L8B5 <- ((Input_CASI[[34]] + Input_CASI[[35]] + Input_CASI[[36]] + Input_CASI[[37]])/ 4) # Sythetic Center 864.05

L8 <- stack(L8B1,L8B2,L8B3,L8B4,L8B5)

writeRaster(x = L8,
            filename="L8.tif",
            format = "GTiff", # save as a tif
            datatype='FLT4S', # save as a float
            overwrite = F) #Overwrites same named file

## MODIS -----------------------------------------------------------------------
# Spectrally reallocate the CASI bands to estimated MODIS 2 Bands 
MODB1 <- ((Input_CASI[[18]] + Input_CASI[[20]] + Input_CASI[[21]] + Input_CASI[[22]])/ 4) # Synthetic Center 643.5
MODB2 <- ((Input_CASI[[34]] + Input_CASI[[35]] + Input_CASI[[36]])/ 3) # Synthetic Center 856.95

MODIS <- stack(MODB1,MODB2)
writeRaster(x = MODIS,
            filename="D:/Synth_MODIS.tif",
            format = "GTiff", # save as a tif
            datatype='FLT4S', # save as a float
            overwrite = F) #Overwrites same named file

## MERIS -----------------------------------------------------------------------
# Spectrally reallocate the CASI bands to estimated MERIS 15 Bands 
MERB1 <- ((Input_CASI[[3]] + Input_CASI[[4]])/ 2) # Synthetic Center 407.5
MERB2 <- ((Input_CASI[[5]] + Input_CASI[[6]] + Input_CASI[[7]])/ 3) # Synthetic Center 443.4
MERB3 <- ((Input_CASI[[9]] + Input_CASI[[10]])/ 2) # Sythetic Center 493.65
MERB4 <- ((Input_CASI[[10]] + Input_CASI[[11]])/ 2) # Sythetic Center 507.95
MERB5 <- ((Input_CASI[[14]] + Input_CASI[[15]])/ 2) # Sythetic Center 565.1
MERB6 <- ((Input_CASI[[18]] + Input_CASI[[19]])/ 2) # Sythetic Center 622.15
MERB7 <- ((Input_CASI[[21]] + Input_CASI[[22]])/ 2) # Sythetic Center 664.85
MERB8 <- ((Input_CASI[[22]] + Input_CASI[[23]])/ 2) # Sythetic Center 679.1
MERB9 <- ((Input_CASI[[24]] + Input_CASI[[25]])/ 2) # Sythetic Center 707.5
MERB10 <- ((Input_CASI[[27]] + Input_CASI[[28]])/ 2) # Sythetic Center 750.2
MERB11 <- ((Input_CASI[[28]] + Input_CASI[[29]])/ 2) # Sythetic Center 764.4
MERB12 <- ((Input_CASI[[29]] + Input_CASI[[30]])/ 2) # Sythetic Center 778.65
MERB13 <- ((Input_CASI[[35]] + Input_CASI[[36]])/ 2) # Sythetic Center 864.05
MERB14 <- ((Input_CASI[[36]] + Input_CASI[[37]] + Input_CASI[[38]])/ 3) # Sythetic Center 885.45
MERB15 <- ((Input_CASI[[37]] + Input_CASI[[38]] + Input_CASI[[39]])/ 3) # Sythetic Center 899.65

MERIS <- stack(MERB1,MERB2,MERB3,MERB4,MERB5,MERB6,MERB7,MERB8,MERB9,MERB10,MERB11,MERB12,MERB13,MERB14,MERB15)
writeRaster(x = MERIS,
            filename="D:/Synth_MERIS.tif",
            format = "GTiff", # save as a tif
            datatype='FLT4S', # save as a float
            overwrite = F) #Overwrites same named file
