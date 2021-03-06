# dtSample

#' Sample ids from a data.table
#'
#' @param dt A data.table.
#' @param n An integer.
#' @param sID A string.
#' @param repVal True or False
#' @return A vector
#' @export

dtSample <- function(dt,n,sID,repVal=FALSE) {
  dt[,sample(unique(get(sID)),n,replace=repVal)]
}
