# state and race population data 1860
# DONE

library(tidyverse)

state_and_race_1860 <- 
  read_csv("data/1860/nhgis0014_ds14_1860_state.csv") %>% 
  as_tibble() %>%
  transmute(year = YEAR, state = STATE,
            
            # encoding scheme is gender_race_slavestatus_religion
            # we want specific data on race, gender, and slave status
            # we want cumulative data on white pop, colored pop, and slave pop
            
            male_white_NA_NA = AH2001,
            female_white_NA_NA = AH2002,
            
            male_colored_slave_NA = AH2005,
            female_colored_slave_NA = AH2006,
            
            male_colored_free_NA = AH2003,
            female_colored_free_NA = AH2004,
            
            male_native_NA_NA = AH2007,
            female_native_NA_NA = AH2008,
            
            male_halfbreed_NA_NA = AH2009,
            female_halfbreed_NA_NA = AH2010,
            
            male_asian_NA_NA = AH2011,
            female_asian_NA_NA = AH2012,
            
            NA_white_NA_NA = AH2001 + AH2002,
            NA_colored_NA_NA = AH2003 + AH2004 + AH2005 + AH2006,
            NA_NA_slave_NA = AH2006 + AH2005,
            NA_native_NA_NA = AH2007 + AH2008,
            NA_halfbreed_NA_NA = AH2009 + AH2010,
            NA_asian_NA_NA = AH2011 + AH2012
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
            year = 1860, 
            statistic = "population",
            value,
            source = "INSERTSOURCENAMEHERE",
            notes = "",
            personentered = "Prathik", 
            complete = "")