## Plot2.R

## Reading in the full data set and changing the date format
all_data <- read.csv("household_power_consumption.txt", header=TRUE, sep =";", na.strings="?")
all_data$Date <- as.Date(all_data$Date, format="%d/%m/%Y")

## Creating the subset of data containg the dates 2/1/2007 and 2/2/2007
data <- subset(all_data, (Date == "2007-02-01" | Date == "2007-02-02"))

## Creating a new column for dateTime
data$dateTime <- as.POSIXct(paste(data$Date,data$Time))

## Plot 2
with(data, plot(dateTime, Global_active_power, type="l",
                xlab="", ylab="Global Active Power (kilowatts)"))

## Creating the PNG file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()