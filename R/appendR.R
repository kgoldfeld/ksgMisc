#' Appends parameter estimates into list of data.table ...
#'
#' @param result List of data.tables that contain results
#' @param modelFit Model fit (works with glm and lm for sure)
#' @param all Indicator. If TRUE, include Estimate, SE,
#' Test Statistic, and p-Value. If FALSE, include
#' Estimate and p-Value only.
#' @param noIntercept If TRUE, exclude Intercept estimates.
#' @return plot
#' @export

appendR <- function(result, modelFit, all = FALSE, noIntercept = FALSE) {

  iterRes <- broom::tidy(modelFit)

  if (noIntercept) iterRes <- iterRes[-1,]

  est <- data.table::data.table(t(iterRes$estimate))
  p <- data.table::data.table(t(iterRes$p.value))

  names(p) <- iterRes$term
  names(est) <- iterRes$term

  rbEst <- rbind(result$est, est)
  rbP <- rbind(result$p, p)

  if (all) {
    se <- data.table::data.table(t(iterRes$std.error))
    stat <- data.table::data.table(t(iterRes$statistic))

    rbSE <- rbind(result$se, se)
    rbStat <- rbind(result$stat, stat)
  }

  if (!all) return(list(est=rbEst, p=rbP))
  else return(list(est=rbEst, se=rbSE, stat=rbStat, p=rbP))

}
