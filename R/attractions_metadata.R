#' Metadata about attractions included in datasets
#'
#' A dataset containing data about Disney theme park attractions.
#'
#' @format A data frame with 14 rows and 8 variables:
#' \describe{
#'   \item{dataset_name}{Name of dataset for ride wait times in this package, alphanumeric}
#'   \item{name}{Disney's official attraction name, alphanumeric}
#'   \item{short_name}{Short name, alphanumeric}
#'   \item{park}{Disney theme park where the attraction is located}
#'   \item{land}{Section of the park an attraction is located}
#'   \item{opened_on}{Attraction's opening date, date}
#'   \item{duration}{Duration of attraction in minutes, numeric}
#'   \item{average_wait_per_hundred}{The average wait per 100 guests in line, numeric}
#'   }
#' @source "entities.csv" Disney World Ride Wait Time Datasets, TouringPlans.com, August 2023,
#' \url{https://touringplans.com/walt-disney-world/crowd-calendar#DataSets}, Accessed 28 August 2023
"attractions_metadata"
