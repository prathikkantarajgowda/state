# state population data 1870 (ICPSR 02896)
# UNFINISHED
# 11, 12, 13, and 14 are the ICPSR 02896 datasets for 1870. however, not enough
# data is available

library(tidyverse)
library(haven)

state_1870_11 <- 
  read_dta("data/1870/DS0011/02896-0011-Data.dta") %>% 
  as_tibble() %>% 
  filter(level == 2)

state_1870_12 <- 
  read_dta("data/1870/DS0012/02896-0012-Data.dta") %>% 
  as_tibble()

state_1870_13 <- 
  read_dta("data/1870/DS0013/02896-0013-Data.dta") %>% 
  as_tibble()

state_1870_14 <- 
  read_dta("data/1870/DS0014/02896-0014-Data.dta") %>% 
  as_tibble()