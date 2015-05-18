corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
  
  setwd(directory)
  
  
  file_list <- list.files()
  
  for (file in file_list){
  ##print((file))  
    # if the merged dataset doesn't exist, create it
    if (exists("dataset")){
      temp_dataset <-na.omit(read.table(file, header=TRUE, sep=",",na.strings=c(NA,"NA"," NA")))
      ##temp_dataset <- na.omit(temp_dataset)
      ## print(temp_dataset)
      dataset<-rbind(dataset, na.omit(temp_dataset))
      
      ##print(1)
    }
    if (!exists("dataset")){
      dataset <- read.table(file, header=TRUE, sep=",",na.strings=c(NA,"NA"," NA"))
      dataset <- na.omit(dataset)  
      ##dataset <- ##dataset[complete.cases(dataset),]
      ##print(dataset)
      ##print(2)
    }
    
    # if the merged dataset does exist, append to it

   ##print(sum(complete.cases(dataset)))
   ##print(dataset)
  if(sum(complete.cases(dataset))>=threshold){
    break
  }
  }
   

    ##print(head(dataset,threshold))
    ##print(summary((dataset)[1:is.numeric(threshold)]))
 ##print(summary(head(dataset, threshold)))
 ##print(mean(dataset$sulfate, na.rm=TRUE));

 

##print(cor(dataset$sulfate, dataset$nitrate, use="complete.obs"))
##cor(dataset$sulfate, dataset$nitrate, use="complete.obs")
cor(dataset, use="complete.obs")
}