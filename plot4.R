# Load data 

dataFile <- "./household_power_consumption.txt"
power <- read.table(dataFile, header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")

# Subset data

sub_power <- power[power$Date %in% c("1/2/2007", "2/2/2007") ,]

# Convert variable

sub_power$Date <- as.Date(sub_power$Date, format = "%d/%m/%Y")
datetime <- paste(as.Date(sub_power$Date), sub_power$Time)
sub_power$Datetime <- as.POSIXct(datetime)


# Plot

par(mfrow=c(2,2))
with(sub_power, {
     plot(Global_active_power~Datetime, type="l", 
          ylab="Global Active Power (kilowatts)", xlab="")
     plot(Voltage~Datetime, type="l", 
          ylab="Voltage (volt)", xlab="")
     plot(Sub_metering_1~Datetime, type="l", 
          ylab="Energy sub metering", xlab="")
     lines(Sub_metering_2~Datetime,col='Red')
     lines(Sub_metering_3~Datetime,col='Blue')
     legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
            legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
     plot(Global_reactive_power~Datetime, type="l", 
          ylab="Global Rective Power (kilowatts)",xlab="")
 })

## Saving to file

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
