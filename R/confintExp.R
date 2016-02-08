#' Estimate confidence intervals from GLM
#'
#' @param object A glm fitted model object.
#' @return Data.table that stores a confidence interval
#' @export
#'

confintExp <- function(object) {

  ci <- exp(confint(object,names(coef(object))))
  colnames(ci) <- c("lwr","upr")

  if (is.vector(ci)) ci = matrix(ci, nrow=1)

  data.table::data.table(var = names(coef(object)),
                         est = exp(coef(object)),
                         ci
  )
}



