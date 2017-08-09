#### Extract R squared, p value, slope, and intercept from dataframes then Merge###

# Packages Needed
library(tidyverse)

## Extract lm Values Function---------------------------------------------------
extract_lm = function(y, x, df){
  my_formula = as.formula(paste(y, "~", x))
  my_lm = lm(my_formula, data=df)
  R_Squared = summary(my_lm)$r.squared
  P_Value = summary(my_lm)$coefficients[8]
  Slope = summary(my_lm)$coefficients[2]
  Intercept = summary(my_lm)$coefficients[1]
  data_frame(R_Squared=R_Squared, P_Value=P_Value, Slope=Slope, Intercept=Intercept)
}

## Logic Test Case--------------------------------------------------------------
# extract_lm(y = "SumRchl_ug", x="CASIWY08CI", df=CASI_Chla_HAB_Data)

### CASI -----------------------------------------------------------------------
Algorithms = names(CASI_Chla_HAB_Data)[59:64] # Column numbers and positions are for the Algorithms chosen
names(Algorithms) = Algorithms
lm_CASI = Algorithms %>% map_df(~extract_lm(y = "SumRchl_ug", x=., df=CASI_Chla_HAB_Data), .id="Algorithms")

### World View 2 ---------------------------------------------------------------
Algorithms = names(WV2_Chla_HAB_data)[59:62] # Column numbers and positions are for the Algorithms chosen
names(Algorithms) = Algorithms
lm_WV2 = Algorithms %>% map_df(~extract_lm(y = "SumRchl_ug", x=., df=WV2_Chla_HAB_data), .id="Algorithms")

### Sentinel 2 -----------------------------------------------------------------
Algorithms = names(S2_Chla_HAB_data)[59:62] # Column numbers and positions are for the Algorithms chosen
names(Algorithms) = Algorithms
lm_S2 = Algorithms %>% map_df(~extract_lm(y = "SumRchl_ug", x=., df=S2_Chla_HAB_data), .id="Algorithms")

### Landsat 8 ------------------------------------------------------------------
Algorithms = names(L8_Chla_HAB_data)[59:65] # Column numbers and positions are for the Algorithms chosen
names(Algorithms) = Algorithms
lm_L8 = Algorithms %>% map_df(~extract_lm(y = "SumRchl_ug", x=., df=L8_Chla_HAB_data), .id="Algorithms")

### MODIS-----------------------------------------------------------------------
Algorithms = names(MODIS_Chla_HAB_data)[59:60] # Column numbers and positions are for the Algorithms chosen
names(Algorithms) = Algorithms
lm_MODIS = Algorithms %>% map_df(~extract_lm(y = "SumRchl_ug", x=., df=MODIS_Chla_HAB_data), .id="Algorithms")

### MERIS-----------------------------------------------------------------------
Algorithms = names(MERIS_Chla_HAB_data)[59:64] # Column numbers and positions are for the Algorithms chosen
names(Algorithms) = Algorithms
lm_MERIS = Algorithms %>% map_df(~extract_lm(y = "SumRchl_ug", x=., df=MERIS_Chla_HAB_data), .id="Algorithms")

## Merge Datasets
rbind(lm_CASI,lm_WV2,lm_S2,lm_L8,lm_MODIS,lm_MERIS) %>% write_csv(., path="D:/Correlation_Merged.csv")


