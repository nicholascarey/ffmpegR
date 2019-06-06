## utility functions

#' Check operating system
#'
#' This is the version that also checks for XP.
#'
#' @keywords internal
#' @export
os <- function() {
  if (Sys.info()["release"] == "XP")
    "xp" else if (.Platform$OS.type == "windows")
      "win" else if (Sys.info()["sysname"] == "Darwin")
        "mac" else if (.Platform$OS.type == "unix")
          "unix" else stop("Unknown OS")
}


#' Right substring function.
#' @keywords internal

right <- function(string, n) {
  ## substring from
  output <- substr(string, nchar(string) - (n - 1), nchar(string))

  ## make same class (i.e. if numeric, make numeric; if text, make text etc.)
  class(output) <- class(string)

  return(output)
}
