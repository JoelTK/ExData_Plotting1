# Set Work Directory
setwd("~/Data Scientist/Course 4 - Exporatory Data Analysis")

# bring in data
hpc <- read.table("Data/household_power_consumption/household_power_consumption.txt", 
                  header = TRUE, sep = ";", na.strings = "?")

hpc1 <- subset(hpc, hpc$Date %in% c("1/2/2007", "2/2/2007"))

#Convert to datetime
dt <- strptime(paste(hpc1$Date, hpc1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Set up fpr 4 charts
png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))

#chart1
plot(dt, hpc1$Global_active_power, type="l", xlab="", ylab="Global Active Power")

#chart2
plot(dt, hpc1$Voltage, type="l", xlab="datetime", ylab="Voltage")

#chart3
plot(dt, hpc1$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(dt, hpc1$Sub_metering_2, col = "red")
lines(dt, hpc1$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, lwd=2, col=c("black", "red", "blue"))

#chart4
plot(dt, hpc1$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
