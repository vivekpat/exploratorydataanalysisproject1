## Getting full dataset

data_original <- read.table("household_power_consumption.txt", header=T, sep=';', na.strings="?")
data_original$Date <- as.Date(data_original$Date, format="%d/%m/%Y")

## Subsetting the data

data <- subset(data_original, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Remove original file to free memmory

rm(data_original)

## Plot 1

hist(data$Global_active_power, main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
