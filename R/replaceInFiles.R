#' Find and replace text in all files in a directory
#'
#' @param directory Location of files to be changed
#' @param oldtext Current text
#' @param newtext New text
#' @return Nothing
#' @export
#'
replaceInFiles <- function(directory, oldtext, newtext) {

  origdir <- getwd()
  setwd(directory)
  filenames <- list.files()

  for( f in filenames ){

    x <- readLines(f)
    y <- gsub( oldtext, newtext, x )
    cat(y, file = f, sep = "\n")

  }

  setwd(origdir)

  cat("Files updated ...\n")

}
