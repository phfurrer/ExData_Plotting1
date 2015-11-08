# Import and prepare data
if(!file.exists("exdata-data-household_power_consumption.zip")) {
  temp <- tempfile()
  download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
  file <- unzip(temp)
  unlink(temp)
}
data_all <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", nrows=2075259, quote='\"')
data_sub <- data_all[data_all$Date %in% c("1/2/2007","2/2/2007"),]
globalActivePower <- as.numeric(data_sub$Global_active_power)

#Make the plot
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
