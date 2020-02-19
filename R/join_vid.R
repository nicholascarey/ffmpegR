#' join_vid
#'
#' Joins two movie files together.
#'
#' Either have both in the current working directory, or specify the location
#' with `dir`, in which case the working directory is unchanged.
#'
#' Can rename the output file using `output`, otherwise it will be named the
#' same as the FIRST file appended with `_join`. It will overwrite any previous
#' joined file with the same name.
#'
#' Both files must be same format, and have same metadata (e.g. resolution,
#' frame rate etc.). If they don't it will probably fail.
#'
#' No format conversion or rencoding is done. New file is same format as old.
#'
#' @param dir string. Directory location of file you want to trim. If left NULL
#'   uses current working directory.
#' @param file1 string. Name of first file in `dir` or current working directory.
#' @param file2 string. Name of second file in `dir` or current working directory.
#' @param output string. Name of new file, without filetype extension. If left
#'   NULL named same as the FIRST file, appended with `_join`
#'
#' @importFrom glue glue
#'
#' @export
#'
#' @examples
#' # Commented out because we don't want package checks to actually run this
#' #
#' # trim_vid(dir = "path/to/directory",
#' #          file1 = "input_file_1.mp4",
#' #          file2 = "input_file_2.mp4",
#' #          output = "output")

join_vid <- function(dir = NULL,
                     file1 = NULL,
                     file2 = NULL,
                     output = NULL){

  system("ffmpeg -y -safe 0 -f concat -i file1 file2 -c copy Vid.S3.mp4")

}