# read the first part of the file, which contains the data we are interested in
hpc <- read.csv("household_power_consumption.txt",sep=";",stringsAsFactors = FALSE, nrows=70000)
# get the rows with the dates we are interested in
hpc2 <- hpc[hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007",]

# convert the variable we want to examine to numeric
hpc2$Global_active_power <- as.numeric(hpc2$Global_active_power)
hpc2$Voltage <- as.numeric(hpc2$Voltage)
hpc2$Global_reactive_power <- as.numeric(hpc2$Global_reactive_power)
hpc2$timestamp <- paste(hpc2$Date, hpc2$Time, sep="-")
# there is no notion of which timezone the data comes from, so UTC is used.
hpc2$timestamp <- strptime(hpc2$timestamp, "%d/%m/%Y-%H:%M:%S", tz="UTC")

# plot directly to png
png(filename="plot4.png", width=480, height=480)

# 2x2 matrix plot
par(mfrow = c(2, 2))

# 1
plot(hpc2$timestamp, hpc2$Global_active_power, type="l", xlab="", ylab="Global Active Power")

# 2
plot(hpc2$timestamp, hpc2$Voltage, type="l", xlab="datetime", ylab="Voltage")

# 3
plot(hpc2$timestamp, hpc2$Sub_metering_1, xlab="", ylab="Energy sub metering", type = "n")
lines(hpc2$timestamp, hpc2$Sub_metering_1, col="black")
lines(hpc2$timestamp, hpc2$Sub_metering_2, col="red")
lines(hpc2$timestamp, hpc2$Sub_metering_3, col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")

# 4
plot(hpc2$timestamp, hpc2$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

# close the png
dev.off()