pollutantmean <- function(directory = "specdata", pollutant, id = 1:332) {
  directory <- paste0(directory, "/")
  filenames <- paste0(directory, sprintf("%03d", id), ".csv")
  
  ## read in the data file by
  ## file and concatenate the
  ## non-NA ones
  read <- function(filenames) {
    data <- NULL
    for (i in 1:length(filenames)) {
      x <- read.csv(filenames[i])
      data <- c(data, x[!is.na(x[[pollutant]]), pollutant])
    }
    data
  }
  
  data <- read(filenames)
  mean(data)
  
}