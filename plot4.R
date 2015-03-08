##read the data and change the Date to Date type
origindata <- read.csv("/Users/conghuanxu/DataScience/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                       check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
origindata$Date <- as.Date(origindata$Date, format = "%d/%m/%Y")
##select the data of two given days.
mydata <- subset(origindata, origindata$Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
##delete origindata
rm(origindata)


##create time variable of dates and time
datatime <- paste(mydata$Date, mydata$Time)
datatime <- as.POSIXct(datatime)

##plot 4th figure
## Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(mydata, {
        plot(Global_active_power ~ datatime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
        plot(Voltage~datatime, type="l", ylab="Voltage (volt)")
        plot(Sub_metering_1 ~ datatime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2 ~ datatime,col='Red')
        lines(Sub_metering_3 ~ datatime,col='Blue')
        legend("topright",col=c("black", "red", "blue"),y.intersp = .6, x.intersp = .5, cex = 0.7,  bty="n",   
               lty=1, lwd=1,legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Global_reactive_power ~ datatime, type="l", ylab="Global Rective Power (kilowatts)",xlab="datatime")
})

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()