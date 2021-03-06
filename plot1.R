library(dplyr)

data <- read.table("household_power_consumption.txt", header=T, sep=';', na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
data$Date <- as.Date(data$Date, format="%d/%m/%Y");
data$weekday <- weekdays(data$Date)
newdata <- filter(data,Date=='2007-02-01' | Date=='2007-02-02')
newdata$DateTime <- strptime(paste(newdata$Date, newdata$Time), "%Y-%m-%d %H:%M:%S")
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(newdata$Global_active_power,col='red',main='Global Active Power',xlab='Global Active Power (kilowatts)')
dev.off()