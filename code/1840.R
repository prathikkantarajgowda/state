# state and race population data 1840
# DONE

library(tidyverse)

state_and_race_1840 <- 
  read_csv("data/1840/nhgis0013_ds7_1840_state.csv") %>% 
  as_tibble() %>%
  transmute(year = YEAR, state = STATE,
            
            # encoding scheme is gender_race_slavestatus_religion
            # we want specific data on race, gender, and slave status
            # we want cumulative data on white pop, colored pop, and slave pop
            
            male_white_NA_NA = ACR001,
            female_white_NA_NA = ACR002,
            
            male_colored_slave_NA = ACU003,
            female_colored_slave_NA = ACU004,
            
            male_colored_free_NA = ACU001,
            female_colored_free_NA = ACU002,
            
            NA_white_NA_NA = ACR001 + ACR002,
            NA_colored_NA_NA = ACU003 + ACU004 + ACU001 + ACU002,
            NA_NA_slave_NA = ACU003 + ACU004
            
  ) %>% 
  pivot_longer(cols = -c("state", "year"),
               names_to = c("gender", "race", "slave_status", "religion"),
               names_sep = "_",
               values_to = "value") %>%
  transmute(country = "United States", 
            state,
            gender, 
            race,
            slave_status,
            religion = "", 
            age = "", 
            year = 1840, 
            statistic = "population",
            value,
            source = "INSERTSOURCENAMEHERE",
            notes = "",
            personentered = "Prathik", 
            complete = "")