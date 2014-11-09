## Getting full dataset
data_original <- read.table("household_power_consumption.txt", header=T, sep=';', na.strings="?")
data_original$Date <- as.Date(data_original$Date, format="%d/%m/%Y")
## Subsetting the data
data <- subset(data_original, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_original)

## Converting dates

date_mod <- paste(as.Date(data$Date), data$Time)

data$Date_mod <- as.POSIXct(date_mod)


## Plot 3

with(data, {
plot(Sub_metering_1~Date_mod, type="l",ylab="Global Active Power (kilowatts)", xlab="")
lines(Sub_metering_2~Date_mod,col='Red')
lines(Sub_metering_3~Date_mod,col='Blue')
})


legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,
legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
