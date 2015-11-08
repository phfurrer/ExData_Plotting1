# Import and prepare data
if(!file.exists("exdata-data-household_power_consumption.zip")) {
  temp <- tempfile()
  download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
  file <- unzip(temp)
  unlink(temp)
}
data_all <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", nrows=2075259, quote='\"')
data_sub <- data_all[data_all$Date %in% c("1/2/2007","2/2/2007"),]
datetime <- strptime(paste(data_sub$Date, data_sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(data_sub$Global_active_power)

subMetering1 <- as.numeric(data_sub$Sub_metering_1)
subMetering2 <- as.numeric(data_sub$Sub_metering_2)
subMetering3 <- as.numeric(data_sub$Sub_metering_3)

# Making the plot
png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
