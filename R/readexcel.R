#' Reads from clipboard into data.frame: windows
#'
#' Wrapper for read.table that reads from the clipboard into a data.frame with
#' or without the header - works only on Windows.
#'
#' @param header True / False.
#' @param ... extra arguments
#' @return A data frame
#' @export

readExcel <- function(header=TRUE,...) {
  read.table("clipboard",sep="\t",header=header,...)
}
