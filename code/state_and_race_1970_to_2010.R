# state and race data 1970 to 2010

library(tidyverse)

# read in data from nhgis0002_ts_nominal_state.csv
# state-level persons by detailed race data from 1970 to 2010
state_and_race <- 
  read_csv("data/nhgis0002_csv/nhgis0002_ts_nominal_state.csv") %>%
  
  # decode variables to readable names, remove superfluous fields
  select(state = STATE, 
         
         # whites population data
         white_1970 = B08AA1970, white_1980 = B08AA1980, 
         white_1990 = B08AA1990, white_2000 = B08AA2000, 
         white_2010 = B08AA2010, 
         
         # blacks population data ("black or african american")
         black_1970 = B08AB1970, black_1980 = B08AB1980, 
         black_1990 = B08AB1990, black_2000 = B08AB2000,
         black_2010 = B08AB2010,
         
         # native population data (American Indian and Alaska native tribes
         # excluding Eskimo and Aleut)
         native_1970 = B08AC1970, native_1980 = B08AC1980, 
         native_1990 = B08AC1990, native_2000 = B08AC2000,
         native_2010 = B08AC2010, 
         
         # japanese population data
         japanese_1970 = B08AD1970, japanese_1980 = B08AD1980,
         japanese_1990 = B08AD1990, japanese_2000 = B08AD2000,
         japanese_2010 = B08AD2010,
         
         # chinese population data
         chinese_1970 = B08AE1970, chinese_1980 = B08AE1980,
         chinese_1990 = B08AE1990, chinese_2000 = B08AE2000,
         chinese_2010 = B08AE2010,
         
         # filipino population data
         filipino_1970 = B08AF1970, filipino_1980 = B08AF1980,
         filipino_1990 = B08AF1990, filipino_2000 = B08AF2000,
         filipino_2010 = B08AF2010,
         
         # korean population data
         korean_1970 = B08AG1970, korean_1980 = B08AG1980,
         korean_1990 = B08AG1990, korean_2000 = B08AG2000,
         korean_2010 = B08AG2010,
         
         # native hawaiian and other pacific islander data
         pacisl_1970 = B08AH1970, pacisl_1980 = B08AH1980,
         pacisl_1990 = B08AH1990, pacisl_2000 = B08AH2000,
         pacisl_2010 = B08AH2010,
         
         # other race (includes other asian and pacific islander, eskimo, 
         # aleut) data
         other_1970 = B08AI1970, other_1980 = B08AI1980,
         other_1990 = B08AI1990, other_2000 = B08AI2000,
         other_2010 = B08AI2010,
         
         # multiracial data
         multi_2000 = B08AJ2000, multi_2010 = B08AJ2010
  ) %>% as_tibble()

# tidy data
state_and_race_tidy <- 
  pivot_longer(data = state_and_race, 
               cols = -state,
               
               # race and year should be variables with their own columns
               names_to = c("race", "year"),
               names_sep = "_",
               values_to = "value") %>% 
  transmute(country = "United States", state, year, race, 
            statistic = "population",
            value, source = "INSERTSOURCENAMEHERE", notes = "",
            personentered = "Prathik", complete = "")