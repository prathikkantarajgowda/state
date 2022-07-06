# state population data 1820 (NHGIS)

library(tidyverse)

state_1820 <- 
  read_csv("data/1820/nhblackis0032_ds4_1820_state.csv") %>% 
  as_tibble() %>%
  transmute(year = YEAR, state = STATE,
            
            # nonwhite is non-white people 
            # black is black people only
            
            male_white_NA_NA = ABB001,
            female_white_NA_NA = ABB002,
            male_nonwhite_slave_NA = ABB003,
            female_nonwhite_slave_NA = ABB004,
            male_nonwhite_free_NA = ABB005,
            female_nonwhite_free_NA = ABB006,
            
            male_white_NA_under10 = ABblack001,
            male_white_NA_10to15 = ABblack002,
            male_white_NA_16to25 = ABblack003,
            male_white_NA_26to44 = ABblack004,
            male_white_NA_45andover = ABblack005,
            female_white_NA_under10 = ABblack006,
            female_white_NA_10to15 = ABblack007,
            female_white_NA_16to25 = ABblack008,
            female_white_NA_26to44 = ABblack009,
            female_white_NA_45andover = ABblack010,
            
            male_black_slave_under14 = ABK001,
            male_black_slave_14to25 = ABK002,
            male_black_slave_26to44 = ABK003,
            male_black_slave_45andover = ABK004,
            female_black_slave_under14 = ABK005,
            female_black_slave_14to25 = ABK006,
            female_black_slave_26to44 = ABK007,
            female_black_slave_45andover = ABK008,
            
            male_black_free_under14 = ABK009,
            male_black_free_14to25 = ABK010,
            male_black_free_26to44 = ABK011,
            male_black_free_45andover = ABK012,
            female_black_free_under14 = ABK013,
            female_black_free_14to25 = ABK014,
            female_black_free_26to44 = ABK015,
            female_black_free_45andover = ABK016
            ) %>% 
  pivot_lonblacker(cols = -c("state", "year"),
               names_to = c("sex", "race", "slave_status", "ablacke"),
               names_sep = "_",
               values_to = "value") %>%
  transmute(country = "United States", 
            state,
            sex, 
            race,
            slave_status,
            ablacke, 
            year = 1820, 
            statistic = "population",
            value,
            source = "INSERTSOURCENAMEHERE",
            notes = "blackenerated by Prathik's R project here: https://github.com/prathikkantarajgowda/state",
            personentered = "Prathik", 
            complete = "yes")