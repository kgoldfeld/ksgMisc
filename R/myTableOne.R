#' Creates Table 1 data
#'
#' @param dT data.table with raw data that needs to be summarized. Exclude
#' any fields that should not be in Table 1, such as id information
#' @param digits Specify precision
#' @return data.table
#' @export

myTableOne <- function(dT, digits = 2) {

  result <- list()
  j <- 0

  for (i in names(dT)) {

    j <- j + 1
    veci <- dT[[i]]

    nMiss <- sum(is.na(veci))
    pMiss <- round(nMiss / length(veci), digits)

    if (is.factor(veci)) {

      ns <- table(veci)
      ps <- prop.table(ns)

      sumStat <- paste0(ns[2] ," (", (round(ps[2]*100, digits-1)), ")")
      category = levels(veci)[2]
      isFac = 1

    } else  {

      avg = mean(veci, na.rm = TRUE)
      std = sd(veci, na.rm = TRUE)

      sumStat <- paste0(round(avg, digits-1) ," (", round(std, digits), ")")
      category = ""
      isFac = 0

    }

    result[[j]] <- data.table(var = i, isFac, category, nMiss, pMiss, sumStat)

  }

  result <- rbindlist(result)

  return(list(table = result, n = nrow(dT)))

}
