## ---- plot1
power_use <- read.csv2("household_power_consumption.txt")
power <- subset(power_use,as.Date(Date,format="%d/%m/%Y")>="2007-02-01" & as.Date(Date,format="%d/%m/%Y")<"2007-02-03")
power$GAP_kw <- as.numeric(as.character(power$Global_active_power))
hist(power$GAP_kw,col="red",main="Global Active Power", 
     xlab="Global Active Power (kilowatts)",cex.axis=0.6,cex.lab=0.6)

## ---
