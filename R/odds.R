#' Converts logodds to probabilty
#'
#' @param logodds Numeric.
#' @return Numeric
#' @export

loProb <- function(logodds) {
  return(exp(logodds) / (1 + exp(logodds)))
}

# Function logit coverts probability to log odds

#' Calculates log odds of a probability
#'
#' @param p Numeric.
#' @return Numeric
#' @export

logitP <- function(p) {
  return(log(odds(p)))
}

# Function odds coverts probability to odds

#' Calculates odds of a probability
#'
#' @param p Numeric.
#' @return Numeric
#' @export

odds <- function(p) {
  return((p/(1-p)))
}
