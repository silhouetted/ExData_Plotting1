

## Image 2 - assumes data has been read in already as set out in Plot1.R
# If not please run Plot1.R first. You can do this by removing the hash 
# from the following line and then running this script

# source('~/data/Exploratory Data Analysis/Plot1.R')

# Draw the second PNG file - a scatter plot with a line

# make sure that the time is set as a Time
library(lubridate)

# Convert Time column to a time
febElectricData$Time <- hms(febElectricData$Time)

# Create a new column called DateTime which combines both date and time
febElectricData$DateTime <- paste(febElectricData$Date, febElectricData$Time, sep = " ")

# Convert DateTime to a DateTime format
febElectricData$DateTime <- ymd_hms(febElectricData$DateTime)

# set graphical output file
png("Plot2.png") 

# draw plot
with(febElectricData, plot(DateTime, Global_active_power, type="l", xlab=" ", ylab="Global Active Power (kilowatts)"))

#close connection to graphical device
dev.off()

# check it worked                
if(file.exists("Plot2.png")) {
        cat("File created successfully")
} else {
        warning("File not created. Please try again.")                               
}
