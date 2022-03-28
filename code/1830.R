# state population data 1830 (NHGIS)

library(tidyverse)

state_1830 <- 
  read_csv("data/1830/nhgis0020_ds5_1830_state.csv") %>% 
  as_tibble() %>%
  transmute(year = YEAR, state = STATE,
            
            # encoding scheme is gender_race_slavestatus_age
            # we want specific data on race, gender, and slave status
            # we want cumulative data on white pop, colored pop, and slave pop
            male_white_NA_under5 = ABW001,
            male_white_NA_5to9 = ABW002,
            male_white_NA_10to14 = ABW003,
            male_white_NA_15to19 = ABW004,
            male_white_NA_20to29 = ABW005,
            male_white_NA_30to39 = ABW006,
            male_white_NA_40to49 = ABW007,
            male_white_NA_50to59 = ABW008,
            male_white_NA_60to69 = ABW009,
            male_white_NA_70to79 = ABW010,
            male_white_NA_80to89 = ABW011,
            male_white_NA_90to99 = ABW012,
            male_white_NA_100andover = ABW013,
            female_white_NA_under5 = ABW014,
            female_white_NA_5to9 = ABW015,
            female_white_NA_10to14 = ABW016,
            female_white_NA_15to19 = ABW017,
            female_white_NA_20to29 = ABW018,
            female_white_NA_30to39 = ABW019,
            female_white_NA_40to49 = ABW020,
            female_white_NA_50to59 = ABW021,
            female_white_NA_60to69 = ABW022,
            female_white_NA_70to79 = ABW023,
            female_white_NA_80to89 = ABW024,
            female_white_NA_90to99 = ABW025,
            female_white_NA_100andover = ABW026,
            
            male_colored_slave_under10 = ABX001,
            male_colored_slave_10to23 = ABX002,
            male_colored_slave_24to35 = ABX003,
            male_colored_slave_36to54 = ABX004,
            male_colored_slave_55to99 = ABX005,
            male_colored_slave_100andover = ABX006,
            female_colored_slave_under10 = ABX007,
            female_colored_slave_10to23 = ABX008,
            female_colored_slave_24to35 = ABX009,
            female_colored_slave_36to54 = ABX010,
            female_colored_slave_55to99 = ABX011,
            female_colored_slave_100andover = ABX012,
            male_colored_free_under10 = ABX013,
            male_colored_free_10to23 = ABX014,
            male_colored_free_24to35 = ABX015,
            male_colored_free_36to54 = ABX016,
            male_colored_free_55to99 = ABX017,
            male_colored_free_100andover = ABX018,
            female_colored_free_under10 = ABX019,
            female_colored_free_10to23 = ABX020,
            female_colored_free_24to35 = ABX021,
            female_colored_free_36to54 = ABX022,
            female_colored_free_55to99 = ABX023,
            female_colored_free_100 = ABX024
            
  ) %>% 
  pivot_longer(cols = -c("state", "year"),
               names_to = c("gender", "race", "slave_status", "age"),
               names_sep = "_",
               values_to = "value") %>%
  transmute(country = "United States", 
            state,
            gender, 
            race,
            slave_status,
            religion = "", 
            age, 
            year = 1830, 
            statistic = "population",
            value,
            source = "INSERTSOURCENAMEHERE",
            notes = "",
            personentered = "Prathik", 
            complete = "yes")