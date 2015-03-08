rm(list = ls())
##read the data and change the Date to Date type
origindata <- read.csv("/Users/conghuanxu/DataScience/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                       check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
origindata$Date <- as.Date(origindata$Date, format = "%d/%m/%Y")
##select the data of two given days.
mydata <- subset(origindata, origindata$Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
##delete origindata
rm(origindata)
par(pty = "s")
##plot first figure
hist(mydata$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
##saving
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
