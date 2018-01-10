corr <- function(directory, threshold = 0) {
  # 1. List all the files inside the directory
  csv_files <- list.files(directory, full.names = TRUE)
  
  # 2. Initialize a numberic vector with length 0
  
  corr_v <- vector(mode = "numeric", length = 0)
  
  # 3. Loop through the direct for contents of each file
  
  for (i in 1: length(csv_files)) {
    # Read the contents of each file
    corr_read_files <- read.csv(csv_files[i])
    
    # count the number of complete cases
    csum <- sum(complete.cases(corr_read_files))
    
    # Check if the sum of complete cases is greater then threahold
    if(csum > threshold) {
      # Select from corr_read_files the sulfate data, without the NA values
      
      sulfate_data <- corr_read_files[which(!is.na(corr_read_files$sulfate)), ]
      
      # select from sulfate_data, which also has nitrate data and display it as sulfate_pollutant
      
      sulfate_pollutant <- sulfate_data[which(!is.na(sulfate_data$nitrate)), ]
      
      # update the vector corr_v,  where corr function is used to compute the correlation between sulfate and nitrate
      
      corr_v <- c(corr_v, cor(sulfate_pollutant$sulfate, sulfate_pollutant$nitrate))
    }
  }
  
  return(corr_v)
  
}