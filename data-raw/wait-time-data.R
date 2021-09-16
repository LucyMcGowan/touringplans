library(tidyverse)
library(glue)

clean_data <- function(x) {
  d <- read_csv(glue("data-raw/{x}.csv"),
                              col_types = cols(
                                date = col_date(format = "%m/%d/%Y"),
                                datetime = col_datetime(format = ""),
                                SACTMIN = col_double(),
                                SPOSTMIN = col_double()
                              ))
  d <- d %>%
    mutate(SACTMIN = ifelse(SACTMIN == -999, NA, SACTMIN),
           SPOSTMIN = ifelse(SPOSTMIN == -999, NA, SPOSTMIN))
  names(d) <- tolower(names(d))
}

usethis::use_data(toy_story_mania, overwrite = TRUE)
