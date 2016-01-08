#' Estimate confidence intervals from GLM
#'
#' @param object a glm fitted model object.
#' @return A data.table that stores a confidence interval
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

#
# confint.expgee <- function(object, parm, level = 0.95, ...) {
#   cc <- coef(summary(object))
#   mult <- qnorm((1+level)/2)
#   ci <- with(as.data.frame(cc),
#              cbind(lwr=exp(Estimate-mult*Std.err),
#                    upr=exp(Estimate+mult*Std.err)
#              )
#   )
#   data.table(var = names(coef(object)),
#              est = exp(coef(object)),
#              ci)
# }
#
#
#

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

