#' Find and replace text in all files in a directory
#'
#' @param directory Location of files to be changed
#' @param oldtext Current text
#' @param newtext New text
#' @param verbose Indicates whether updated files should be printed. Defaults to TRUE.
#' @return Nothing
#' @export
#'
replaceInFiles <- function(directory, oldtext, newtext, verbose = TRUE) {

  origdir <- getwd()
  setwd(directory)
  filenames <- list.files()

  if (verbose) cat("Files updated ...\n\n")

  for( f in filenames ){

    x <- readLines(f)

    if (length(grep(oldtext, x)) != 0) {
      y <- gsub( oldtext, newtext, x )
      cat(y, file = f, sep = "\n")
      if (verbose) cat(f, "\n")
    }
  }

  cat("\n")
  setwd(origdir)

}
