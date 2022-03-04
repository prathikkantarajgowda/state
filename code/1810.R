# state and race population data 1810
# DONE

library(tidyverse)

state_and_race_1810 <- 
  read_csv("data/1810/nhgis0009_ds3_1810_state.csv") %>% 
  as_tibble() %>%
  transmute(year = YEAR, state = STATE,
            
            # encoding scheme is gender_race_slavestatus_religion
            
            male_white_NA_NA = AA9001, # white male population
            female_white_NA_NA = AA9002, # white female population
            
            NA_colored_free_NA = AA7001, # free colored population
            NA_colored_slave_NA = AA7002, # slave colored population
            
            NA_NS_slave_NA = AA7002, # slave population
            
            NA_white_NA_NA = AA9001 + AA9002, # white population
            NA_colored_NA_NA = AA7001 + AA7002, # colored population
            
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
            year = 1810, 
            statistic = "population",
            value,
            source = "INSERTSOURCENAMEHERE",
            notes = "",
            personentered = "Prathik", 
            complete = "")