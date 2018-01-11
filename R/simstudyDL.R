#' PLots number of simstudy downloads ...
#'
#' @param period Integer value length of period, defaults to 7 (week)
#' @return plot
#' @export


simstudyDL <- function(period = 7, package = "simstudy", cumulative = FALSE) {

  downloads <- data.table::data.table(cranlogs::cran_downloads(packages = c(package),
                                                   from = "2016-06-21", to = Sys.Date()))
  nperiods <- ceiling(nrow(downloads) / period)

  suppressWarnings(downloads[, period := rep(1:nperiods, each = period)])
  downloads[, mdate := min(date), keyby = period]

  dlagg <- downloads[, .(count = sum(count)), keyby = mdate]

  if (cumulative) {
    dlagg[, count := cumsum(count)]
  }

  p <- ggplot2::ggplot(data=dlagg, ggplot2::aes(x = mdate, y=count)) +
    ggplot2::geom_line() +
    ggplot2::ylab("Count") +
    ggplot2::theme(axis.title.x = ggplot2::element_blank(),
                   panel.grid.minor = ggplot2::element_blank()
    )

  return(p)

}

