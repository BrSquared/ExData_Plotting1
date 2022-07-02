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
png("plot3.png", width = 480, height = 480)
plot(plotdata$FormatDate,plotdata$Sub_metering_1, type = "l", xlab = "",
     ylab = "Energy Sub Metering")
lines(plotdata$FormatDate,plotdata$Sub_metering_2, col = "red")
lines(plotdata$FormatDate,plotdata$Sub_metering_3, col = "blue")
legend("topright", legend = names(plotdata)[7:9], lty = c(1,1,1), 
       col = c("black","red","blue"))
dev.off()


