## ---- plot2
power_use <- read.csv2("household_power_consumption.txt")
power <- subset(power_use,as.Date(Date,format="%d/%m/%Y")>="2007-02-01" & as.Date(Date,format="%d/%m/%Y")<"2007-02-03")
power$GAP_kw <- as.numeric(as.character(power$Global_active_power))
power$date_time <- strptime(paste(power$Date,power$Time),format="%d/%m/%Y %H:%M:%S")
## ----
with(power,plot(date_time,GAP_kw,ylab="Global Active Power (kilowatts)",
                cex.axis=0.6,cex.lab=0.6,xlab="",type="n"))
with(power,lines(date_time,GAP_kw,type="l"))
## ---