## Reading and convertin data into R
power_consumption <- read.csv("~/RProgramming_coursera/4.Exploratory_Data_Analysis/Course Project 1/household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?")

power_consumption$Date <- as.Date(power_consumption$Date, format="%d/%m/%Y")

# Subsetting the data for 2007-02-01 and 2007-02-02 dates
data_subset <- subset(power_consumption, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Converting Time variable
datetime <- paste(as.Date(data_subset$Date), data_subset$Time)
data_subset$Datetime <- as.POSIXct(datetime)

# Plot 4
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(data_subset, {
  plot(Global_active_power~Datetime, type = "l", ylab = "Global Active Power", xlab = "")
  plot(Voltage ~ Datetime, type = "line", ylab = "Voltage", xlab = "datetime")
  plot(Sub_metering_1~Datetime, type = "l", ylab = "Energy sub metering", xlab = "")
  lines(Sub_metering_2~Datetime, col = "red")
  lines(Sub_metering_3~Datetime, col = "blue")
  legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type = "line", ylab = "Global Reactive Power", xlab = "datetime")
})

# Copying plot4 to png file
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()


# ###### Creating more plots on the same page
# ?split.screen
# split.screen(figs = c(2, 2))
# screen(1)
# plot(data_subset$Global_active_power ~ data_subset$Datetime, type = "line", ylab = "Global Active Power", xlab = "")
# 
# screen(2)
# plot(data_subset$Voltage ~ data_subset$Datetime, type = "line", ylab = "Voltage", xlab = "datetime")
# 
# screen(3)
# plot(data_subset$Sub_metering_1 ~ data_subset$Datetime, type = "line", ylab = "Energy sub metering", xlab = "")
# lines(data_subset$Sub_metering_2 ~ data_subset$Datetime, col = "red")
# lines(data_subset$Sub_metering_3 ~ data_subset$Datetime, col = "blue")
# legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
# 
# screen(4)
# plot(data_subset$Global_reactive_power ~ data_subset$Datetime, type = "line", ylab = "Global Reactive Power", xlab = "datetime")
# 
# close.screen(all = TRUE)
# 
# # Copying plot4 to png file
# dev.copy(png, file = "plot4.png")
# dev.off()
