# state population data 1930
# DONE

# encoding scheme is gender_race_slavestatus_religion
# we want specific data on race, gender, and slave status
# we want cumulative data on white pop, colored pop, and slave pop

library(tidyverse)

state_1930 <- 
  read_csv("data/1930/nhgis0020_ds53_1930_state.csv") %>% 
  as_tibble() %>%
  mutate(year = YEAR, state = STATE) %>% 
  pivot_longer(cols = starts_with("BDJ"),
               names_to = "demographic") %>%
  mutate(demographic = parse_number(demographic),
         mod = demographic %% 13) %>% 
  transmute(country = "United States", 
            state,
            gender = ifelse(between(demographic, 1, 13) |
                              between(demographic, 27, 39) |
                              between(demographic, 53, 65),
                            "male", "female"),
            race = ifelse(between(demographic, 1, 26), "white",
                          ifelse(between(demographic, 27, 52), 
                                 "negro", "other")),
            age = case_when(mod == 0 ~ "unknown",
                            mod == 1 ~ "0_to_4",
                            mod == 2 ~ "5_to_0",
                            mod == 3 ~ "10_to_14",
                            mod == 4 ~ "15_to_19",
                            mod == 5 ~ "20_to_24",
                            mod == 6 ~ "25_to_29",
                            mod == 7 ~ "30_to_34",
                            mod == 8 ~ "35_to_44",
                            mod == 9 ~ "45_to_54",
                            mod == 10 ~ "55_to_64",
                            mod == 11 ~ "65_to_74",
                            mod == 12 ~ "75_and_over"),
            year = 1930,
            statistic = "population",
            value,
            source = "INSERTSOURCENAMEHERE",
            notes = "",
            personentered = "Prathik", 
            complete = "")