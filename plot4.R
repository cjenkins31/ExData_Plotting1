## Plot4.R

## Reading in the full data set and changing the date format
all_data <- read.csv("household_power_consumption.txt", header=TRUE, sep =";", na.strings="?")
all_data$Date <- as.Date(all_data$Date, format="%d/%m/%Y")

## Creating the subset of data containg the dates 2/1/2007 and 2/2/2007
data <- subset(all_data, (Date == "2007-02-01" | Date == "2007-02-02"))

## Creating a new column for dateTime
data$dateTime <- as.POSIXct(paste(data$Date,data$Time))

## Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data, {
            plot(dateTime, Global_active_power, type="l",
                 xlab="", ylab="Global Active Power (kilowatts)")
            plot(dateTime, Voltage, type="l", xlab="datetime")
            plot(dateTime, Sub_metering_1, type="l",
                 xlab="", ylab="Energy sub metering")
            lines(dateTime, Sub_metering_2, col="Red")
            lines(dateTime, Sub_metering_3, col="Blue")
            legend("topright", lty=1, col=c("black","red","blue"), 
                   legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
            plot(dateTime, Global_reactive_power, type="l", xlab="datetime")
})



## Creating the PNG file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()