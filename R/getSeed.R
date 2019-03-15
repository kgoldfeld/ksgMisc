#' Generates a seed ...
#'
#' @return seed
#' @export

getSeed <- function() {

  prime <- TRUE

  while (prime) {
    initial_seed <- as.integer(Sys.time()) %% 1000000
    facs <- factors(initial_seed)
    if (is.numeric(facs)) { # not prime
      Seed <- sum(facs)
      prime <- FALSE
    }
  }

  Seed

}




