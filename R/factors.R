#' Finds factor of integer n...
#'
#' @param n Integer
#' @return Vector of unique factors
#' @export


factors <- function(n) {

  if ( floor(n) != n ) stop("Can only evaluate integers")

  dt <- data.table::data.table(f1 = as.numeric(2 : floor(sqrt(n))),
                   f2 = n / (2 : floor(sqrt(n))))[(f2 == floor(f2))]

  factors <- unique(data.table::melt(dt, measure.vars = c("f1","f2"))$value)
  facs <- factors[order(factors)]

  if (length(facs) == 0) return("Prime number")
  else return(facs)

}
