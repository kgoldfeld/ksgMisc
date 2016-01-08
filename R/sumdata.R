#' Create summary - n, mean, sd, min, max of all numerical data
#'
#' @param dt a data.table with at least one numeric column
#' @return A data.table with summary stats: n, min, max, mean, sd
#' @import data.table
#' @export
#'


sumData <- function(dt) {

  dtNames <- names(dt)
  n <- length(dtNames)

  N <- list()
  means <- list()
  sds <- list()
  maxs <- list()
  mins <- list()

  for (i in (1:n)) {
    N[[i]] <- sum(!is.na(dt[,get(dtNames[i])]))
    maxs[[i]] <- max(dt[,get(dtNames[i])], na.rm = TRUE)
    mins[[i]] <- min(dt[,get(dtNames[i])], na.rm = TRUE)
    if (is.numeric(dt[,get(dtNames[i])])) {
      means[[i]] <- mean(dt[,get(dtNames[i])], na.rm = TRUE)
      sds[[i]] <- sd(dt[,get(dtNames[i])], na.rm = TRUE)
    } else {
      means[[i]]=NA
      sds[[i]]=NA
    }
  }

  sumdat <- data.table::data.table(varName = dtNames,
                                   N = unlist(N),
                                   min = unlist(mins),
                                   max = unlist(maxs),
                                   mean = unlist(means),
                                   sd = unlist(sds)
  )

  return(sumdat)
}

