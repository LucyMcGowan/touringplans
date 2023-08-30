library(tidyverse)
library(glue)

clean_data <- function(x) {
  d <- read_csv(glue("data-raw/{x}"),
                              col_types = cols(
                                date = col_date(format = "%m/%d/%Y"),
                                wait_datetime = col_datetime(format = ""),
                                SACTMIN = col_double(),
                                SPOSTMIN = col_double()
                              ))
  d <- d %>%
    mutate(SACTMIN = ifelse(SACTMIN == -999, NA, SACTMIN),
           SPOSTMIN = ifelse(SPOSTMIN == -999, NA, SPOSTMIN))
  names(d) <- c("park_date", "wait_datetime", "wait_minutes_actual", "wait_minutes_posted")
  assign(gsub(".csv", "", x), d, envir = .GlobalEnv)
}

files <- list.files("data-raw", "*.csv")
attractions <- files[!grepl("entities|meta", files)]
walk(attractions, clean_data)

usethis::use_data(alien_saucers, overwrite = TRUE)
usethis::use_data(dinosaur, overwrite = TRUE)
usethis::use_data(expedition_everest, overwrite = TRUE)
usethis::use_data(flight_of_passage, overwrite = TRUE)
usethis::use_data(kilimanjaro_safaris, overwrite = TRUE)
usethis::use_data(navi_river, overwrite = TRUE)
usethis::use_data(pirates_of_caribbean, overwrite = TRUE)
usethis::use_data(rock_n_rollercoaster, overwrite = TRUE)
usethis::use_data(seven_dwarfs_train, overwrite = TRUE)
usethis::use_data(slinky_dog, overwrite = TRUE)
usethis::use_data(soarin, overwrite = TRUE)
usethis::use_data(spaceship_earth, overwrite = TRUE)
usethis::use_data(splash_mountain, overwrite = TRUE)
usethis::use_data(toy_story_mania, overwrite = TRUE)
