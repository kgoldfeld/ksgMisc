#' Writes from data frame to the clipboard: windows only
#'
#' Wrapper for write.table that writes to the clipboard from a data.frame with
#' the header - works only on Windows.
#'
#' @param x data frame
#' @param row.names True / False
#' @param col.names True / False
#' @param ... extra arguments
#' @return Pastes data frame to clipboard
#' @export

writeExcel <- function(x,row.names=FALSE,col.names=TRUE,...) {
  write.table(x,"clipboard",sep="\t",row.names=row.names,col.names=col.names,...)
}
