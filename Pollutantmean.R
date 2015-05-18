pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  ## NOTE: Do not round the result!

minid <- id[1] 
##print(minid)
for(i in id) { 
  idstring <- as.character(i)
  ##print(idstring)
  ##print(nchar(idstring))
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
   datasetold <- dataset
 } 
 else { ## next files
   dataset <- read.csv(paste(directory, "/", id, ".csv",sep=","),header=TRUE)
   dataset <- rbind(datasetold, dataset)
   datasetold <- dataset
 }
 ##rbind(dataset, datasetold)
   ##print(head(dataset))
 ##print(summary(dataset))
 ##print(mean(dataset$sulfate, na.rm=TRUE));
  ##dataset
}
if ( pollutant == "sulfate" ){ 
  print(mean(dataset$sulfate, na.rm=TRUE));
} 
else if ( pollutant == "nitrate" ){ 
  print(mean(dataset$nitrate, na.rm=TRUE));
}
}