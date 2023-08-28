#' Pirates of the Caribbean Wait Times
#'
#' A dataset containing Pirates of the Caribbean wait times.
#'
#' @format A data frame with 301,946 rows and 4 variables:
#' \describe{
#'   \item{date}{Park Day (not actual date stamp of the wait time, since some are after midnight), Date}
#'   \item{datetime}{date-time stamp of wait time,	YYYY-MM-DD HH:MM:SS}
#'   \item{wait_minutes_actual}{Actual Wait Time (in minutes), numeric}
#'   \item{wait_minutes_posted}{Standby Posted Wait Time (in minutes),	numeric}
#'   }
#' @source "pirates_of_caribbean.csv" Disney World Ride Wait Time Datasets, TouringPlans.com, August 2023,
#' \url{https://touringplans.com/walt-disney-world/crowd-calendar#DataSets}, Accessed 28 August 2023
"pirates_of_caribbean"
