## ---- plot3
power_use <- read.csv2("household_power_consumption.txt")
power <- subset(power_use,as.Date(Date,format="%d/%m/%Y")>="2007-02-01" & as.Date(Date,format="%d/%m/%Y")<"2007-02-03")
## power_sub$GAP_kw <- as.numeric(as.character(power_sub$Global_active_power))
power$date_time <- strptime(paste(power$Date,power$Time),format="%d/%m/%Y %H:%M:%S")
power$meter_1 <- as.numeric(as.character(power$Sub_metering_1))
power$meter_2 <- as.numeric(as.character(power$Sub_metering_2))
power$meter_3 <- as.numeric(as.character(power$Sub_metering_3))

with(power,plot(date_time,meter_1,ylab="Energy sub metering",
                cex.axis=0.6,cex.lab=0.6,xlab="",type="n"))
with(power,lines(date_time,meter_1,type="l"))
with(power,lines(date_time,meter_2,type="l",col="red"))
with(power,lines(date_time,meter_3,type="l",col="blue"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=5,col=c("black","red","blue"),cex=0.7)


                                      