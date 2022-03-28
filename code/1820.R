# state population data 1820 (NHGIS)

library(tidyverse)

state_1820 <- 
  read_csv("data/1820/nhgis0020_ds4_1820_state.csv") %>% 
  as_tibble() %>%
  transmute(year = YEAR, state = STATE,
            
            # encoding scheme is gender_race_slavestatus_age
            # we want specific data on race, gender, and slave status
            # we want cumulative data on white pop, colored pop, and slave pop
            
            male_white_NA_under10 = ABG001,
            male_white_NA_10to15 = ABG002,
            male_white_NA_16to25 = ABG003,
            male_white_NA_26to44 = ABG004,
            male_white_NA_45andover = ABG005,
            female_white_NA_under10 = ABG006,
            female_white_NA_10to15 = ABG007,
            female_white_NA_16to25 = ABG008,
            female_white_NA_26to44 = ABG009,
            female_white_NA_45andover = ABG010,
            
            male_colored_slave_under14 = ABK001,
            male_colored_slave_14to25 = ABK002,
            male_colored_slave_26to44 = ABK003,
            male_colored_slave_45andover = ABK004,
            female_colored_slave_under14 = ABK005,
            female_colored_slave_14to25 = ABK006,
            female_colored_slave_26to44 = ABK007,
            female_colored_slave_45andover = ABK008,
            male_colored_free_under14 = ABK009,
            male_colored_free_14to25 = ABK010,
            male_colored_free_26to44 = ABK011,
            male_colored_free_45andover = ABK012,
            female_colored_free_under14 = ABK013,
            female_colored_free_14to25 = ABK014,
            female_colored_free_26to44 = ABK015,
            female_colored_free_45andover = ABK016
            
  ) %>% 
  pivot_longer(cols = -c("state", "year"),
               names_to = c("gender", "race", "slave_status", "age"),
               names_sep = "_",
               values_to = "value") %>%
  transmute(country = "United States", 
            state,
            gender, 
            race,
            slave_status,
            religion = "", 
            age, 
            year = 1820, 
            statistic = "population",
            value,
            source = "INSERTSOURCENAMEHERE",
            notes = "",
            personentered = "Prathik", 
            complete = "yes")