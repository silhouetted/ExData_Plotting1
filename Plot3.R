
## Drawing plot 3 - assumes that data has been read in as in Plot1.R and formatted
# as in Plot2.R. If not please run both scripts first by unhashing following
# two lines before running this script.

# source('~/data/Exploratory Data Analysis/Plot1.R')
# source('~/data/Exploratory Data Analysis/Plot2.R')

# open connetion to graphical device
png("Plot3.png")

## draw plot

plot(febElectricData$DateTime ,febElectricData$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(febElectricData$DateTime,febElectricData$Sub_metering_2,col="red")
lines(febElectricData$DateTime,febElectricData$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))

#close connection to graphical device
dev.off()

# check it worked                
if(file.exists("Plot2.png")) {
        cat("File created successfully")
} else {
        warning("File not created. Please try again.")                               
        }
