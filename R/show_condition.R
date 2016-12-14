#' Screens functions for messages
#'
#' Checks to see if function call returns error
#'
#' @param code Function call
#' @return If the function results in a message, the function returns a string
#' indicating "error", "warning", or "message"; otherwise the object of the
#' function call is returned.
#' @export
#'
show_condition <- function(code) {
  tryCatch(code,
           error = function(c) "error",
           warning = function(c) "warning",
           message = function(c) "message"
           )
}
