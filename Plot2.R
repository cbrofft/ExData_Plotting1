##Create plot showing Global active power over time
plot(consumption_final$Converttime, consumption_final$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts)")

#File is saved as Plot2.png
dev.copy(png,"Plot2.png")
dev.off()