#Desc :- Exp data analysis project-1 (coursera-Cor4)
#Filename :- plot1.R

#################################################
#Read data
data<-read.table("./household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")

#change the class
data$Date <- as.Date(data$Date, format= "%d/%m/%Y" )

# Subset data that is between 2007/02/01 and 2007/02/02
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

#Append and convert data and time format
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

#plot1-histogram
attach(data)
hist(Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "Red")
# Save file
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
detach(data)
