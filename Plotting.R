setwd("~/ExData_Plotting1-master")
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
downloadFile <- "./consumption.zip"
consumptionfile <- "./household_power_consumption.txt"
##
download.file(fileURL, downloadFile, method = "curl")
unzip(downloadFile, overwrite = T, exdir = "./")

##
 consumption <-read.table(consumptionfile, header=T, sep=";", na.strings="?")
 Converttime <-strptime(paste(consumption$Date, consumption$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
 consumption_clean <- cbind(Converttime, consumption)
 consumption_final <- consumption_clean[consumption_clean$Date %in% c("1/2/2007","2/2/2007"),]
 
 hist(consumption_final$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
 
 plot(consumption_final$Converttime, consumption_final$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts)")
 
 plot(consumption_final$Converttime, consumption_final$Sub_metering_1, type="l", col="black",xlab="", ylab="Energy sub metering")
 lines(consumption_final$Converttime, consumption_final$Sub_metering_2, col="red")
 lines(consumption_final$Converttime, consumption_final$Sub_metering_3, col="blue")
 legend("topright", legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lty="solid")
 
 par(mfrow=c(2,2),mar= c(4,4,4,4))
 plot(consumption_final$Converttime, consumption_final$Global_active_power, type="l", xlab="", ylab="Global Active Power")
 plot(consumption_final$Converttime, consumption_final$Voltage, type="l", xlab="datetime", ylab="Voltage")
 plot(consumption_final$Converttime, consumption_final$Sub_metering_1,type="l", col="black",xlab="", ylab="Energy sub metering")
 lines(consumption_final$Converttime, consumption_final$Sub_metering_2, col="red")
 lines(consumption_final$Converttime, consumption_final$Sub_metering_3, col="blue")
 legend("topleft", bty="n",legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lty="solid")
 plot(consumption_final$Converttime, consumption_final$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
 