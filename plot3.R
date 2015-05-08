##reading data into R with proper rows
power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".",stringsAsFactors = FALSE)

##converting date
power[,1] <- as.Date(power[,1], format("%d/%m/%Y"))

##subsetting power into 2007-02-01 to 2007-02-02
power <- power[which(power$Date == "2007-02-02" | power$Date == "2007-02-01"),]
DT <- paste(power$Date, power$Time)
power$DT <- as.POSIXct(DT)

##setting column3 to numeric for the histogram
power[,7] <- as.numeric(power[,7])
power[,8] <- as.numeric(power[,8])
power[,9] <- as.numeric(power[,9])

##making the plot
png("plot3.png", width = 480, height = 480)
plot(power[,7]~power$DT, type= "l", col = "black", xlab = "", ylab = "Global sub metering")
lines(power[,8]~power$DT, col = "red")
lines(power[,9]~power$DT, col = "blue")
legend("topright", col = c("black","red","blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1)

dev.off()