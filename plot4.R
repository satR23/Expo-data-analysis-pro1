#Desc :- Exp data analysis project-1 (coursera-Cor4)
#Filename :- plot4.R

###################Read the data
## load the data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# convert the Date class
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Subset data that is between 2007/02/01 and 2007/02/02
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

#Append and convert dates and times
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")


# Plot 4 - line plot with multiple grid
data$datetime <- as.POSIXct(data$datetime)


attach(data)
par(mfrow = c(2,2))
plot(Global_active_power ~ datetime, type = "l", ylab = "Global active power", xlab="")
plot(Voltage ~ datetime, type = "l")
plot(Sub_metering_1 ~ datetime, type = "l", ylab = "Energy sub metering", xlab = "")
lines(Sub_metering_2 ~ datetime, col = "Red")
lines(Sub_metering_3 ~ datetime, col = "Blue")
legend("topright", col = c("Black", "Red", "Blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1), bty="n",cex=.5)
plot(Global_reactive_power ~ datetime, type = "l")

#save file
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()

detach(data)

