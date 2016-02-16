pollutantmean <- function(directory, pollutant, id = 1:332){
        
        
        ## Set WD to directory requested
        setwd(directory)
        
        ## Objects.
        
        i <- 1
        obsv <- 0 #for num observations
        sum <- 0 #for sum of all data
        
        ## Read specdata files and create dataframe.
        my_files <- list.files(directory, full.names=TRUE)[id]
        
        while(i != length(id)+1){
                
                my_read <- read.csv(my_files[i])
                data <- my_read[,pollutant]
                clear_data <- data[!is.na(data)] # Take NAs out
                sum <- sum+sum(clear_data)
                obsv <- obsv+length(clear_data)
                i <- i+1
        }
        my_mean <- sum/obsv
        my_mean
}
