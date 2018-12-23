data_full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")
data<-subset(data_full,Date %in% c("1/2/2007","2/2/2007"))
rm(data_full)
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data<-cbind(data, "DateTime" = as.POSIXct(paste(data$Date, data$Time)))
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

with(data, {
  plot(Global_active_power~DateTime, type="l",ylab="Global Active Power (kilowatts)", xlab="")
  
  plot(Voltage~DateTime, type="l", ylab="Voltage (volt)", xlab="")
  
  plot(Sub_metering_1~DateTime, type="l",ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~DateTime,col='Red')
  lines(Sub_metering_3~DateTime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  plot(Global_reactive_power~DateTime, type="l",ylab="Global Rective Power (kilowatts)",xlab="")
})

dev.off()