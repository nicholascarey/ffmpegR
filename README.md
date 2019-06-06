
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ffmpegR

[![license](https://img.shields.io/badge/license-GPL--3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0.en.html)

These are functions to do common video editing operations in ffmpeg
through R. Created these simply because I find lack of normal text entry
and editing in the terminal frustrating. I’m sure there’s other text
editors that will do this, but sometimes I just want to do them through
R.

Works on macOS only for now. Windows support wouldn’t be difficult to
add, and I’ll consider it if anyone shows some interest.

### Installation

``` r
devtools::install_github("nicholascarey/loomeR")
```

### Functions

Currently there is one function:

#### `trim_vid`

Simply trims a video between two timepoints.

``` r
 trim_vid(dir = "path/to/directory", # location, if not in current working directory
          file = "input_file.mp4", # name of file including extension
          output = "output", # name of output file
          from = "00:02:45", # trim from here...
          to = "00:09:15") # ...to here
```
