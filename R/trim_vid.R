#' trim_vid
#'
#' Trims a movie file to the given `from` and `to` timepoints.
#'
#' Either have the file in the current working directory, or specify the
#' location with `dir`, in which case the working directory is unchanged.
#'
#' Can rename the output file using `output`, otherwise it will be named the
#' same as the original file appended with `_trim`. It will overwrite any
#' previous trimmed file with the same name.
#'
#' No format conversion or rencoding is done. New file is same format as old.
#'
#' @param dir string. Directory location of file you want to trim. If left NULL
#'   uses current working directory.
#' @param file string. Name of file in `dir` or current working directory.
#' @param output string. Name of new file, without filetype extension. If left
#'   NULL called "output" with appropriate filetype extension.
#' @param from string. Time into trim from in hh:mm:ss format.
#' @param to string Time to trim to in hh:mm:ss format.
#'
#' @importFrom glue glue
#' @export
#'
#' @examples
#' # Commented out because we don't want package checks to actually run this
#' #
#' # trim_vid(dir = "path/to/directory",
#' #          file = "input_file.mp4",
#' #          output = "output",
#' #          from = "00:02:45",
#' #          to = "00:09:15")

trim_vid <- function(file = NULL,
                     dir = NULL,
                     output = NULL,
                     from = NULL,
                     to = NULL){


# Input checks ------------------------------------------------------------

    ## check to greater than from?

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


  # Build system command ----------------------------------------------------

  ## build ffmpeg command on OS specific basis
  ## For Mac
  if(os() == "mac"){
    message("Trimming movie...")
    instruction_string <-
      glue('ffmpeg -y -i ', file, ' -c copy -ss ', from, ' -t ', to, " ", output, "_trim", ext)

    ## run the command
    system(instruction_string)

  ## For other OS
  ## No plans to, but might implement Windows/Linux at a future date if someones
  ## asks
  } else if(os() != "mac"){
    stop("This OS not yet supported.")
  }
}