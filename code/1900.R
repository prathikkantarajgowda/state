# state and race population data 2000

library(tidyverse)

raw_data_1900 <-
  read_csv("~/Documents/R_Projects/state_and_race/data/nhgis0003_csv/nhgis0003_ds31_1900_state.csv") %>%
  as_tibble()

raw_data_1900_decoded <- 
  transmute(raw_data_1900, year = YEAR, state = STATE,
         
         # total population 
         total = AYM001,
                
         # black population ("negro" per source text)
         black = AZ3003 + AZ3004,
                
         # "other colored" population
         other_colored = AZ3001 + AZ3002,
                
         # white population ( = total_pop - blacks - coloreds)
         white = total - black - other_colored
  ) %>% 
  select(-total)

state_and_race_1900 <-
  pivot_longer(data = raw_data_1900_decoded,
               cols = -c("state", "year"),
               names_to = c("race"),
               values_to = "value") %>%
  transmute(country = "United States", state, year = 1900, race, 
            statistic = "population",
            value, source = "INSERTSOURCENAMEHERE", notes = "",
            personentered = "Prathik", complete = "")