## plot4
power_use <- read.csv2("household_power_consumption.txt")
power <- subset(power_use,as.Date(Date,format="%d/%m/%Y")>="2007-02-01" & as.Date(Date,format="%d/%m/%Y")<"2007-02-03")
## ---
power$GAP_kw <- as.numeric(as.character(power$Global_active_power))
power$GRP_kw <- as.numeric(as.character(power$Global_reactive_power))
power$date_time <- strptime(paste(power$Date,power$Time),format="%d/%m/%Y %H:%M:%S")
power$meter_1 <- as.numeric(as.character(power$Sub_metering_1))
power$meter_2 <- as.numeric(as.character(power$Sub_metering_2))
power$meter_3 <- as.numeric(as.character(power$Sub_metering_3))
power$volts <- as.numeric(as.character(power$Voltage))

par(mfrow=c(2,2))
par(mar=c(4,4,1,1))
## ---- Global active power
with(power,plot(date_time,GAP_kw,ylab="Global Active Power",
                cex.axis=0.7,cex.lab=0.7,xlab="",type="n"))
with(power,lines(date_time,GAP_kw,type="l"))
## ---- Voltage
with(power,plot(date_time,volts,ylab="Voltage",xlab="datetime",
                cex.axis=0.7,cex.lab=0.7,type="n"))
with(power,lines(date_time,volts,type="l"))
## ---- Sub metering
with(power,plot(date_time,meter_1,ylab="Energy sub metering",
                cex.axis=0.7,cex.lab=0.7,xlab="",type="n"))
with(power,lines(date_time,meter_1,type="l"))
with(power,lines(date_time,meter_2,type="l",col="red"))
with(power,lines(date_time,meter_3,type="l",col="blue"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=5,bty="n",col=c("black","red","blue"),cex=0.5)
## ---- Global reactive power
with(power,plot(date_time,GRP_kw,ylab="Global_reactive_power",
                cex.axis=0.7,cex.lab=0.7,xlab="datetime",type="n"))
with(power,lines(date_time,GRP_kw,type="l"))
## -----------
