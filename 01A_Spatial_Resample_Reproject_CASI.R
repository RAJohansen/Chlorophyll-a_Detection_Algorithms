### Spatial Resample and Reproject CASI HSI 48 bands with 1m resolution ###

#Install Packages
library(raster)

#Set Parameters
CellSize <- 300  # Set New Cell Size 1.8, 20, 30, 250, 300  
inputRaster <- stack("D:/CASI_300m.tif") #Input Working image
# Input Projection from raster or CRS
#TV_Projection <- projection(inputRaster) # Input Desired Projection
TV_Projection <- "+proj=utm +zone=16 +datum=WGS84 +units=m +no_defs +ellps=WGS84 +towgs84=0,0,0" #Taylorsville Lake UTM Projection

## Create Subsets for each Layer 5GB MAX----------------------------------------
B1 <- subset(inputRaster,1) 
B2 <- subset(inputRaster,2)
B3 <- subset(inputRaster,3)
B4 <- subset(inputRaster,4)
B5 <- subset(inputRaster,5)
B6 <- subset(inputRaster,6)
B7 <- subset(inputRaster,7)
B8 <- subset(inputRaster,8)
B9 <- subset(inputRaster,9)
B10 <- subset(inputRaster,10)
B11 <- subset(inputRaster,11)
B12 <- subset(inputRaster,12)
B13 <- subset(inputRaster,13)
B14 <- subset(inputRaster,14)
B15 <- subset(inputRaster,15)
B16 <- subset(inputRaster,16)
B17 <- subset(inputRaster,17)
B18 <- subset(inputRaster,18)
B19 <- subset(inputRaster,19)
B20 <- subset(inputRaster,20)
B21 <- subset(inputRaster,21)
B22 <- subset(inputRaster,22)
B23 <- subset(inputRaster,23)
B24 <- subset(inputRaster,24)
B25 <- subset(inputRaster,25)
B26 <- subset(inputRaster,26)
B27 <- subset(inputRaster,27)
B28 <- subset(inputRaster,28)
B29 <- subset(inputRaster,29)
B30 <- subset(inputRaster,30)
B31 <- subset(inputRaster,31)
B32 <- subset(inputRaster,32)
B33 <- subset(inputRaster,33)
B34 <- subset(inputRaster,34)
B35 <- subset(inputRaster,35)
B36 <- subset(inputRaster,36)
B37 <- subset(inputRaster,37)
B38 <- subset(inputRaster,38)
B39 <- subset(inputRaster,39)
B40 <- subset(inputRaster,40)
B41 <- subset(inputRaster,41)
B42 <- subset(inputRaster,42)
B43 <- subset(inputRaster,43)
B44 <- subset(inputRaster,44)
B45 <- subset(inputRaster,45)
B46 <- subset(inputRaster,46)
B47 <- subset(inputRaster,47)
B48 <- subset(inputRaster,48)

## Reproject and resample Raster to projection of original Input Raster----------
resampleB1 <- projectRaster(B1, crs=TV_Projection, res=CellSize, method='bilinear')
resampleB2 <- projectRaster(B2, crs=TV_Projection, res=CellSize, method='bilinear')
resampleB3 <- projectRaster(B3, crs=TV_Projection, res=CellSize, method='bilinear')
resampleB4 <- projectRaster(B4, crs=TV_Projection, res=CellSize, method='bilinear')
resampleB5 <- projectRaster(B5, crs=TV_Projection, res=CellSize, method='bilinear')
resampleB6 <- projectRaster(B6, crs=TV_Projection, res=CellSize, method='bilinear')
resampleB7 <- projectRaster(B7, crs=TV_Projection, res=CellSize, method='bilinear')
resampleB8 <- projectRaster(B8, crs=TV_Projection, res=CellSize, method='bilinear')
resampleB9 <- projectRaster(B9, crs=TV_Projection, res=CellSize, method='bilinear')
resampleB10 <- projectRaster(B10, crs=TV_Projection, res=CellSize, method='bilinear')
resampleB11 <- projectRaster(B11, crs=TV_Projection, res=CellSize, method='bilinear')
resampleB12 <- projectRaster(B12, crs=TV_Projection, res=CellSize, method='bilinear')
resampleB13 <- projectRaster(B13, crs=TV_Projection, res=CellSize, method='bilinear')
resampleB14 <- projectRaster(B14, crs=TV_Projection, res=CellSize, method='bilinear')
resampleB15 <- projectRaster(B15, crs=TV_Projection, res=CellSize, method='bilinear')
resampleB16 <- projectRaster(B16, crs=TV_Projection, res=CellSize, method='bilinear')
resampleB17 <- projectRaster(B17, crs=TV_Projection, res=CellSize, method='bilinear')
resampleB18 <- projectRaster(B18, crs=TV_Projection, res=CellSize, method='bilinear')
resampleB19 <- projectRaster(B19, crs=TV_Projection, res=CellSize, method='bilinear')
resampleB20 <- projectRaster(B20, crs=TV_Projection, res=CellSize, method='bilinear')
resampleB21 <- projectRaster(B21, crs=TV_Projection, res=CellSize, method='bilinear')
resampleB22 <- projectRaster(B22, crs=TV_Projection, res=CellSize, method='bilinear')
resampleB23 <- projectRaster(B23, crs=TV_Projection, res=CellSize, method='bilinear')
resampleB24 <- projectRaster(B24, crs=TV_Projection, res=CellSize, method='bilinear')
resampleB25 <- projectRaster(B25, crs=TV_Projection, res=CellSize, method='bilinear')
resampleB26 <- projectRaster(B26, crs=TV_Projection, res=CellSize, method='bilinear')
resampleB27 <- projectRaster(B27, crs=TV_Projection, res=CellSize, method='bilinear')
resampleB28 <- projectRaster(B28, crs=TV_Projection, res=CellSize, method='bilinear')
resampleB29 <- projectRaster(B29, crs=TV_Projection, res=CellSize, method='bilinear')
resampleB30 <- projectRaster(B30, crs=TV_Projection, res=CellSize, method='bilinear')
resampleB31 <- projectRaster(B31, crs=TV_Projection, res=CellSize, method='bilinear')
resampleB32 <- projectRaster(B32, crs=TV_Projection, res=CellSize, method='bilinear')
resampleB33 <- projectRaster(B33, crs=TV_Projection, res=CellSize, method='bilinear')
resampleB34 <- projectRaster(B34, crs=TV_Projection, res=CellSize, method='bilinear')
resampleB35 <- projectRaster(B35, crs=TV_Projection, res=CellSize, method='bilinear')
resampleB36 <- projectRaster(B36, crs=TV_Projection, res=CellSize, method='bilinear')
resampleB37 <- projectRaster(B37, crs=TV_Projection, res=CellSize, method='bilinear')
resampleB38 <- projectRaster(B38, crs=TV_Projection, res=CellSize, method='bilinear')
resampleB39 <- projectRaster(B39, crs=TV_Projection, res=CellSize, method='bilinear')
resampleB40 <- projectRaster(B40, crs=TV_Projection, res=CellSize, method='bilinear')
resampleB41 <- projectRaster(B41, crs=TV_Projection, res=CellSize, method='bilinear')
resampleB42 <- projectRaster(B42, crs=TV_Projection, res=CellSize, method='bilinear')
resampleB43 <- projectRaster(B43, crs=TV_Projection, res=CellSize, method='bilinear')
resampleB44 <- projectRaster(B44, crs=TV_Projection, res=CellSize, method='bilinear')
resampleB45 <- projectRaster(B45, crs=TV_Projection, res=CellSize, method='bilinear')
resampleB46 <- projectRaster(B46, crs=TV_Projection, res=CellSize, method='bilinear')
resampleB47 <- projectRaster(B47, crs=TV_Projection, res=CellSize, method='bilinear')
resampleB48 <- projectRaster(B48, crs=TV_Projection, res=CellSize, method='bilinear')



## Write Resampled and Repojected Raster to Output------------------------------
resampledStack <- stack(resampleB1,resampleB2,resampleB3,resampleB4,resampleB5,resampleB6,resampleB7,resampleB8,resampleB9,resampleB10,
      resampleB11,resampleB12,resampleB13,resampleB4,resampleB15,resampleB16,resampleB17,resampleB18,resampleB19,
      resampleB20,resampleB21,resampleB22,resampleB23,resampleB24,resampleB25,resampleB26,resampleB27,resampleB28,
      resampleB29,resampleB30,resampleB31,resampleB32,resampleB33,resampleB34,resampleB35,resampleB36,resampleB37,
      resampleB38,resampleB39,resampleB40,resampleB41,resampleB42,resampleB43,resampleB44,resampleB45,resampleB46,
      resampleB47,resampleB48)

# Save Raster to output folder
writeRaster(resampledStack,filename="D:/CASI_300m.tif",
            format="GTiff",datatype="FLT4S",overwrite=FALSE) 
