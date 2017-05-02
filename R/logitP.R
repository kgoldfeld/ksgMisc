#' Calculates log odds of a probability
#'
#' @param p Numeric.
#' @return Numeric
#' @export

logitP <- function(p) {
  return(log(ksgMisc::odds(p)))
}
