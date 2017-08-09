### Run HAB Algorithms for Each Satellite combination ###

#Download Packages
library(raster)

#Set Workspace if needed
workspace <- setwd("D:/")

#Select Appropiate Satellite to Perform HAB Algorithms 

## CASI ------------------------------------------------------------------------

CASI <- stack("D:/CASI.tif") 

CASIWY08CI <- (-1*(((CASI[[23]])-(CASI[[22]])-(CASI[[25]]-(CASI[[22]])))))
CASIGo04MCI <- (((CASI[[25]])-(CASI[[23]])-((CASI[[28]])-(CASI[[23]]))))
CASIZh10FLH <- ((CASI[[25]])-(CASI[[27]]+(CASI[[23]]-CASI[[27]]))) 
CASIMM12NDCI <- (CASI[[25]]-CASI[[23]])/(CASI[[25]]+CASI[[23]])
CASIDa052BDA <-	(CASI[[25]])/(CASI[[22]])
CASIGi033BDA <-	((1/CASI[[22]])-(1/CASI[[25]]))*(CASI[[28]])

CASI_HAB_Stack<- stack(CASIWY08CI,CASIMCI,CASIFLH,CASIMM12NDCI, CASIDa052BDA,CASIGi033BDA)
names(CASI_HAB_Stack) <- c("CASIWY08CI","CASIMCI","CASIFLH","CASIMM12NDCI","CASIDa052BDA","CASIGi033BDA")

writeRaster(x = CASI_HAB_Stack,
            filename="D:/CASI_HAB_Stack.tif",
            format = "GTiff", # save as a tif
            datatype='FLT4S', # save as a float
            overwrite = F) #Overwrites same named file


## WORLD VIEW 2 ----------------------------------------------------------------

#WV2 <- stack("D:/WV2_Image")  

WV2MM12NDCI	<- (WV2[[6]]-WV2[[5]])/(WV2[[6]]+WV2[[5]])
WV2Be16FLHviolet <-	(WV2[[3]])-(WV2[[5]]+(WV2[[1]]-WV2[[5]]))
WV2Mi092BDA	<- (WV2[[6]])/(WV2[[5]])
WV2Be163BDA <- ((1/WV2[[5]])-(1/WV2[[6]]))*(WV2[[7]])

WV2_HAB_Stack<- stack(WV2MM12NDCI,WV2Be16FLHviolet,WV2Mi092BDA,WV2Be163BDA)
names(WV2_HAB_Stack) <- c("WV2MM12NDCI","WV2Be16FLHviolet","WV2Mi092BDA","WV2Be163BDA")

writeRaster(x = WV2_HAB_Stack,
            filename="D:/WV2_HAB_Stack.tif",
            format = "GTiff", # save as a tif
            datatype='FLT4S', # save as a float
            overwrite = F) #Overwrites same named file


## Sentinel-2-------------------------------------------------------------------
#*** Band 8b to changed to Band 9***

#S2 <- stack("D:/S2_Image") 

S2MM12NDCI <- (S2[[5]]-S2[[4]])/(S2[[5]]+S2[[4]])
S2Be16FLHviolet <- (S2[[3]])-(S2[[4]]+(S2[[2]]-S2[[4]]))
S2SI052BDA	<- (S2[[5]])/(S2[[4]])
S2Be163BDA <- ((1/S2[[4]])-(1/S2[[5]]))*(S2[[9]])

S2_HAB_Stack<- stack(S2MM12NDCI,S2Be16FLHviolet,S2SI052BDA,S23BDA)
names(S2_HAB_Stack) <- c("S2MM12NDCI","S2Be16FLHviolet","S2SI052BDA","S23BDA")

writeRaster(x = S2_HAB_Stack,
            filename="D:/S2_HAB_Stack.tif",
            format = "GTiff", # save as a tif
            datatype='FLT4S', # save as a float
            overwrite = F) #Overwrites same named file

##Landsat-8 ---------------------------------------------------------------------

#L8 <- stack("D:/L8_Image") 

L8MM12NDCI	<- (L8[[5]]-L8[[4]])/(L8[[5]]+L8[[4]])
L8Al10SABI <- (L8[[5]]-L8[[4]])/(L8[[2]]+L8[[3]])
L8Be16FLHblue <- (L8[[3]])-(L8[[4]]+(L8[[2]]-L8[[4]]))
L8Be16FLHviolet	<- (L8[[3]])-(L8[[4]]+(L8[[1]]-L8[[4]]))
L8Da032BDA	<- (L8[[5]])/(L8[[4]])
L8Kn07KIVU	<- (L8[[2]]-L8[[4]])/(L8[[3]])
L8Gi033BDA	<- ((1/L8[[2]])-(1/L8[[4]]))*(L8[[3]])

L8_HAB_Stack <- stack(L8MM12NDCI,L8Al10SABI,L8Be16FLHblue,L8Be16FLHviolet,L8Da032BDA,L8Kn07KIVU,L8Gi033BDA)
names(L8_HAB_Stack) <- c("L8MM12NDCI","L8Al10SABI","L8Be16FLHblue","L8Be16FLHviolet","L8Da032BDA","L8Kn07KIVU","L8Gi033BDA")

writeRaster(x = L8_HAB_Stack,
            filename="D:/L8_HAB_Stack.tif",
            format = "GTiff", # save as a tif
            datatype='FLT4S', # save as a float
            overwrite = F) #Overwrites same named file

## MODIS -----------------------------------------------------------------------

#MODIS <- stack("D:/MODIS_Image") 

MODISMMNDCI12 <- (MODIS[[2]]-MODIS[[1]])/(MODIS[[2]]+MODIS[[1]])
MODISSY002BDA <- (MODIS[[2]])/(MODIS[[1]])

MODIS_HAB_Stack <- stack(MODISMMNDCI12,MODISSY002BDA)
names(MODIS_HAB_Stack) <- c("MODISMMNDCI12","MODISSY002BDA")

writeRaster(x = MODIS_HAB_Stack,
            filename="D:/MODIS_HAB_Stack.tif",
            format = "GTiff", # save as a tif
            datatype='FLT4S', # save as a float
            overwrite = F) #Overwrites same named file

## MERIS -----------------------------------------------------------------------

#MERIS <- stack("D:/MERIS_Image") 

MERISWy08CI <- 	(-1*((MERIS[[8]])-(MERIS[[7]])-((MERIS[[9]]-(MERIS[[7]])))))
MERISGo04MCI <- ((MERIS[[9]])-(MERIS[[8]])-((MERIS[[10]]-(MERIS[[8]]))))
MERISZh10FLH <- (MERIS[[9]])-(MERIS[[10]]+(MERIS[[8]]-MERIS[[10]]))
MERISMM12NDCI	<- (MERIS[[9]]-MERIS[[7]])/(MERIS[[9]]+MERIS[[7]])
MERISBe162BDA	<- (MERIS[[9]])/(MERIS[[7]])
MERISBe163BDA	<- ((1/MERIS[[7]])-(1/MERIS[[9]]))*(MERIS[[11]])


MERIS_HAB_Stack <- stack(MERISWy08CI,MERISGo04MCI,MERISZh10FLH,MERISMM12NDCI,MERISBe162BDA,MERISBe163BDA)
names(MERIS_HAB_Stack) <- c("MERISWy08CI","MERISGo04MCI","MERISZh10FLH","MERISMM12NDCI","MERISBe162BDA","MERISBe163BDA")

writeRaster(x = MERIS_HAB_Stack,
            filename="D:/MERIS_HAB_Stack.tif",
            format = "GTiff", # save as a tif
            datatype='FLT4S', # save as a float
            overwrite = F) #Overwrites same named file
