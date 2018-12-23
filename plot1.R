data_full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")
data<-subset(data_full,Date %in% c("1/2/2007","2/2/2007"))
rm(data_full)
png("plot1.png", width=480, height=480)
hist(data$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off()

