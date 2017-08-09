# This function Calculates the Geometric regression and outputs R Squared, geometric slope, intercept, STD of slope, and STD of intecept

#Packages required
library(tidyverse)

# Geometric Regression Function
extract_georegression <- function(Y_name, X_name, df) {
  X = df %>% pull(X_name)
  Y = df %>% pull(Y_name)
  
  # Calculate geometric mean slope (m)
  lm_x <- lm(X~Y)
  lm_y <- lm(Y~X)
  mx <-  summary(lm_x)$coefficients[2]
  my <- summary(lm_y)$coefficients[2]
  m <- sqrt(my*mx)
  geo_m <- my/m
  
  # Number of Samples
  n <- length(X)
  
  # Calculate sums of means
  Sx <- sum(X)
  Sy <- sum(Y)
  xbar <- Sx/n
  ybar <- Sy/n
  
  # Calculate Gemetric mean intercept
  b <- ybar- (geo_m*xbar)
  
  
  # Calculate More sums
  Sxy <- (X*Y)
  Sx2 <- sum(X^2)
  Sy2 <- sum(Y^2)
  
  # Calculate Reused Expressions
  num <- n * Sxy - Sx * Sy
  den <- n * Sx2 - Sx^2
  
  # Calculate r, sm, sb and s2
  
  r = sqrt(my*mx)
  r2 = my*mx
  diff1 <- Y-b-(geo_m*X) 
  s2 <- sum(diff1*diff1)/(n-2)
  sm <- sqrt(n*s2/den)
  sb <- sqrt(Sx2*s2/den)
  
  data_frame(Pearsons_R=r, Pearsons_R2 = r2, Slope=geo_m, Intercept=b,
             STD_Slope=sm,STD_Intercept=sb)
}

### CASI -----------------------------------------------------------------------

Algorithms = names(CASI_Chla_HAB_Data)[59:64] # Column numbers and positions are for the Algorithms chosen
names(Algorithms) = Algorithms
geo_CASI = Algorithms %>% map_df(~extract_georegression(Y_name = "SumRchl_ug", X_name =., df=CASI_Chla_HAB_Data), .id="Algorithms")

### World View 2 ---------------------------------------------------------------
Algorithms = names(WV2_Chla_HAB_data)[59:62] # Column numbers and positions are for the Algorithms chosen
names(Algorithms) = Algorithms
geo_WV2 = Algorithms %>% map_df(~extract_georegression(Y_name = "SumRchl_ug", X_name =., df=WV2_Chla_HAB_data), .id="Algorithms")

### Sentinel 2 -----------------------------------------------------------------
Algorithms = names(S2_Chla_HAB_data_No_Mixed_Pixels)[59:62] # Column numbers and positions are for the Algorithms chosen
names(Algorithms) = Algorithms
geo_S2 = Algorithms %>% map_df(~extract_georegression(Y_name = "SumRchl_ug", X_name =., df=S2_Chla_HAB_data_No_Mixed_Pixels), .id="Algorithms")

### Landsat 8 ------------------------------------------------------------------
Algorithms = names(L8_Chla_HAB_data_No_Mixed_Pixels)[59:65] # Column numbers and positions are for the Algorithms chosen
names(Algorithms) = Algorithms
geo_L8 = Algorithms %>% map_df(~extract_georegression(Y_name = "SumRchl_ug", X_name =., df=L8_Chla_HAB_data_No_Mixed_Pixels), .id="Algorithms")

### MODIS-----------------------------------------------------------------------
Algorithms = names(MODIS_Chla_HAB_data_No_Mixed_Pixels)[59:60] # Column numbers and positions are for the Algorithms chosen
names(Algorithms) = Algorithms
geo_MODIS = Algorithms %>% map_df(~extract_georegression(Y_name = "SumRchl_ug", X_name =., df=MODIS_Chla_HAB_data_No_Mixed_Pixels), .id="Algorithms")

### MERIS-----------------------------------------------------------------------
Algorithms = names(MERIS_Chla_HAB_data_No_Mixed_Pixels)[59:64] # Column numbers and positions are for the Algorithms chosen
names(Algorithms) = Algorithms
geo_MERIS = Algorithms %>% map_df(~extract_georegression(Y_name = "SumRchl_ug", X_name =., df=MERIS_Chla_HAB_data_No_Mixed_Pixels), .id="Algorithms")

## Merge Datasets---------------------------------------------------------------
rbind(geo_CASI,geo_WV2,geo_S2,geo_L8,geo_MODIS,geo_MERIS) %>% write_csv(., path="D:/Geo_Regression_Merged.csv")
