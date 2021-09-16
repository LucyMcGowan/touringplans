library(tidyverse)

toy_story_mania <- read_csv("data-raw/toy_story_mania.csv",
                            col_types = cols(
                              date = col_date(format = "%m/%d/%Y"),
                              datetime = col_datetime(format = ""),
                              SACTMIN = col_double(),
                              SPOSTMIN = col_double()
                            ))
toy_story_mania <- toy_story_mania %>%
  mutate(SACTMIN = ifelse(SACTMIN == -999, NA, SACTMIN),
         SPOSTMIN = ifelse(SPOSTMIN == -999, NA, SPOSTMIN))
names(toy_story_mania) <- tolower(names(toy_story_mania))
usethis::use_data(toy_story_mania, overwrite = TRUE)
