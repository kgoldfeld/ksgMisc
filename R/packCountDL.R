#' Counts number of simstudy downloads ...
#'
#' @param startdate Character date that represents point
#' from which to start counting.
#' @param package Package name
#' @return integer
#' @export

pkgDLcount <- function(startdate = "2016-06-21", package = "simstudy") {

  DT <- data.table::data.table(
    cranlogs::cran_downloads(packages = package,
                             from = startdate,
                             to = Sys.Date()))

  DT[, sum(count)]

}

