plot2 <- function() {
    fileName <- "household_power_consumption.txt"
    classes <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
    columnNames <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
    myData <- fread(fileName, sep=";", colClasses = classes, na.strings="?", skip=66637, nrows=2880, col.names = columnNames)
    png(file = "plot2.png")
    myDates <- as.POSIXct(paste(myData$Date, myData$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S")
    plot(myDates, myData$Global_active_power, type="n", xlab="", ylab="Global Active Power (kilowatts)")
    lines(myDates, myData$Global_active_power, main="")
    dev.off()
}