# state population data 1980 (NHGIS)
# - age ranges are too broad

library(tidyverse)

state_1980 <- 
  read_csv("data/1980/nhgis0020_ds107_1980_state.csv") %>% 
  as_tibble() %>%
  mutate(year = YEAR, state = STATE) %>% 
  pivot_longer(cols = starts_with("DGJ"),
               names_to = "demographic") %>%
  mutate(demographic = (parse_number(substr(demographic, 4, 6))),
         mod = demographic %% 5) %>% 
  transmute(country = "United States", 
            state,
            gender = ifelse(between(demographic %% 10, 1, 5),
                            "male", "female"),
            race = ifelse(between(demographic, 1, 10), "white",
                          ifelse(between(demographic, 11, 20), "black", 
                                 ifelse(between(demographic, 21, 30), "native",
                                        "aapi"))),
            age = case_when(mod == 0 ~ "65_and_over",
                            mod == 1 ~ "0_to_5",
                            mod == 2 ~ "5_to_14",
                            mod == 3 ~ "15_to_59",
                            mod == 4 ~ "60_to_64"),
            year = 1980,
            statistic = "population",
            value,
            source = "INSERTSOURCENAMEHERE",
            notes = "",
            personentered = "Prathik", 
            complete = "",
            demographic)