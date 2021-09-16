replace_null <- function(x) {
  x[sapply(x, is.null)] <- NA
  return(x)
}
