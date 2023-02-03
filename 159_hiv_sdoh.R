library(tidyverse)
library(readxl)
=
Data on HIV deaths from OASIS. 2018-2020 By age group, by race/ethnicity

his_deaths <- read_xlsx("data/raw_data/hivdeaths_his_1820.xlsx", skip = 1)
nhw_deaths <- read_xlsx("data/raw_data/hivdeaths_nhw_1820.xlsx", skip = 1)
nhb_deaths <- read_xlsx("data/raw_data/hivdeaths_nhb_1820.xlsx", skip = 1)

his_pop <- read_xlsx("data/raw_data/pop_his_1820.xlsx", skip = 1)
nhw_pop <- read_xlsx("data/raw_data/pop_nhw_1820.xlsx", skip = 1)
nhb_pop <- read_xlsx("data/raw_data/pop_nhb_1820.xlsx")

sdoh <- read_xlsx("data/raw_data/AIDSVu_County_SDOH_2020.xlsx", skip = 3)
sdoh <- sdoh %>%  filter(State == "Georgia")

dx18 <- read_xlsx("data/raw_data/AIDSVu_County_NewDX_2018.xlsx", skip = 3)
dx18 <- dx18 %>%  filter(State == "Georgia") %>% 
  select(!contains(c("Rate Stability", "Percent", "Case")))

dx19 <- read_xlsx("data/raw_data/AIDSVu_County_NewDX_2019.xlsx", skip = 3)
dx19 <- dx19 %>%  filter(State == "Georgia")%>% 
  select(!contains(c("Rate Stability", "Percent", "Case")))

dx20 <- read_xlsx("data/raw_data/AIDSVu_County_NewDX_2020.xlsx", skip = 3)
dx20 <- dx20 %>%  filter(State == "Georgia") %>% 
  select(!contains(c("Rate Stability", "Percent", "Case")))
