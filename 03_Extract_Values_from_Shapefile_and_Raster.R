### Extract Values from Raster Stacks via Shapefile points ###

#Download Packages
library(raster)

# READ Samples from Shapefile
Input_Shapefile <- shapefile('D:/Samples_WQ.shp')

#Select Appropiate Satellite to Perform Extraction 

## CASI ------------------------------------------------------------------------
CASI_HAB_Stack <- stack("D:/CASI_HAB_Stack.tif")
CASI_data <- data.frame(Input_Shapefile, extract(CASI_HAB_Stack, Input_Shapefile))
write.csv(CASI_data, file = "D:/CASI_HAB_Data.csv")

## World View 2 ----------------------------------------------------------------
WV2_HAB_Stack <- stack("D:/WV2_HAB_Stack.tif")
WV2_data <- data.frame(Input_Shapefile, extract(WV2_HAB_Stack, Input_Shapefile))
write.csv(WV2_data, file = "D:/WV2_HAB_data.csv")

## Sentinel-2 ------------------------------------------------------------------
S2_HAB_Stack <- stack("D:/S2_HAB_Stack.tif")
S2_data <- data.frame(Input_Shapefile, extract(S2_HAB_Stack, Input_Shapefile))
write.csv(S2_data, file = "D:/S2_HAB_data.csv")

## Landsat-8 -------------------------------------------------------------------
L8_HAB_Stack <- stack("D:/L8_HAB_Stack.tif")
L8_data <- data.frame(Input_Shapefile, extract(L8_HAB_Stack, Input_Shapefile))
write.csv(L8_data, file = "D:/L8_HAB_data.csv")

## MODIS -----------------------------------------------------------------------
MODIS_HAB_Stack <- stack("D:/MODIS_HAB_Stack.tif")
MODIS_data <- data.frame(Input_Shapefile, extract(MODIS_HAB_Stack, Input_Shapefile))
write.csv(MODIS_data, file = "D:/MODIS_HAB_data.csv")

## MERSIS ----------------------------------------------------------------------
MERIS_HAB_Stack <- stack("D:/MERIS_HAB_Stack.tif")
MERIS_data <- data.frame(Input_Shapefile, extract(MERIS_HAB_Stack, Input_Shapefile))
write.csv(MERIS_data, file = "D:/MERIS_HAB_data.csv")

## Merge all datasets-----------------------------------------------------------

CASI_Chla_HAB_Data <- t(CASI_Chla_HAB_Data)
WV2_Chla_HAB_Data <- t(WV2_Chla_HAB_data)
S2_Chla_HAB_Data <- t(S2_Chla_HAB_data)
L8_Chla_HAB_Data <- t(L8_Chla_HAB_data)
MODIS_Chla_HAB_Data <- t(MODIS_Chla_HAB_data)
MERIS_Chla_HAB_Data <- t(MERIS_Chla_HAB_data)

HAB_Stack_Data_Merged <- rbind(CASI_Chla_HAB_Data,WV2_Chla_HAB_Data,S2_Chla_HAB_Data,
                               L8_Chla_HAB_Data,MODIS_Chla_HAB_Data,MERIS_Chla_HAB_data)
write.csv(HAB_Stack_Data_Merged, file = "D:/HAB_Stack_data_Merged.csv")