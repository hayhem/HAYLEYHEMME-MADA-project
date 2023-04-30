library(spdep)
library(spatialreg)
library(rgdal)
library(here)
df <- readRDS(here("data/processed_data/race_sub_scaled.rds"))
prin_comp1 <- readRDS( here("data/processed_data/prin_comp1.rds"))

us_nabs <- readRDS(here("data/processed_data/us_nabs.rds"))

#Subset to contiguous states
us_nabs <- us_nabs %>%
  filter(!grepl("AK", StateCode),
         !grepl("HI", StateCode), 
         !grepl("DC", StateCode))


h_race_df <- matrix(0, nrow(df), nrow(df))
h_race_df[cbind(match(us_nabs$StateCode, df$`State Abbreviation`),
                match(us_nabs$NeighborStateCode, df$`State Abbreviation`))] <- 1

nablist_race_df <- mat2listw(h_race_df, style = "W")


car_model <- spautolm(MRR ~ prin_comp1, 
                      data = df,
                      listw = nablist_race_df,
                      family = "CAR", zero.policy = TRUE)

car_race <- spautolm(MRR ~                      
                       pc1,
                     data = df,
                     listw = nablist_race_df,
                     family = "CAR")
print(summary(car_race))
