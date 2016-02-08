#' Reads from clipboard into data.frame: mac
#'
#' Wrapper for read.table that reads from the clipboard into a data.frame with
#' or without the header - works only on a Mac and is limited to 100 lines.
#'
#' @param header True / False.
#' @param ... extra arguments
#' @return A data frame
#' @export

readExcelMac <- function(header=TRUE,...) {
  read.table(pipe("pbpaste"), sep="\t", header=T)
}

