##Please make sure the file "household_power_consumption.txt" is in your working
##directory
dataset<-read.table("household_power_consumption.txt",sep = ";",stringsAsFactors = FALSE,
		    skip = 66637,nrows = 2880)
names(dataset)<-strsplit("Date;Time;Global_active_power;Global_reactive_power;Voltage;Global_intensity;Sub_metering_1;Sub_metering_2;Sub_metering_3","\\;")[[1]]

date <- strptime(paste(dataset$Date, dataset$Time), "%d/%m/%Y %H:%M:%S")

globalActivePower<-dataset$Global_active_power

globalReactivePower<-dataset$Global_reactive_power

voltage<-dataset$Voltage

subMetering1<-dataset$Sub_metering_1

subMetering2<-dataset$Sub_metering_2

subMetering3<-dataset$Sub_metering_3

png("plot4.png",width = 480,height = 480)

par(mfrow=c(2,2))

plot(date,globalActivePower,type = "l",xlab = "",ylab = "Global Active Power")

plot(date,voltage,type = "l",xlab = "datetime",ylab = "Voltage")

plot(date,subMetering1,type = "l",xlab = "",ylab = "Energy Submetering")

lines(date,subMetering2,col="red")

lines(date,subMetering3,col="blue")

legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=1,col=c("black", "red", "blue"))

plot(date,globalReactivePower,type = "l",xlab = "datetime",ylab = "Global_reactive_power")

dev.off()