# read the first part of the file, which contains the data we are interested in
hpc <- read.csv("household_power_consumption.txt",sep=";",stringsAsFactors = FALSE, nrows=70000)
# get the rows with the dates we are interested in
hpc2 <- hpc[hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007",]

# convert the variable we want to examine to numeric
hpc2$Global_active_power <- as.numeric(hpc2$Global_active_power)

# plot directly to png
png(filename="plot1.png", width=480, height=480)

# make a histogram
hist(hpc2$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# close the png
dev.off()