# Load data 

dataFile <- "./household_power_consumption.txt"
power <- read.table(dataFile, header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")

# Subset data

sub_power <- power[power$Date %in% c("1/2/2007", "2/2/2007") ,]

# Convert variable

globalActivePower <- as.numeric(sub_power$Global_active_power)
sub_power$Date <- as.Date(sub_power$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(sub_power$Date), sub_power$Time)
sub_power$Datetime <- as.POSIXct(datetime)

# Plot

with(subSetData, plot(globalActivePower~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab=""))

# Save file

dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()

