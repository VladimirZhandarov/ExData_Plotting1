data = read.table("household_power_consumption.txt",
	header = TRUE,
	sep = ";",
	na.strings = "?",
	colClasses = c("character", "character", rep("real", 7)))
data$Date = as.Date(data$Date, "%d/%m/%Y")
data = subset(data, data$Date %in% as.Date(c("2007-02-01", "2007-02-02")))
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")

Sys.setlocale("LC_TIME", "English")
png("plot4.png")
par(mfcol = c(2, 2))
plot(data$DateTime,
	data$Global_active_power,
	type = "l",
	xlab = " ",
	ylab = "Global Active Power")

plot(data$DateTime,
	data$Sub_metering_1,
	type = "l",
	xlab = " ",
	ylab = "Energy sub metering")
lines(data$DateTime,
	data$Sub_metering_2,
	col = "Red")
lines(data$DateTime,
	data$Sub_metering_3,
	col = "Blue")
legend(x = "topright",
	legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
	col = c("Black", "Red", "Blue"),
	lwd = 1, pt.cex = 0.6, cex = 0.6, bty = "n")

plot(data$DateTime,
	data$Voltage,
	type="l",
	xlab="datetime",
	ylab="Voltage")

plot(data$DateTime,
	data$Global_reactive_power,
	type="l",
	xlab="datetime",
	ylab="Global_reactive_power")

dev.off()