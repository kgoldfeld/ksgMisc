% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/writeexcel.R
\name{writeExcel}
\alias{writeExcel}
\title{Writes from data frame to the clipboard: windows only}
\usage{
writeExcel(x, row.names = FALSE, col.names = TRUE, ...)
}
\arguments{
\item{x}{data frame}

\item{row.names}{True / False}

\item{col.names}{True / False}

\item{...}{extra arguments}
}
\value{
Pastes data frame to clipboard
}
\description{
Wrapper for write.table that writes to the clipboard from a data.frame with
the header - works only on Windows.
}
