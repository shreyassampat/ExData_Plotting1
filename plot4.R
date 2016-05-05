plot4 <- function() {
    fileName <- "household_power_consumption.txt"
    classes <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
    columnNames <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
    myData <- fread(fileName, sep=";", colClasses = classes, na.strings="?", skip=66637, nrows=2880, col.names = columnNames)
    png(file = "plot4.png")
    myDates <- as.POSIXct(paste(myData$Date, myData$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S")
    
    par(mfrow = c(2,2))
    
    plot(myDates, myData$Global_active_power, type="n", xlab="", ylab="Global Active Power (kilowatts)")
    lines(myDates, myData$Global_active_power, main="")
    
    plot(myDates, myData$Voltage, type="n", xlab="datetime", ylab="Voltage")
    lines(myDates, myData$Voltage, main="")
    
    plot(myDates, myData$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
    lines(myDates, myData$Sub_metering_1)
    lines(myDates, myData$Sub_metering_2, col="red")
    lines(myDates, myData$Sub_metering_3, col="blue")
    legend("topright", lty=1, bty="n", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    plot(myDates, myData$Global_reactive_power, type="n", xlab="datetime", ylab="Global_reactive_power")
    lines(myDates, myData$Global_reactive_power, main="")
    
    dev.off()
}