#' Create a data.table of ci strings
#'
#' @param object a data.table created by function confintExp
#' @param digits number of digits to be printed
#' @return A data.table that stores a confidence interval in string format
#' @export
#'

estciStr <- function(object,digits=3) {

  est <- round(object$est,digits)
  lwr <- round(object$lwr,digits)
  upr <- round(object$upr,digits)

  ci.str <- paste0(format(est,nsmall=digits),
                   " (",
                   format(lwr,nsmall=digits),
                   ",",
                   format(upr,nsmall=digits),
                   ")" )
  data.table::data.table(var=object$var,ci.str)

}
