
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ffmpegR

[![license](https://img.shields.io/badge/license-GPL--3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0.en.html)

These are functions to do common video editing operations in
[ffmpeg](ffmpeg.org) through R.

Works on macOS only for now. Windows support wouldn’t be difficult to
add, and I’ll consider it if anyone shows some interest.

### Installation

``` r
devtools::install_github("nicholascarey/ffmpegR")
```

### Functions

Currently there are three functions:

#### `trim_vid`

Simply trims a video between two timepoints.

``` r
 trim_vid(dir = "path/to/directory", # location, if not in current working directory
          file = "input_file.mp4", # name of file including extension
          output = "output", # name of output file
          from = "00:02:45", # trim from here...
          to = "00:09:15") # ...to here
```

#### `join_vid`

Joins two videos together into one file.

``` r
join_vid(dir = "path/to/directory", # working directory
         file1 = "input_file_1.mp4", # file 1
         file2 = "input_file_2.mp4", # file 2 
         output = "output") # name of output file
```

#### `remove_fisheye`

Removes the ‘fisheye’ effect from GoPro Hero 5 Black videos (other
models to follow….)

``` r
 remove_fisheye(file = "path/to/file", # input
                dir = "path/to/dir", # directory
                output = "output", # output
                remove_audio = FALSE) # remove the audio?
```
