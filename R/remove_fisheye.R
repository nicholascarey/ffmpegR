#' Remove fisheye
#'
#' Remove fisheye effect from a GoPro Hero Black 5 or 6
#'
#' @param dir string. Directory location of file you want to trim. If left NULL
#'   uses current working directory.
#' @param file string. Name of file in `dir` or current working directory.
#' @param output string. Name of new file, without filetype extension. If left
#'   NULL output is named same as the original file appended with `_no_fisheye`.
#' @param remove_audio logical. If TRUE audio is removed from the copy.
#'
#' @importFrom glue glue
#'
#' @export
#'
#' @examples
#' # Commented out because we don't want package checks to actually run this
#' #
#' # remove_fisheye(file = "path/to/file",
#' #                dir = "path/to/dir",
#' #                output = "output",
#' #                remove_audio = FALSE)

## To do
## Customisation of the parameters - gotta be a database somewhere of different settings

remove_fisheye <- function(file = NULL,
                           dir = NULL,
                           output = NULL,
                           remove_audio = FALSE){


  # Input checks ------------------------------------------------------------

  # Set and restore working directory ---------------------------------------

  ## set working directory if entered

  orig_wd <- getwd()

  if(!is.null(dir)){
    setwd(dir)
  }

  # Restore working directory ----------------------------------------------
  try(on.exit(setwd(orig_wd)), silent = TRUE)



  # Determine file type -----------------------------------------------------

  ## extract end few characters of file
  ## Should not be more than 5
  file_tail <- right(file, 5)

  ## Find where the dot is
  ## Note need to double escape "."
  dot_loc <- gregexpr("\\.", file_tail)[[1]][1]

  ## sub out file extension
  ext <- substr(file_tail, dot_loc, 5)

  ## replace space for double escape
  file <- gsub(" ", "\\\\ ", file)


  ## name output if not entered
  if(is.null(output)) output <- gsub(ext, "", file)


  # Remove audio ------------------------------------------------------------

  ifelse(remove_audio, rma <- "-an", rma <- "")

  # Build system command ----------------------------------------------------

  # ffmpeg -i /Volumes/Untitled/DCIM/100GOPRO/GOPR0023.MP4 -vf 'lenscorrection=k2=0.006:k1=-0.18' output.mp4

  ## build ffmpeg command on OS specific basis
  ## For Mac
  if(os() == "mac"){
    message("Removing fisheye effect...")
    instruction_string <-
      glue::glue('ffmpeg -y -i ', file, rma, ' -vf', ' \'lenscorrection=k2=0.006:k1=-0.18\' ', output, "_no_fisheye", ext)

    ## run the command
    system(instruction_string)

    ## For other OS
    ## No plans to, but might implement Windows/Linux at a future date if someones
    ## asks
  } else if(os() != "mac"){
    stop("This OS not yet supported.")
  }
}
