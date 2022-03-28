# state population data 1990
# DONE
#
# encoding scheme is gender_race_slavestatus_religion
# we want specific data on race, gender, and slave status
# we want cumulative data on white pop, colored pop, and slave pop

library(tidyverse)

state_1990 <- 
  read_csv("data/1990/nhgis0020_ds120_1990_state.csv") %>% 
  as_tibble() %>%
  mutate(year = YEAR, state = STATE) %>% 
  pivot_longer(cols = starts_with("ET4"),
               names_to = "demographic") %>%
  mutate(demographic = (parse_number(substr(demographic, 4, 6))),
         mod = demographic %% 31) %>% 
  transmute(country = "United States", 
            state,
            gender = ifelse(between(demographic, 1, 18) |
                              between(demographic, 37, 54),
                            "male", "female"),
            race = ifelse(between(demographic, 1, 62), "white", 
                          ifelse(between(demographic, 63, 124), "black",
                                 ifelse(between(demographic, 125, 186), "native",
                                        ifelse(between(demographic, 187, 248), "aapi",
                                               "other")))),
            age = case_when(mod == 0 ~ "85_and_over",
                            mod == 1 ~ "0_to_1",
                            mod == 2 ~ "1_to_2",
                            mod == 3 ~ "3_to_4",
                            mod == 4 ~ "5",
                            mod == 5 ~ "6",
                            mod == 6 ~ "7_to_9",
                            mod == 7 ~ "10_to_11",
                            mod == 8 ~ "12_to_13",
                            mod == 9 ~ "14",
                            mod == 10 ~ "15",
                            mod == 11 ~ "16",
                            mod == 12 ~ "17",
                            mod == 13 ~ "18",
                            mod == 14 ~ "19",
                            mod == 15 ~ "20",
                            mod == 16 ~ "21",
                            mod == 17 ~ "22_to_24",
                            mod == 18 ~ "25_to_29",
                            mod == 19 ~ "30_to_34",
                            mod == 20 ~ "35_to_39",
                            mod == 21 ~ "40_to_44",
                            mod == 22 ~ "45_to_49",
                            mod == 23 ~ "50_to_54",
                            mod == 24 ~ "55_to_59",
                            mod == 25 ~ "50_to_61",
                            mod == 26 ~ "62_to_64",
                            mod == 27 ~ "65_to_69",
                            mod == 28 ~ "70_to_74",
                            mod == 29 ~ "75_to_79",
                            mod == 30 ~ "80_to_84"),
            year = 1990,
            statistic = "population",
            value,
            source = "INSERTSOURCENAMEHERE",
            notes = "",
            personentered = "Prathik", 
            complete = "",
            demographic)