#' Sets "theme" for ggplot2
#'
#' Resets defaults for themes ...
#'
#' @param panelback Color of panel background
#' @return ggplot theme
#' @export

theme_ksg <- function(panelback="white") {
  ggplot2::theme(
    panel.background = element_rect(fill = panelback),
    panel.grid = element_blank(),
    axis.ticks =  element_line(colour = "black"),
    panel.spacing =unit(0.25, "lines"),  # requires package grid
    plot.title = element_text(size = 12,vjust=.5,hjust=0),
    panel.border = element_rect(fill = NA, colour="gray90")
  )
}
