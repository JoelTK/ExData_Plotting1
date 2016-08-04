# Set Work Directory
setwd("~/Data Scientist/Course 4 - Exporatory Data Analysis")

# bring in data
hpc <- read.table("Data/household_power_consumption/household_power_consumption.txt", 
                  header = TRUE, sep = ";", na.strings = "?")

hpc1 <- subset(hpc, hpc$Date %in% c("1/2/2007", "2/2/2007"))

#Convert to datetime
dt <- strptime(paste(hpc1$Date, hpc1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Create Line graph for Global Active Power by datetime
png("plot2.png", width=480, height=480)
plot(dt, hpc1$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
