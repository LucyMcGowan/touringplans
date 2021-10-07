library(tidyverse)
library(lubridate)
library(touringplans)
library(glue)

group_hourly <- function(x, y) {
  x %>%
    filter(year(date) == 2018) %>%
    mutate(hour = hour(datetime)) %>%
    group_by(date, hour) %>%
    summarise(avg_sactmin = mean(sactmin, na.rm = TRUE),
              avg_spostmin = mean(spostmin, na.rm = TRUE), .groups = "drop") %>%
    mutate(avg_spostmin = ifelse(is.nan(avg_spostmin), NA, avg_spostmin),
           avg_sactmin = ifelse(is.nan(avg_sactmin), NA, avg_sactmin),
           dataset_name = y) %>%
    filter(!(is.na(avg_spostmin) & is.na(avg_sactmin))) -> x
  x
}

d <- list(alien_saucers, dinosaur, expedition_everest, flight_of_passage,
          kilimanjaro_safaris, navi_river, pirates_of_caribbean,
          rock_n_rollercoaster, seven_dwarfs_train, slinky_dog, soarin,
          spaceship_earth, splash_mountain, toy_story_mania)
n <- Hmisc::Cs(alien_saucers, dinosaur, expedition_everest, flight_of_passage,
               kilimanjaro_safaris, navi_river, pirates_of_caribbean,
               rock_n_rollercoaster, seven_dwarfs_train, slinky_dog, soarin,
               spaceship_earth, splash_mountain, toy_story_mania)
d <- map2(d, n, group_hourly)

d <- bind_rows(d) %>%
  left_join(touringplans_datasets, by = "dataset_name")

d %>%
  left_join(touringplans_metadata, by = "date") %>%
  mutate(
    open = case_when(
      grepl("Hollywood", park) ~ hsopen,
      grepl("Epcot", park) ~ epopen,
      grepl("Animal", park) ~ akopen,
      grepl("Magic", park) ~ mkopen,
    ),
    close = case_when(
      grepl("Hollywood", park) ~ hsclose,
      grepl("Epcot", park) ~ epclose,
      grepl("Animal", park) ~ akclose,
      grepl("Magic", park) ~ mkclose,
    ),
    extra_magic_morning = case_when(
      grepl("Hollywood", park) ~ hsemhmorn,
      grepl("Epcot", park) ~ epemhmorn,
      grepl("Animal", park) ~ akemhmorn,
      grepl("Magic", park) ~ mkemhmorn,
    ),
    extra_magic_evening = case_when(
      grepl("Hollywood", park) ~ hsemheve,
      grepl("Epcot", park) ~ epemheve,
      grepl("Animal", park) ~ akemheve,
      grepl("Magic", park) ~ mkemheve,
    )) %>%
  select(date, hour, name, avg_sactmin, avg_spostmin, average_wait_per_hundred,
         duration, park, land, open, close, extra_magic_morning,
         extra_magic_evening, wdw_ticket_season, weather_wdwhigh, short_name) -> touringplans_2018

touringplans_2018 %>%
  select(-average_wait_per_hundred, -duration, -short_name) %>%
  filter(name == "Seven Dwarfs Mine Train") -> seven_dwarfs_train_2018

usethis::use_data(touringplans_2018, overwrite = TRUE)
usethis::use_data(seven_dwarfs_train_2018, overwrite = TRUE)


