setwd("d:/users/wittha/Documents/RStudio/Module 4_Assignment 1/")
## read text file
Consumption <- read.table("household_power_consumption.txt",  header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")
## use dplyr to subset data to specific dates
library(dplyr)
## subset data to only 2 dates - 1/2/2007 and 2/2/2007
Consumption1 <- filter(Consumption,Date == "1/2/2007" | Date == "2/2/2007")
## create histogram (plot 1)
hist(Consumption1$Global_active_power, col = "red",xlab = "Global Active Power (kilowatts)",main = "Global Active Power")
## copy histogram from the screen to png file
dev.copy(png, file = "plot1.png",width = 480, height = 480, unit = "px")
dev.off