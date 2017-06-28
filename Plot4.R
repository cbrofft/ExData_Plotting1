## 2x2 par created with margins of 4 to allow data to be easily read
par(mfrow=c(2,2),mar= c(4,4,4,4))

## Global active power over time plot added to par
plot(consumption_final$Converttime, consumption_final$Global_active_power, type="l", xlab="", ylab="Global Active Power")

## voltage overtime plot added to par
plot(consumption_final$Converttime, consumption_final$Voltage, type="l", xlab="datetime", ylab="Voltage")

## Sub metering 1,2,3 plot added to par with associated legend
plot(consumption_final$Converttime, consumption_final$Sub_metering_1,type="l", col="black",xlab="", ylab="Energy sub metering")
lines(consumption_final$Converttime, consumption_final$Sub_metering_2, col="red")
lines(consumption_final$Converttime, consumption_final$Sub_metering_3, col="blue")
legend("topleft", bty="n",legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lty="solid")

## Global reactive power overtime plot added to par
plot(consumption_final$Converttime, consumption_final$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

#Par is saved to Plot.png
dev.copy(png,"Plot4.png")
dev.off()
