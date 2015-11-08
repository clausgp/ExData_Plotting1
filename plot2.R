# read the first part of the file, which contains the data we are interested in
hpc <- read.csv("household_power_consumption.txt",sep=";",stringsAsFactors = FALSE, nrows=70000)
# get the rows with the dates we are interested in
hpc2 <- hpc[hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007",]

# convert the variable we want to examine to numeric
hpc2$Global_active_power <- as.numeric(hpc2$Global_active_power)
hpc2$timestamp <- paste(hpc2$Date, hpc2$Time, sep="-")
# there is no notion of which timezone the data comes from, so UTC is used.
hpc2$timestamp <- strptime(hpc2$timestamp, "%d/%m/%Y-%H:%M:%S", tz="UTC")

# plot directly to png
png(filename="plot2.png", width=480, height=480)

# make a line scatterplot.
plot(hpc2$timestamp, hpc2$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# close the png
dev.off()