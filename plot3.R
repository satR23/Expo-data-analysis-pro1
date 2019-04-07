#Desc :- Exp data analysis project-1 (coursera-Cor4)
#Filename :- plot3.R

###################Read the data
## load the data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# convert the Date class
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Subset data that is between 2007/02/01 and 2007/02/02
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

#Append and convert dates and times
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")


# Plot 3 - line plot with legend
data$datetime <- as.POSIXct(data$datetime)


attach(data)
plot(Sub_metering_1 ~ datetime, type = "l", ylab = "Energy sub metering", xlab = "")
lines(Sub_metering_2 ~ datetime, col = "Red")
lines(Sub_metering_3 ~ datetime, col = "Blue")
legend("topright", lty = 1, col = c("Black", "Red", "Blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#save file
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()

detach(data)