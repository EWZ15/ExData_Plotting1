#Read in dataset
DataFile <- "D:/R/ExData_Plotting1/household_power_consumption.txt"
HouseholdPower <- read.table(DataFile, header=TRUE, sep=";", stringsAsFactors=FALSE)

#subset dates of interest
data <- HouseholdPower[HouseholdPower$Date %in% c("1/2/2007","2/2/2007"),]

#Plot data
global_active_power <- as.numeric(data$Global_active_power)
hist(global_active_power, col="red", xlab="Global Active Power (kilowatts)", 
     main="Global Active Power")

#save to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
