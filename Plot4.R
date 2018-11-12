
## Drawing plot 4 - assumes that data has been read in as in Plot1.R and formatted
# as in Plot2.R. If not please run both scripts first by unhashing following
# two lines before running this script.

# source('~/data/Exploratory Data Analysis/Plot1.R')
# source('~/data/Exploratory Data Analysis/Plot2.R')
# source('~/data/Exploratory Data Analysis/Plot3.R')

# open connection to graphical device
        png("Plot4.png")

# draw plot

        # set matrix size
        par(mfrow=c(2,2))
        
        # draw plot 1
        with(febElectricData, plot(DateTime, Global_active_power, type="l", xlab=" ", ylab="Global Active Power (kilowatts)"))
        
        # draw plot 2
        with(febElectricData, plot(DateTime, Voltage, type="l", xlab=" ", ylab="Voltage"))
        
        # draw plot 3
        plot(febElectricData$DateTime ,febElectricData$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
        lines(febElectricData$DateTime,febElectricData$Sub_metering_2,col="red")
        lines(febElectricData$DateTime,febElectricData$Sub_metering_3,col="blue")
        legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))
        
        # draw plot 4
        with(febElectricData, plot(DateTime, Global_reactive_power, type="l", xlab=" ", ylab="Global Active Power (kilowatts)"))
        
                
        #close connection to graphical device
        dev.off()
        
        # check it worked                
        if(file.exists("Plot4.png")) {
                cat("File created successfully")
        } else {
                warning("File not created. Please try again.")                               
        }
        