# Load data 

dataFile <- "./household_power_consumption.txt"
power <- read.table(dataFile, header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")

# Subset data

sub_power <- power[power$Date %in% c("1/2/2007", "2/2/2007") ,]

# Convert variable

globalActivePower <- as.numeric(subSetData$Global_active_power)

# Histogram

hist(globalActivePower, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

# Save file

dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
