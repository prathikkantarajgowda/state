# state and race population data 1850
# DONE

library(tidyverse)

state_and_race_1850 <- 
  read_csv("data/1850/nhgis0014_ds10_1850_state.csv") %>% 
  as_tibble() %>%
  transmute(year = YEAR, state = STATE,
            
            # encoding scheme is gender_race_slavestatus_religion
            # we want specific data on race, gender, and slave status
            # we want cumulative data on white pop, colored pop, and slave pop
            
            male_white_NA_NA = AEW001,
            female_white_NA_NA = AEW002,
            
            male_colored_slave_NA = AEW005,
            female_colored_slave_NA = AEW006,
            
            male_colored_free_NA = AEW003,
            female_colored_free_NA = AEW004,
            
            NA_white_NA_NA = AEW001 + AEW002,
            NA_colored_NA_NA = AEW003 + AEW004 + AEW005 + AEW006,
            NA_NA_slave_NA = AEW006 + AEW005
            
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
            year = 1850, 
            statistic = "population",
            value,
            source = "INSERTSOURCENAMEHERE",
            notes = "",
            personentered = "Prathik", 
            complete = "")