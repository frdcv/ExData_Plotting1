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
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

## 4) Plot as *.PNG
## 4.1) Set the plot
png("plot3.png", width=480, height=480)
## 4.2) Create the plot
plot(datetime, subMetering1, type="l", xlab="", ylab="Energy Submetering")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
## 4.3) Set the legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, lwd=2.5, col=c("black", "red", "blue"))
## 4.4) Close the file.
dev.off()