# state and race population data 1820
# DONE

library(tidyverse)

state_and_race_1820 <- 
  read_csv("data/1820/nhgis0010_ds4_1820_state.csv") %>% 
  as_tibble() %>%
  transmute(year = YEAR, state = STATE,
            
            # encoding scheme is gender_race_slavestatus_religion
            # we want specific data on race, gender, and slave status
            # we want cumulative data on white pop, colored pop, and slave pop
            
            male_white_NA_NA = ABB001,
            female_white_NA_NA = ABB002,
            
            male_colored_slave_NA = ABB003,
            female_colored_slave_NA = ABB004,
            
            male_colored_free_NA = ABB005,
            female_colored_free_NA = ABB006,
            
            NA_white_NA_NA = ABB001 + ABB002,
            NA_colored_NA_NA = ABB003 + ABB004 + ABB005 + ABB006,
            NA_NA_slave_NA = ABB003 + ABB004
            
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
            year = 1820, 
            statistic = "population",
            value,
            source = "INSERTSOURCENAMEHERE",
            notes = "",
            personentered = "Prathik", 
            complete = "")