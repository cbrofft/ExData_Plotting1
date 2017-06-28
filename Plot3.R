## Plot is created for sub_metering_1 
plot(consumption_final$Converttime, consumption_final$Sub_metering_1, type="l", col="black",xlab="", ylab="Energy sub metering")

## Lines added to the plot for sub_metering_2 with the color red
lines(consumption_final$Converttime, consumption_final$Sub_metering_2, col="red")

## Lines added to the plot for sub_metering_3 with color blue
lines(consumption_final$Converttime, consumption_final$Sub_metering_3, col="blue")

#Legend created specifying the line colors and meanings
legend("topright", legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lty="solid")

## File is saved as Plot3.png
dev.copy(png, "Plot3.png")
dev.off()