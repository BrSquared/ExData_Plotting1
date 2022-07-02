## Retrieves the data
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipped <- "Zippeddata.zip"
download.file(url, zipped)
unzip(zipped)

df <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, 
                 na.strings = "?")

## Subsetting the data
plotdata <- subset(df,df$Date == "1/2/2007" | df$Date == "2/2/2007")

## Creating the png with the histogram
png("plot1.png", width = 480, height = 480)
hist(plotdata$Global_active_power, main = "Global Active Power", col = "red", 
     xlab = "Global Active Power (kilowatts)")
dev.off()
