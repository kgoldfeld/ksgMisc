#  readExcel by ksg

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

#  readExcelMac

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

#  readExcelMac

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
