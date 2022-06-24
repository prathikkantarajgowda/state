# state population data 1810 (NHGIS)
# - no age data
# - no sex data for non whites 
# - we have race x slave status data for coloreds, but their def of colored does
#   not include indians. thus I have also included raw white/colored pop stats
#   to harmonize

library(tidyverse)

state_1810 <- 
  read_csv("data/1810/nhgis0030_csv/nhgis0030_ds3_1810_state.csv") %>% 
  as_tibble() %>%
  transmute(year = YEAR, state = STATE,
            
            # encoding scheme is gender_race_slavestatus_religion
            # we want specific data on race, gender, and slave status
            # we want cumulative data on white pop, colored pop, and slave pop
            male_white_NA_NA = AA9001, # white male population
            female_white_NA_NA = AA9002, # white female population
            
            NA_white_NA_NA = AA2001, # white population
            NA_nonwhite_NA_NA = AA2002, # non-white population
            
            NA_nonwhiteexcludingindians_free_NA = AA7001, # colored non indian free population
            NA_nonwhiteexcludingindians_slave_NA = AA7002, # colored non indian slave population
            NA_nonwhiteexcludingindians_NA_NA = AA7001 + AA7002 # colored non indian population
  ) %>% 
  pivot_longer(cols = -c("state", "year"),
               names_to = c("sex", "race", "slave_status", "religion"),
               names_sep = "_",
               values_to = "value") %>%
  transmute(country = "United States", 
            state,
            sex, 
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