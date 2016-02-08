#' Calculates odds of a probability
#'
#' @param p Numeric.
#' @return Numeric
#' @export

odds <- function(p) {
  return((p/(1-p)))
}
