#Read in dataset
DataFile <- "D:/R/ExData_Plotting1/household_power_consumption.txt"
HouseholdPower <- read.table(DataFile, header=TRUE, sep=";", stringsAsFactors=FALSE)

#subset dates of interest
data <- HouseholdPower[HouseholdPower$Date %in% c("1/2/2007","2/2/2007"),]

#convert dates and time
library(lubridate)
data$Date <- dmy(data$Date)
datetime <- paste(data$Date, data$Time)
data$DateTime <- as.POSIXct(datetime)

#convert data from character to numeric
global_active_power <- as.numeric(data$Global_active_power)
Sub_metering_1 <-as.numeric(data$Sub_metering_1)
Sub_metering_2 <-as.numeric(data$Sub_metering_2)
Sub_metering_3 <-as.numeric(data$Sub_metering_3) #technically, it's already numeric
global_reactive_power <- as.numeric(data$Global_reactive_power)
voltage <- as.numeric(data$Voltage)

#prep plot area for size and layout
png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))

#plot 1
plot(data$DateTime, global_active_power, type="l", xlab="", ylab="Global Active Power")

#plot 2
plot(data$DateTime, voltage, type="l", xlab="datetime", ylab="Voltage")

#plot 3
plot(data$DateTime, Sub_metering_1, type="l", xlab="", ylab="Energy Submetering")
lines(data$DateTime, Sub_metering_2, type="l", col="red")
lines(data$DateTime, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1), lwd=c(2.5), col=c("black", "red", "blue"))

#plot 4
plot(data$DateTime, global_reactive_power, type="l", xlab="datetime", 
     ylab="Global_reactive_power")

dev.off()

