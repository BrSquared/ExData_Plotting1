## Retrieves the data
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipped <- "Zippeddata.zip"
download.file(url, zipped)
unzip(zipped)

df <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, 
                 na.strings = "?")

## Subsetting the data
plotdata <- subset(df,df$Date == "1/2/2007" | df$Date == "2/2/2007")

## Getting the dates into a usable format
plotdata$DateTime <- paste(plotdata$Date, plotdata$Time, sep = " ")
plotdata$FormatDate <- as.POSIXct(plotdata$DateTime, format = "%d/%m/%Y %H:%M:%S")

## Creating the plot

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
plot(plotdata$FormatDate,plotdata$Global_active_power, type = "l", xlab = "",
     ylab = "Global Active Power")
plot(plotdata$FormatDate,plotdata$Voltage, type = "l", xlab = "datetime",
     ylab = "Voltage")
plot(plotdata$FormatDate,plotdata$Sub_metering_1, type = "l", xlab = "",
     ylab = "Energy Sub Metering")
lines(plotdata$FormatDate,plotdata$Sub_metering_2, col = "red")
lines(plotdata$FormatDate,plotdata$Sub_metering_3, col = "blue")
legend("topright", legend = names(plotdata)[7:9], lty = c(1,1,1), 
       col = c("black","red","blue"), bty = "n")
plot(plotdata$FormatDate,plotdata$Global_reactive_power, type = "l", xlab = "datetime",
     ylab = "Global_reactive_power")
dev.off()
