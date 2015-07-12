# Exploratory Data Analysis
# Assignment 1
# Plot3.R

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

# plot the graph to the screen for sub meters (V7, V8, V9)
par(mfrow = c(1,1))
plot(sub$V2, sub$V7, type = "n", ylab = "Energy sub metering", xlab = "")
with(sub, lines(V2, V7, col = "black"))
with(sub, lines(V2, V8, col = "red"))
with(sub, lines(V2, V9, col = "blue"))
legend("topright", pch = c(NA,NA, NA), lty = c(1,1,1), col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# create the same graph to the PNG file
png(filename = "plot3.png", width = 480, height = 480, unit = "px")
par(mfrow = c(1,1))
plot(sub$V2, sub$V7, type = "n", ylab = "Energy sub metering", xlab = "")
with(sub, lines(V2, V7, col = "black"))
with(sub, lines(V2, V8, col = "red"))
with(sub, lines(V2, V9, col = "blue"))
legend("topright", pch = c(NA,NA, NA), lty = c(1,1,1), col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
