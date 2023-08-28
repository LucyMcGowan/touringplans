library(tidyverse)
library(lubridate)
library(touringplans)
library(glue)

group_hourly <- function(x, y) {
  x %>%
    filter(year(date) == 2018) %>%
    mutate(hour = hour(datetime)) %>%
    group_by(date, hour) %>%
    summarise(wait_minutes_actual_avg = mean(wait_minutes_actual, na.rm = TRUE),
              wait_minutes_posted_avg = mean(wait_minutes_posted, na.rm = TRUE), .groups = "drop") %>%
    mutate(wait_minutes_posted_avg = ifelse(is.nan(wait_minutes_posted_avg), NA, wait_minutes_posted_avg),
           wait_minutes_actual_avg = ifelse(is.nan(wait_minutes_actual_avg), NA, wait_minutes_actual_avg),
           dataset_name = y) %>%
    filter(!(is.na(wait_minutes_posted_avg) & is.na(wait_minutes_actual_avg))) -> x
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
  select(date, hour, name, wait_minutes_actual_avg, wait_minutes_posted_avg, average_wait_per_hundred,
         duration, park, land, open, close, extra_magic_morning,
         extra_magic_evening, wdw_ticket_season, wdwmeantemp, wdwmaxtemp, short_name) |>
  rename(
    wait_hour = hour,
    attraction_name = name,
    attraction_wait_per_hundred_average = average_wait_per_hundred,
    attraction_duration = duration,
    attraction_park = park,
    attraction_land = land,
    park_open = open,
    park_close = close,
    park_extra_magic_morning = extra_magic_morning,
    park_extra_magic_evening = extra_magic_evening,
    day_ticket_season = wdw_ticket_season,
    day_temperature_high = wdwmaxtemp,
    day_temperature_average = wdwmeantemp,
    attraction_short_name = short_name
    ) -> touringplans_2018

touringplans_2018 %>%
  select(-attraction_wait_per_hundred_average, -attraction_duration, -attraction_short_name) %>%
  filter(attraction_name == "Seven Dwarfs Mine Train") -> seven_dwarfs_train_2018

usethis::use_data(touringplans_2018, overwrite = TRUE)
usethis::use_data(seven_dwarfs_train_2018, overwrite = TRUE)


