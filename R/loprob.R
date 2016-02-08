#' Converts logodds to probabilty
#'
#' @param logodds Numeric.
#' @return Numeric
#' @export

loProb <- function(logodds) {
  return(exp(logodds) / (1 + exp(logodds)))
}
