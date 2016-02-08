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
