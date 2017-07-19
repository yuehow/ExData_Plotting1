##
##ExData_Plotting1 project
##
## Plot 4 - 4 plots in a diagram

## 
## Load data -- Data had been downloaded into the working directory
## 
plot4 <- function() {
## check if the file exist
if (!file.exists("household_power_consumption.txt")) {
	print("Please download the data file into the working directory")
	return
	}
	
## loading data into DB	and
## extract 1/2/2007 and 2/2/2007 data (2007/02/01 - 2007/02/02) to work on
db <- read.table("household_power_consumption.txt", header=TRUE, sep=";", colClasses="character")
db <- subset(db, Date=="1/2/2007" | Date=="2/2/2007")

## partition the screen into 4 part 
## 
par(mfrow=c(2,2), mar=c(4,4,2,1))

## History plot to screen
## First plot
plot( strptime(paste(db$Date, db$Time), "%d/%m/%Y %H:%M:%S"),as.numeric(db$Global_active_power), 
	 ylab="Global Active Power (kilowwatts)", xlab="", type="l")

## Second Plot
plot( strptime(paste(db$Date, db$Time), "%d/%m/%Y %H:%M:%S"),as.numeric(db$Voltage), 
	 ylab="Voltage", xlab="datetime", type="l")
	 
## Third plot
plot( strptime(paste(db$Date, db$Time), "%d/%m/%Y %H:%M:%S"),as.numeric(db$Sub_metering_1), ylab="Energy sub meterting", xlab="", type="l", )
lines( strptime(paste(db$Date, db$Time), "%d/%m/%Y %H:%M:%S"),as.numeric(db$Sub_metering_2), ylab="Energy sub meterting", xlab="", type="l", col="red")
lines( strptime(paste(db$Date, db$Time), "%d/%m/%Y %H:%M:%S"),as.numeric(db$Sub_metering_3), ylab="Energy sub meterting", xlab="", type="l", col="blue")

## Forth Plot
plot( strptime(paste(db$Date, db$Time), "%d/%m/%Y %H:%M:%S"),as.numeric(db$Global_reactive_power), 
	 ylab="Global reactive power", xlab="datetime", type="l")


## save to png file 
dev.copy(png, "Plot4.png")
dev.off()
}