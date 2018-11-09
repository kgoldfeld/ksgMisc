#' Plots number of simstudy downloads ...
#'
#' @param x Vector of 1's or zero's
#' @return Integer value of vector
#' @export

bitsToInt<-function(x) {

  if (is.character(x)) {
    y <- as.integer(strsplit(x, split=NULL)[[1]])
  } else if (is.numeric(x)) {
    y <- x
  }

  packBits(rev(c(rep(FALSE, 32-length(y)%%32), as.logical(y))), "integer")

}
