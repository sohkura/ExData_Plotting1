# Exploratory Data Analysis
# Assignment 1
# Plot2.R

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

# plot the graph to the screen using V2 (Global Active Power) as X axis and V3 as Y axis
par(mfrow = c(1,1))
plot(sub$V2, sub$V3, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

# create the same graph to the PNG file
png(filename = "plot2.png", width = 480, height = 480, unit = "px")
par(mfrow = c(1,1))
plot(sub$V2, sub$V3, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()
