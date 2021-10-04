#' Reduced data set for Disney World attraction wait times in 2018
#'
#' A dataset containing hourly average posted and actual wait times for
#' select Disney World attractions in 2018
#'
#' @format A data frame with 66,492 rows and 13 variables:
#' \describe{
#'   \item{date}{Park Day (not actual date stamp of the wait time, since some are after midnight), Date}
#'   \item{hour}{Hour of recorded wait time, numeric}
#'   \item{name}{Disney's official attraction name, alphanumeric}
#'   \item{avg_sactmin}{Average actual Wait Time (in minutes), numeric}
#'   \item{avg_spostmin}{Average standby Posted Wait Time (in minutes),	numeric}
#'   \item{average_wait_per_hundred}{The average wait per 100 guests in line, numeric}
#'   \item{duration}{Duration of attraction in minutes, numeric}
#'   \item{park}{Disney theme park where the attraction is located}
#'   \item{land}{Section of the park an attraction is located}
#'   \item{open}{Opening time for park where attraction is located, HH:MM}
#'   \item{close}{Closing time for park where attraction is located, HH:MM}
#'   \item{extra_magic_morning}{Extra magic hour morning, Boolean}
#'   \item{extra_magic_evening}{Extra magic hour evening, Boolean}
#'   \item{wdw_ticket_season}{Walt Disney World Single Day Price Type, alphanumeric}
#'   \item{short_name}{Short name, alphanumeric}
#' }
#' @source Disney World Ride Wait Time Datasets, TouringPlans.com, September 2021,
#' \url{https://touringplans.com/walt-disney-world/crowd-calendar#DataSets}, Accessed 16 September 2021
"touringplans_2018"
