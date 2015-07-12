# Exploratory Data Analysis
# Assignment 1
# Plot4.R

# read the data from the file downloaded to the current directory.
data <- read.table("household_power_consumption.txt", sep=";", na.strings = "?", skip = 1)

# convert V1 that represents the date of measurements from factor to date.
data$V1 <- as.character(data$V1)
data$V1 <- strptime(data$V1, "%d/%m/%Y")
data$V1 <- as.Date(data$V1)

# obatin subset of the data whose measurement dates are between 2007-02-01 and 2007-02-02.

sub <- subset(data, V1 >= "2007-02-01" & V1 <= "2007-02-02")

# convert V2 to POSIXlt date and time format
sub$V1 <- as.character(sub$V1)
sub$V2 <- as.character(sub$V2)
sub$V2 <- paste(sub$V1, sub$V2)
sub$V2 <- strptime(sub$V2, "%Y-%m-%d %H:%M:%S")

# prepare a plot for mfcol (2 x 2) on the screen
par(mfcol = c(2,2), mar = c(4,4,2,1), oma=c(0,0,2,0))

# plot the graph to the screen (1,1) for global active power (V2)
plot(sub$V2, sub$V3, type = "l", ylab = "Global Active Power", xlab = "")

# plot the graph to the screen (2,1) for sub meters (V7, V8, V9)
plot(sub$V2, sub$V7, type = "n", ylab = "Energy sub metering", xlab = "")
with(sub, lines(V2, V7, col = "black"))
with(sub, lines(V2, V8, col = "red"))
with(sub, lines(V2, V9, col = "blue"))
legend("topright", pch = c(NA,NA, NA), lty = c(1,1,1), bty = "n", col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# plot the graph to the screen (1,2) for Voltage (V5)
plot(sub$V2, sub$V5, type = "l", ylab = "Voltage", xlab = "datetime")

# plot the graph to the screen (2,2) for Global reactive power (V4)
plot(sub$V2, sub$V4, type = "l", ylab = "Global_reactive_power", xlab = "datetime")

# create the graph to the PNG file
png(filename = "plot4.png", width = 480, height = 480, unit = "px")
par(mfcol = c(2,2), mar = c(4,4,2,1), oma=c(0,0,2,0))
plot(sub$V2, sub$V3, type = "l", ylab = "Global Active Power", xlab = "")
plot(sub$V2, sub$V7, type = "n", ylab = "Energy sub metering", xlab = "")
with(sub, lines(V2, V7, col = "black"))
with(sub, lines(V2, V8, col = "red"))
with(sub, lines(V2, V9, col = "blue"))
legend("topright", pch = c(NA,NA, NA), lty = c(1,1,1), bty = "n", col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(sub$V2, sub$V5, type = "l", ylab = "Voltage", xlab = "datetime")
plot(sub$V2, sub$V4, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
dev.off()
