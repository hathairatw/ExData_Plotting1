setwd("d:/users/wittha/Documents/RStudio/Module 4_Assignment 1/")
## read text file
Consumption <- read.table("household_power_consumption.txt",  header = TRUE, sep = ";", colClasses = NA,stringsAsFactors = FALSE)

## use dplyr to subset data to specific dates
library(dplyr);library(lubridate)
## subset data to only 2 dates - 1/2/2007 and 2/2/2007
Consumption1 <- filter(Consumption,Date == "1/2/2007" | Date == "2/2/2007")
## create a column named Newtime which is a combination of date and time
Consumption1 <- mutate(Consumption1, Newtime= paste(Date," ",Time))
## change the Date format from string to date
Consumption1$Date <- as.Date(Consumption1$Date, "%d/%m/%Y")
## change the Newtime format from string to date and time
Consumption1$Newtime <- strptime(Consumption1$Newtime,format="%d/%m/%Y %H:%M:%S")
## change the Newtime format from string to numeric
Consumption1$Global_active_power <- as.numeric(Consumption1$Global_active_power)

## plot the chart in png
## note: I tried plotting the chart on screen and copied to png but the legend went funny. Half of it was missing!
png("plot3.png", width = 480, height = 480, unit = "px")
# create a first line
plot(Consumption1$Newtime, Consumption1$Sub_metering_1,type="l",xlab = "",ylab = "Energy sub metering", col = "black")
# add the second line
lines(Consumption1$Newtime, Consumption1$Sub_metering_2, col = "red")
# add the third line
lines(Consumption1$Newtime, Consumption1$Sub_metering_3, col = "blue")
## add legend
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty = 1, cex=0.8)

dev.off
