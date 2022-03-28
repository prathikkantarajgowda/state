# state population data 1810 (NHGIS)
# - no age data
# - no sex data for slaves

library(tidyverse)

state_1810 <- 
  read_csv("data/1810/nhgis0009_ds3_1810_state.csv") %>% 
  as_tibble() %>%
  transmute(year = YEAR, state = STATE,
            
            # encoding scheme is gender_race_slavestatus_religion
            # we want specific data on race, gender, and slave status
            # we want cumulative data on white pop, colored pop, and slave pop
            male_white_NA_NA = AA9001, # white male population
            
            female_white_NA_NA = AA9002, # white female population
            
            NA_colored_free_NA = AA7001, # free colored population
            NA_colored_slave_NA = AA7002, # slave colored population
            
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
            complete = "yes")