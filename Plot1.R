## Staging the files and setting the directory.  
##The file will be downloaded from the source and unzipped and saved as household_power_consumption.txt
setwd("~/ExData_Plotting1-master")
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
downloadFile <- "./consumption.zip"
consumptionfile <- "./household_power_consumption.txt"
download.file(fileURL, downloadFile, method = "curl")
unzip(downloadFile, overwrite = T, exdir = "./")

## File is read into R, then the date is modified to have date and time in same field called Convertime
## File is then updated via cbind with date field, lastly the file is subsetted to the specified dates
consumption <-read.table(consumptionfile, header=T, sep=";", na.strings="?")
Converttime <-strptime(paste(consumption$Date, consumption$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
consumption_clean <- cbind(Converttime, consumption)
consumption_final <- consumption_clean[consumption_clean$Date %in% c("1/2/2007","2/2/2007"),]

## Histogram is created showing Global Active Power 
hist(consumption_final$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

## File is saved to Plot1.png
dev.copy(png,"Plot1.png")
dev.off()