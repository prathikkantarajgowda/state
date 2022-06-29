# R script that executes every decade and compiles it into one tibble

library(dplyr)

decades <- list.files("code/")

for (i in decades) {
  source(file.path("code/", i))
}

decades_tibble <- 
  rbind(state_1790, state_1800, state_1810, state_1820, state_1830, state_1840,
        state_1850, state_1860, state_1870, state_1880, state_1890, state_1900,
        state_1910, state_1920, state_1930, state_1940, state_1950, state_1960,
        state_1970, state_1980, state_1990, state_2000)