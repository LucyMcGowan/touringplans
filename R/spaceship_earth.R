#' Spaceship Earth Wait Times
#'
#' A dataset containing Spaceship Earth wait times.
#'
#' @format A data frame with 242,727 rows and 4 variables:
#' \describe{
#'   \item{date}{Park Day (not actual date stamp of the wait time, since some are after midnight), Date}
#'   \item{datetime}{date-time stamp of wait time,	YYYY-MM-DD HH:MM:SS}
#'   \item{sactmin}{Actual Wait Time (in minutes), numeric}
#'   \item{spostmin}{Standby Posted Wait Time (in minutes),	numeric}
#'   }
#' @source "spaceship_earth.csv" Disney World Ride Wait Time Datasets, TouringPlans.com, September 2021,
#' \url{https://touringplans.com/walt-disney-world/crowd-calendar#DataSets}, Accessed 16 September 2021
"spaceship_earth"
