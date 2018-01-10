complete <- function(directory, id = 1:332){
  # 1. List all the files in side the directory
  csv_files <- list.files(directory, full.names = T)
  
  # 2. Initialize a data farme with 0 columsn and rows
  compl_data_table <- data.frame()
  
  # 3. Loop through directory to read each file
  
  for (i in id) {
    # Read the files
    compl_read_data <- read.csv(csv_files[i])
    
    #cCount the number of complete cases
    nobs <- sum(complete.cases(compl_read_data))
    
    # Create new data frame to display the observations
    new_table <- data.frame(i, nobs)
    
    # Bind the new data frame to compl_data_table
    compl_data_table <- rbind(compl_data_table, new_table)
    
  }
  
  # Give names to the columns of the compl_data_table
  colnames(compl_data_table) <- c("id", "nobs")
  
  return(compl_data_table)
  
}