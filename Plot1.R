#### Exploratory data analysis Week 1 Assignment script

### Reading in and subsetting the data to 1st and 2nd Feb 2007  
        
        fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        
        # download file if it does not exist
        if (!file.exists("ElectricalUsageData.zip")) {
                download.file(fileUrl, destfile = "ElectricalUsageData.zip", mode = wb)
        }
        # unzip file if not unzipped
        if(!file.exists("EUD")){
                unzip("ElectricalUsageData.zip", exdir = "./EUD")
        }
        
        # read in the file that was unzipped into the EUD directory marking ? as NA
        allElectricData <- read.table("./EUD/household_power_consumption.txt", sep = ";", header = TRUE, colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings = "?")
        
        # load lubridate to set the date as date rather than character
        library(lubridate)
        
        # convert the date to a date format 
        allElectricData$Date <- dmy(allElectricData$Date) # date in yyyy-mm-dd format
        
        # subset the data from the specific date in Feb we need
        febElectricData <- subset(allElectricData, Date == "2007-02-01" | Date == "2007-02-02")
        
        # delete the rest of the data from workspace (taking up nearly 150mb of precious RAM)
        rm(allElectricData)
        
# Draw the first PNG file - a histogram
        
        png("Plot1.png") # set output file
        with(febElectricData, hist(Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))
        dev.off() # turn off output to png
        
        if(file.exists("Plot1.png")) {
                                        cat("File created successfully")
        } else {
                                        warning("File not created. Please try again.")                               
        }

