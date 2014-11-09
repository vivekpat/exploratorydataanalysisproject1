## Getting full dataset

data_original <- read.table("household_power_consumption.txt", header=T, sep=';', na.strings="?")
data_original$Date <- as.Date(data_original$Date, format="%d/%m/%Y")

## Subsetting the data
data <- subset(data_original, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Remove original file to free memmory

rm(data_original)


## Converting dates

date_mod <- paste(as.Date(data$Date), data$Time)

data$Date_mod <- as.POSIXct(date_mod)

## Plot 2
plot(data$Global_active_power~data$Date_mod, type="l", ylab="Global Active Power (kilowatts)", xlab="")

dev.copy(png, file="plot2.png", height=480, width=480)

dev.off()
