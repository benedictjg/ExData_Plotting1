##reading data into R with proper rows
power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".",stringsAsFactors = FALSE)

##converting date
power[,1] <- as.Date(power[,1], format("%d/%m/%Y"))

##subsetting power into 2007-02-01 to 2007-02-02
power <- power[which(power$Date == "2007-02-02" | power$Date == "2007-02-01"),]
DT <- paste(power$Date, power$Time)
power$DT <- as.POSIXct(DT)

##setting column3 to numeric for the histogram
power[,3] <- as.numeric(power[,3])

##making the plot
png("plot2.png", width = 480, height = 480)
plot(power$Global_active_power ~ power$DT, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()
