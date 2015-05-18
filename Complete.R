complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  minid <- id[1] 
  ##print(minid)
  for(i in id) { 
    idstring <- as.character(i)
  ##  print(idstring)
  ##  print(nchar(idstring))
    if ( nchar(i) == 1  ){ ## i < 10
      id <- paste("00", i, sep=",") 
    } 
    else if ( nchar(i) == 2  ){ ## i<100
      id <- paste("0", i, sep=",") 
    } 
    else { # >100
      id <- i;
    }  
    if ( i == minid){  ## first file
      dataset <- read.csv(paste(directory, "/", id, ".csv",sep=","),header=TRUE)
   #   datasetold <- dataset
    } 
    else { ## next files
      dataset <- read.csv(paste(directory, "/", id, ".csv",sep=","),header=TRUE)
  #    dataset <- rbind(datasetold, dataset)
  #    datasetold <- dataset
    }
  #  rbind(dataset, datasetold)
    ##colnames(dataset)[1] <- "nobs"
    ##head(dataset)
   ##print (head(dataset))
   output <-  cbind(i, nrow(dataset))
   colnames(output) <- c("id", "nobs")
   print(output);
  }
}