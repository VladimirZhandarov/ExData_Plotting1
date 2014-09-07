data = read.table("household_power_consumption.txt",
	header = TRUE,
	sep = ";",
	na.strings = "?",
	colClasses = c("character", "character", rep("real", 7)))
data$Date = as.Date(data$Date, "%d/%m/%Y")
data = subset(data, data$Date %in% as.Date(c("2007-02-01", "2007-02-02")))

png("plot1.png")
par(mfcol = c(1, 1))
hist(data$Global_active_power,
	col = "Red",
	main = "Global Active Power",
	xlab = "Global Active Power (kilowatts)")
dev.off()