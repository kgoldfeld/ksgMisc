#' Removes axis titles quickly ...
#'
#' @param axis that is referenced: x, y, or both
#' @return ggplot theme
#' @export

noAxisTitle <- function(arg="both") {

  if (arg == "x") {

    theme(axis.title.x = element_blank())

  } else if (arg == "y") {

    theme(axis.title.y = element_blank())

  } else if (arg == "both") {

    theme(axis.title.x = element_blank(),
          axis.title.y = element_blank()
    )
  }
}
