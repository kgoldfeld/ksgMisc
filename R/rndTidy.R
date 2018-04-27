#' Appends parameter estimates into list of data.table ...
#'
#' @param modelFit Model fit (works with glm and lm for sure) object
#' @param digits Number of digits to round to
#' @return plot
#' @export
#'
rndTidy <- function(modelFit, digits = 2) {

  tidyTable <- broom::tidy(modelFit)

  for (i in 1:ncol(tidyTable)) {

    if (is.numeric(tidyTable[,i]))
      tidyTable[,i] <- round(tidyTable[, i] , digits)

  }

  return(tidyTable)

}
