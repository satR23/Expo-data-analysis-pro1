#Desc :- Exp data analysis project-1 (coursera-Cor4)
#Filename :- plot2.R

###################Read the data
## load the data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# convert the Date class
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Subset data that is between 2007/02/01 and 2007/02/02
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

#Append and convert dates and times
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")


# Plot 2
data$datetime <- as.POSIXct(data$datetime)


attach(data)
plot(Global_active_power ~ datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
#save file
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()

detach(data)