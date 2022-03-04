# state and race population data 1880
# DONE

library(tidyverse)

state_and_race_1880 <- 
  read_csv("data/1880/nhgis0017_ds25_1880_state.csv") %>% 
  as_tibble() %>%
  transmute(year = YEAR, state = STATE,
            
            # encoding scheme is gender_race_nativity_slavestatus_religion
            # we want specific data on race, gender, and slave status
            # we want cumulative data on white pop, colored pop, and slave pop
            
            male_white_native_NA_NA = AR0001,
            female_white_native_NA_NA = AR0002,
            male_white_foreign_NA_NA = AR0003,
            female_white_foreign_NA_NA = AR0004,
            
            male_colored_native_NA_NA = AR0005,
            female_colored_native_NA_NA = AR0006,
            male_colored_foreign_NA_NA = AR0007,
            female_colored_foreign_NA_NA = AR0008,
            
            male_chineseorjapanese_native_NA_NA = AR0009,
            female_chineseorjapanese_native_NA_NA = AR0010,
            male_chineseorjapanese_foreign_NA_NA = AR0011,
            female_chineseorjapanese_foreign_NA_NA = AR0012,
            
            male_indian_native_NA_NA = AR0013,
            female_indian_native_NA_NA = AR0014,
            male_indian_foreign_NA_NA = AR0015,
            female_indian_foreign_NA_NA = AR0016
  ) %>% 
  pivot_longer(cols = -c("state", "year"),
               names_to = 
                 c("gender", "race", "nativity", "slave_status", "religion"),
               names_sep = "_",
               values_to = "value") %>%
  transmute(country = "United States", 
            state,
            gender, 
            race,
            nativity,
            slave_status,
            religion = "", 
            age = "", 
            year = 1880, 
            statistic = "population",
            value,
            source = "INSERTSOURCENAMEHERE",
            notes = "",
            personentered = "Prathik", 
            complete = "")