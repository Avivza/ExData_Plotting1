#reading data
Sys.setlocale("LC_TIME", "English")
data<-read.csv("household_power_consumption.txt",sep=";",na.strings="?")
datom<-subset(data,data$Date=="1/2/2007"|data$Date=="2/2/2007")
datom$Time<-strptime(paste(datom$Date,datom$Time),format='%d/%m/%Y %H:%M:%S')
par(mfrow=c(2,2))

#plot1
plot(datom$Time,datom$Global_active_power,type="l",xlab="",ylab="Global Active Power ")

#plot2
plot(datom$Time,datom$Voltage,type="l",xlab="datetime",ylab="Voltage")

#plot3
plot(datom$Time,datom$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(datom$Time,datom$Sub_metering_2,col="red")
lines(datom$Time,datom$Sub_metering_3,col="blue")
legend("topright",lty="solid",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#plot4
plot(datom$Time,datom$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")

#copy file
dev.copy(png,"plot4.png")
dev.off()
