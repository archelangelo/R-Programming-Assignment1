complete <- function(directory = "specdata", id = 1:332) {
  directory <- paste0(directory, "/")
  filenames <- paste0(directory, sprintf("%03d", id), ".csv")
  
  nobs <- integer(length(id))
  for (i in 1:length(id)) {
    x <- read.csv(filenames[i])
    nobs[i] <- sum(!is.na(x$sulfate) & !is.na(x$nitrate))
  }
  data.frame(id, nobs)
}