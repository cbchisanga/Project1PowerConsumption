## Reading and convertin data into R
power_consumption <- read.csv("~/RProgramming_coursera/4.Exploratory_Data_Analysis/Course Project 1/household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?")

power_consumption$Date <- as.Date(power_consumption$Date, format="%d/%m/%Y")

# Subsetting the data for 2007-02-01 and 2007-02-02 dates
data_subset <- subset(power_consumption, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Converting Time variable
datetime <- paste(as.Date(data_subset$Date), data_subset$Time)
data_subset$Datetime <- as.POSIXct(datetime)

# Plot 1
hist(data_subset$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col="Red")

# Copying plot1 to png file
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
