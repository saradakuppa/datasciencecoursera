pollutantmean <- function(directory, pollutant, id= 1:332){
  
  # 1.List all the files inside the directory
  
  
  specdata_files <- list.files(directory, full.names = T)

  # 2. Initialize a data frame with 0 columns and 0 rows
  specdata_table <- data.frame()
  
  # 3. Loop through the directory list for each file 
    for (i in id) {
      #    - Read each file 
      specdata_file_content <- read.csv(specdata_files[i])
      #    - Bind the contents to of the file to data frame
      specdata_table <- rbind(specdata_table, specdata_file_content)
      
      
    }
  
  
    # 4. Calculate the mean for the pollutant, with mean()
    print(mean(specdata_table[, pollutant], na.rm = T))
  }
