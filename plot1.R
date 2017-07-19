##
##ExData_Plotting1 project
##
## Plot 1 - history plot of Global Active Power scale to kilowatts

## 
## Load data -- Data had been downloaded into the working directory
## 
plotGAP <- function() {
## check if the file exist
if (!file.exists("household_power_consumption.txt")) {
	print("Please download the data file into the working directory")
	return
	}
	
## loading data into DB	and
## extract 1/2/2007 and 2/2/2007 data (2007/02/01 - 2007/02/02) to work on
db <- read.table("household_power_consumption.txt", header=TRUE, sep=";", colClasses="character")
db <- subset(db, Date=="1/2/2007" | Date=="2/2/2007")

## History plot to screen
hist(as.numeric(db$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowwatts)")

## save to png file 
dev.copy(png, "Plot1.png")
dev.off()
}