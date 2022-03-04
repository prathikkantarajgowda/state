# state and race population data 1800
# DONE

library(tidyverse)

state_and_race_1800 <- 
  read_csv("data/1800/nhgis0007_ds2_1800_state.csv") %>% 
  as_tibble() %>%
  transmute(year = YEAR, state = STATE,
            
            # encoding scheme is gender_race_slavestatus_religion
            
            male_white_NA_NA = AA0001, # white male population
            female_white_NA_NA = AA0002, # white female population
            
            NA_colored_free_NA = AAY001, # free colored population
            NA_colored_slave_NA = AAY002, # slave colored population
            
            NA_NS_slave_NA = AAY002, # slave population
            
            NA_white_NA_NA = AA0001 + AA0002, # white population
            NA_colored_NA_NA = AAY001 + AAY002, # colored population
            
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
            year = 1800, 
            statistic = "population",
            value,
            source = "INSERTSOURCENAMEHERE",
            notes = "",
            personentered = "Prathik", 
            complete = "")