## Files and assignment at https://github.com/rdpeng/ExData_Plotting1
## WEEK 1 ASSIGNMENT - Exploratory Data Analysis

## 1) Create data frame from the *.txt file in the *.zip file.
power_cons <- read.delim("household_power_consumption.txt", 
                         header = TRUE, sep = ";", dec = ".")

## 2) Subset just for the days indicated in the assigment: 2007-02-01 and 2007-02-02
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

## 3) Create variable to plot
globalActivePower <- as.numeric(subSetData$Global_active_power)
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)
voltage <- as.numeric(subSetData$Voltage)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

## 4) Plot as *.PNG
## 4.1) Set the plot
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) # creating panels
## 4.2) Create the plot
## 4.2.1) Panel #1
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", 
     cex=0.2)
## 4.2.2) Panel #2
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
## 4.2.3) Panel #3, Including legend
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
## 4.2.4) Panel #4
plot(datetime, globalReactivePower, type="l", 
     xlab="datetime", ylab="Global_reactive_power")
## 4.3) Close the file.
dev.off()