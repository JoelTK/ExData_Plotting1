# Set Work Directory
setwd("~/Data Scientist/Course 4 - Exporatory Data Analysis")

# bring in data
hpc <- read.table("Data/household_power_consumption/household_power_consumption.txt", 
                    header = TRUE, sep = ";", na.strings = "?")
hpc1 <- subset(hpc, hpc$Date %in% c("1/2/2007", "2/2/2007"))

# Create Global Active Power histogram
png(file="plot1.png",width=480,height=480)
hist(hpc1$Global_active_power, main = "Global Active Power", col = "red", 
     xlab = "Global Active Power (kilowatts)")
dev.off()

