## Files and assignment at https://github.com/rdpeng/ExData_Plotting1
## WEEK 1 ASSIGNMENT - Exploratory Data Analysis

## 1) Create data frame from the *.txt file in the *.zip file.
power_cons <- read.delim("household_power_consumption.txt", 
                         header = TRUE, sep = ";", dec = ".")

## 2) Subset just for the days indicated in the assigment: 2007-02-01 and 2007-02-02
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## 3) Create variable to plot
globalActivePower <- as.numeric(subSetData$Global_active_power)

## 4) Plot as *.PNG
## 4.1) Set the plot
png("plot1.png", width=480, height=480)
## 4.2) Create the histogram
hist(globalActivePower, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
## 4.3) Close the file, and return the Active Device to the window in R.
dev.off()