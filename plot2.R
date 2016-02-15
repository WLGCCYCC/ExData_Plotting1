##Please make sure the file "household_power_consumption.txt" is in your working
##directory
dataset<-read.table("household_power_consumption.txt",sep = ";",stringsAsFactors = FALSE,
		    skip = 66637,nrows = 2880)
names(dataset)<-strsplit("Date;Time;Global_active_power;Global_reactive_power;Voltage;Global_intensity;Sub_metering_1;Sub_metering_2;Sub_metering_3","\\;")[[1]]

date <- strptime(paste(dataset$Date, dataset$Time), "%d/%m/%Y %H:%M:%S")

globalActivePower<-dataset$Global_active_power

png("plot2.png",height = 480,width = 480)

plot(date,globalActivePower,type = "l",xlab = "",ylab = "Global Active Power (kilowatts)")

dev.off()
