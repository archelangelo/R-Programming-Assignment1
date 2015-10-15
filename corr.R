corr <- function(directory, threshold = 0) {
  directory <- paste0(directory, "/")
  filenames <- paste0(directory, sprintf("%03d", 1:332), ".csv")
  
  y <- numeric(0)
  for (i in 1:332) {
    x <- read.csv(filenames[i])
    flg <- !is.na(x$sulfate) & !is.na(x$nitrate)
    if (sum(flg) > threshold) {
      y <- c(y, cor(x[flg, c("sulfate", "nitrate")])[["sulfate", "nitrate"]])
    }
  }
  y
}