##
##ExData_Plotting1 project
##
## Plot 2 - plot of Global Active Power against Date &T ime

## 
## Load data -- Data had been downloaded into the working directory
## 
plot2 <- function() {
## check if the file exist
if (!file.exists("household_power_consumption.txt")) {
	print("Please download the data file into the working directory")
	return
	}
	
## loading data into DB	and
## extract 1/2/2007 and 2/2/2007 data (2007/02/01 - 2007/02/02) to work on
db <- read.table("household_power_consumption.txt", header=TRUE, sep=";", colClasses="character")
db <- subset(db, Date=="1/2/2007" | Date=="2/2/2007")

##plot to screen
plot( strptime(paste(db$Date, db$Time), "%d/%m/%Y %H:%M:%S"),as.numeric(db$Global_active_power), 
	 ylab="Global Active Power (kilowwatts)", xlab="", type="l")

## save to png file 
dev.copy(png, "Plot2.png")
dev.off()
}