# library(testthat)

## correctly restores working directory

curr_dir <- getwd()

trim_vid(dir = "~/Dropbox/Work Vids/Sticklebacks vids/2018-04-13 Tank 1",
         file = "IMG_3001.m4v",
         output = NULL,
         from = "00:00:03",
         to = "00:00:07")

expect_equal(curr_dir, getwd())


curr_dir <- getwd()

trim_vid(dir = NULL,
     file = "IMG_3001.m4v",
     output = NULL,
     from = "00:00:03",
     to = "00:00:07")

expect_equal(curr_dir, getwd())
