#' Prepare table for printing
#'
#' @param tab data.table created by myTableOne ...
#' @param missing Flag to indicate if count of missing data should be included in table
#' @return data.table
#' @export

prepTable <- function(tab, missing = FALSE) {

  result <- list()
  dtab <- tab$table
  j <- 0

  for (i in (1 : nrow(dtab))) {

    j <- j + 1

    nMiss <- dtab[i, nMiss]
    if (nMiss == 0) missString <- "-"
    else missString = nMiss

    if (dtab[i, isFac]) {

      varName <- paste(dtab[i, var], "=", dtab[i, category], "(n/%)")
      sumStat <- dtab[i, sumStat] # can create here in future

    } else  {


      varName <- paste(dtab[i, var], "(avg/sd)")
      sumStat <- dtab[i, sumStat] # can create here in future


    }

    result[[j]] <- data.table(varName, missString, sumStat)

  }

  result <- rbindlist(result)

  if (! missing) result <- result[,-"missString"]

  return(result)

}
