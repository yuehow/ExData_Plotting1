##
##ExData_Plotting1 project
##
## Plot 3 - Plot Energy Sub metering data against Date & Time

## 
## Load data -- Data had been downloaded into the working directory
## 
plot3 <- function() {
## check if the file exist
if (!file.exists("household_power_consumption.txt")) {
	print("Please download the data file into the working directory")
	return
	}
	
## loading data into DB	and
## extract 1/2/2007 and 2/2/2007 data (2007/02/01 - 2007/02/02) to work on
db <- read.table("household_power_consumption.txt", header=TRUE, sep=";", colClasses="character")
db <- subset(db, Date=="1/2/2007" | Date=="2/2/2007")

## History plot to screen#hist(as.numeric(db$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowwatts)")
plot( strptime(paste(db$Date, db$Time), "%d/%m/%Y %H:%M:%S"),as.numeric(db$Sub_metering_1), ylab="Energy sub meterting", xlab="", type="l", )
lines( strptime(paste(db$Date, db$Time), "%d/%m/%Y %H:%M:%S"),as.numeric(db$Sub_metering_2), ylab="Energy sub meterting", xlab="", type="l", col="red")
lines( strptime(paste(db$Date, db$Time), "%d/%m/%Y %H:%M:%S"),as.numeric(db$Sub_metering_3), ylab="Energy sub meterting", xlab="", type="l", col="blue")
## save to png file 
dev.copy(png, "Plot3.png")
dev.off()
}