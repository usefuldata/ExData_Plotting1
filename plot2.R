## 'Assumed that the file is downloaded.
t <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",stringsAsFactors=F)
t <- t[which(t$Date == '1/2/2007' | t$Date == '2/2/2007'),] 
t$dT <- strptime(paste(t$Date, t$Time, sep = " : "), format = "%e/%m/%Y : %H:%M:%S") 
t$Global_active_power <- as.numeric(t$Global_active_power) 
t$Global_reactive_power <- as.numeric(t$Global_reactive_power) 
t$Global_intensity <- as.numeric(t$Global_intensity) 
t$Sub_metering_1 <- as.numeric(t$Sub_metering_1)
t$Sub_metering_2 <- as.numeric(t$Sub_metering_2) 
t$Sub_metering_3 <- as.numeric(t$Sub_metering_3) 

png("plot2.png")
plot(t$dT,t$Global_active_power,type='n',main = "", 
     xlab="", ylab="Global Active Power (kilowatts)") 
lines(t$dT,t$Global_active_power, type='l') 
dev.off()
