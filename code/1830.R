# state and race population data 1830
# DONE

library(tidyverse)

state_and_race_1830 <- 
  read_csv("data/1830/nhgis0012_ds5_1830_state.csv") %>% 
  as_tibble() %>%
  transmute(year = YEAR, state = STATE,
            
            # encoding scheme is gender_race_slavestatus_religion
            # we want specific data on race, gender, and slave status
            # we want cumulative data on white pop, colored pop, and slave pop
            
            male_white_NA_NA = ABO001,
            female_white_NA_NA = ABO002,
            
            male_colored_slave_NA = ABO003,
            female_colored_slave_NA = ABO004,
            
            male_colored_free_NA = ABO005,
            female_colored_free_NA = ABO006,
            
            NA_white_NA_NA = ABO001 + ABO002,
            NA_colored_NA_NA = ABO003 + ABO004 + ABO005 + ABO006,
            NA_NA_slave_NA = ABO003 + ABO004
            
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
            year = 1830, 
            statistic = "population",
            value,
            source = "INSERTSOURCENAMEHERE",
            notes = "",
            personentered = "Prathik", 
            complete = "")