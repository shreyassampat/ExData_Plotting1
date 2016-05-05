plot1 <- function() {
    fileName <- "household_power_consumption.txt"
    classes <- c("Date", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
    columnNames <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
    myData <- fread(fileName, sep=";", colClasses = classes, na.strings="?", skip=66637, nrows=2880, col.names = columnNames)
    png(file = "plot1.png")
    hist(myData$Global_active_power, col="red", main="Global Active Power", xlab = "Global Active Power (kilowatts)")
    dev.off()
    }