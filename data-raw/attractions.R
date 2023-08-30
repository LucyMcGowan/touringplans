library(tidyverse)

attractions <- read_csv("data-raw/entities.csv",
                        col_types = cols(
                          code = col_character(),
                          name = col_character(),
                          short_name = col_character(),
                          land = col_character(),
                          opened_on = col_date(format = "%m/%d/%Y"),
                          duration = col_double(),
                          average_wait_per_hundred = col_double()
                        ))

attractions <- attractions %>%
  mutate(park = case_when(
    grepl("AK", code) ~ "Disney's Animal Kingdom",
    grepl("CA", code) ~ "California Adventure",
    grepl("DL", code) ~ "Disneyland",
    grepl("EP", code) ~ "Epcot",
    grepl("HS", code) ~ "Disney's Hollywood Studios",
    grepl("MK", code) ~ "Magic Kingdom"
  ),
  state = case_when(
    grepl("AK", code) ~ "Florida",
    grepl("CA", code) ~ "California",
    grepl("DL", code) ~ "California",
    grepl("EP", code) ~ "Florida",
    grepl("HS", code) ~ "Florida",
    grepl("MK", code) ~ "Florida"
  ) ) %>%
  select(code, name, short_name, state, park, land, opened_on, duration, average_wait_per_hundred)

attraction_datasets <- tibble(
  dataset_name =  Hmisc::Cs(alien_saucers, dinosaur, expedition_everest, flight_of_passage,
                            kilimanjaro_safaris, navi_river, pirates_of_caribbean,
                            rock_n_rollercoaster, seven_dwarfs_train, slinky_dog, soarin,
                            spaceship_earth, splash_mountain, toy_story_mania),
  name = c("Alien Swirling Saucers", "DINOSAUR", "Expedition Everest - Legend of the Forbidden Mountain",
           "Avatar Flight of Passage", "Kilimanjaro Safaris", "Na'vi River Journey", "Pirates of the Caribbean",
           "Rock 'n' Roller Coaster Starring Aerosmith", "Seven Dwarfs Mine Train", "Slinky Dog Dash",
           "Soarin' Around the World", "Spaceship Earth", "Splash Mountain", "Toy Story Mania!")
)

attraction_datasets %>%
  left_join(attractions %>% filter(state == "Florida"), by = "name") %>%
  select(dataset_name, name, short_name, park, land, opened_on, duration,
         average_wait_per_hundred) -> attraction_datasets

usethis::use_data(attractions, overwrite = TRUE)
attractions_metadata <- attraction_datasets
usethis::use_data(attractions_metadata, overwrite = TRUE)

