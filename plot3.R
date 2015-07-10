## Reading and convertin data into R
power_consumption <- read.csv("~/RProgramming_coursera/4.Exploratory_Data_Analysis/Course Project 1/household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?")

power_consumption$Date <- as.Date(power_consumption$Date, format="%d/%m/%Y")

# Subsetting the data for 2007-02-01 and 2007-02-02 dates
data_subset <- subset(power_consumption, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Converting Time variable
datetime <- paste(as.Date(data_subset$Date), data_subset$Time)
data_subset$Datetime <- as.POSIXct(datetime)
head(data_subset)
# Plot 3
with(data_subset, {
  plot(Sub_metering_1~Datetime, type = "line", ylab = "Global Active Power (Kilowatts)", xlab = "")
  lines(Sub_metering_2~Datetime, col = "red")
  lines(Sub_metering_3~Datetime, col = "blue")
  })
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Copying plot3 to png file
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()
