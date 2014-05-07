##############################################
## Data project 1 in Exploratory Data Analysis
##
## Plot 3
##
## Download and unzip data from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
## With Data detailed at https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption
##

# Set the working directory
setwd("C:/Users/Crusher/Documents/Coursera/Exploratory Data Analysis/Project 1")
getwd()

# Read in a subset of data from household_power_consumption for dates 2007-02-01 and 2007-02-02.
# read.cvs.sql allows you to filter the reading of a large CSV file minimizing the size of the working dataset
feb012007<-read.csv.sql("household_power_consumption.txt",sep=";", sql = "select * from file where Date ='1/2/2007'")
feb022007<-read.csv.sql("household_power_consumption.txt",sep=";", sql = "select * from file where Date ='2/2/2007'")
data<-rbind(feb012007,feb022007)

# Quick look at the data
head(data)
summary(data)

# Convert data$Date from CHAR to DATE with expected format
# Combine converted date with time to create CHAR timestamp
# Convert CHAR timestamp to POSIXlt / POSIXt date-time class
date<-as.Date(data$Date,format="%d/%m/%Y")
date_time<-paste(date,data$Time)
date_time<-strptime(date_time, "%Y-%m-%d %H:%M:%S")


# Create a time series plot for Thurs & Fri  in PNG file format with size 480pixels by 480pixels
png(file="plot3.png", width=480, height=480)
plot(date_time,data$Sub_metering_1, type="l",xlab="",ylab="Energy sub metering")
lines(date_time,data$Sub_metering_2, type="l",xlab="",ylab="Energy sub metering",col="Red")
lines(date_time,data$Sub_metering_3, type="l",xlab="",ylab="Energy sub metering",col="Blue")
legend("topright",col=c("Black","Red","Blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1))
dev.off()
