# Exploratory Data Analysis
# Assignment 1
# Plot1.R

# read the data from the file downloaded to the current directory.
data <- read.table("household_power_consumption.txt", sep=";", na.strings = "?", skip = 1)

# convert V1 that represents the date of measurements from factor to date.
data$V1 <- as.character(data$V1)
data$V1 <- strptime(data$V1, "%d/%m/%Y")
data$V1 <- as.Date(data$V1)

# obatin subset of the data whose measurement dates are between 2007-02-01 and 2007-02-02.

sub <- subset(data, V1 >= "2007-02-01" & V1 <= "2007-02-02")

# draw the histogram to the screen for V3 that represents Global_active_power
par(mfrow = c(1,1))
hist(sub$V3, col = "red", main = "", xlab = "Global Active Power (kilowatts)")
title(main = "Global Active Power")

# create the same graph to the PNG file

png(filename = "plot1.png", width = 480, height = 480, unit = "px")
par(mfrow = c(1,1))
hist(sub$V3, col = "red", main = "", xlab = "Global Active Power (kilowatts)")
title(main = "Global Active Power")
dev.off()




