data_full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")
data<-subset(data_full,Date %in% c("1/2/2007","2/2/2007"))
rm(data_full)
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data<-cbind(data, "DateTime" = as.POSIXct(paste(data$Date, data$Time)))

png("plot2.png", width=480, height=480)
plot(data$Global_active_power~data$DateTime,type="l",ylab="Global Active Power (kilowatts)", xlab="")
dev.off()