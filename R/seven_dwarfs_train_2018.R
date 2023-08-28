#' Seven Dwarfs Mine Train wait times in 2018
#'
#' A dataset containing hourly average posted and actual wait times for
#' Seven Dwarfs Mine Train in 2018
#'
#' @format A data frame with 5,622 rows and 14 variables:
#' \describe{
#'   \item{date}{Park Day (not actual date stamp of the wait time, since some are after midnight), Date}
#'   \item{wait_hour}{Hour of recorded wait time, numeric}
#'   \item{attraction_name}{Disney's official attraction name, alphanumeric}
#'   \item{wait_minutes_actual_avg}{Average actual Wait Time (in minutes), numeric}
#'   \item{wait_minutes_posted_avg}{Average standby Posted Wait Time (in minutes),	numeric}
#'   \item{attraction_park}{Disney theme park where the attraction is located}
#'   \item{attraction_land}{Section of the park an attraction is located}
#'   \item{park_open}{Opening time for park where attraction is located, HH:MM}
#'   \item{park_close}{Closing time for park where attraction is located, HH:MM}
#'   \item{park_extra_magic_morning}{Extra magic hour morning, Boolean}
#'   \item{park_extra_magic_evening}{Extra magic hour evening, Boolean}
#'   \item{day_ticket_season}{Walt Disney World Single Day Price Type, alphanumeric}
#'   \item{day_temperature_average}{Historical Average Temperature, numeric}
#'   \item{day_temperature_high}{Historical High Temperature, numeric}
#' }
#' @source Disney World Ride Wait Time Datasets, TouringPlans.com, August 2023,
#' \url{https://touringplans.com/walt-disney-world/crowd-calendar#DataSets}, Accessed 28 August 2023
"seven_dwarfs_train_2018"
