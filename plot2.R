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
## plot the chart
plot(Consumption1$Newtime, Consumption1$Global_active_power,type="l",xlab = "",ylab = "Global Active Power (kilowatts)")

## copy plot from the screen to png file
dev.copy(png, file = "plot2.png",width = 480, height = 480, unit = "px")
dev.off
