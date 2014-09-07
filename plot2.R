data = read.table("household_power_consumption.txt",
	header = TRUE,
	sep = ";",
	na.strings = "?",
	colClasses = c("character", "character", rep("real", 7)))
data$Date = as.Date(data$Date, "%d/%m/%Y")
data = subset(data, data$Date %in% as.Date(c("2007-02-01", "2007-02-02")))
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")

Sys.setlocale("LC_TIME", "English")
png("plot2.png")
par(mfcol = c(1, 1))
plot(data$DateTime,
	data$Global_active_power,
	type = "l",
	xlab = " ",
	ylab = "Global Active Power (kilowatts)")
dev.off()