#' PLots number of simstudy downloads ...
#'
#' @param period Integer value length of period, defaults to 7 (week)
#' @return plot
#' @export

pkgDLplot <- function(package = "simstudy", by_period = "day", cumulative = TRUE) {

  downloads <- data.table::data.table(cranlogs::cran_downloads(packages = c("simstudy"),
                                                               from = "2016-06-21", to = Sys.Date()))

  downloads[, `:=`(month = data.table::month(date),
                   year = data.table::year(date))]

  if (by_period == "month") {

    pdata <- downloads[, .(count = sum(count)), keyby = .(year, month)]
    pdata[, mdate := ISOdate(year = year, month = month, day = 1)]
    if (cumulative) pdata[, count := cumsum(count)]

    p <- ggplot2::ggplot(data=pdata, ggplot2::aes(x = mdate, y=count))


  } else if (by_period == "year") {

    pdata <- downloads[, .(count = sum(count)), keyby = .(year)]
    if (cumulative) pdata[, count := cumsum(count)]

    p <- ggplot2::ggplot(data=pdata, ggplot2::aes(x = year, y=count))

  } else {

    pdata <- downloads
    if (cumulative) pdata[, count := cumsum(count)]

    p <- ggplot2::ggplot(data=pdata, ggplot2::aes(x = date, y=count))

  }

  p <- p +
    ggplot2::geom_line(size = 1.5, color = "#7fab4a") +
    ggplot2::ylab("Count") +
    ggplot2::theme(axis.title.x = ggplot2::element_blank(),
                   panel.grid.minor = ggplot2::element_blank(),
                   panel.grid.major.y = ggplot2::element_blank()
    )

  return(p)

}

