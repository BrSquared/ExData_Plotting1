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
png("plot2.png", width = 480, height = 480)
plot(plotdata$FormatDate,plotdata$Global_active_power, type = "l", xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()