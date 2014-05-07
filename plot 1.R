##############################################
## Data project 1 in Exploratory Data Analysis
##
## Plot 1
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

# Create a histogram in PNG file format with size 480pixels by 480pixels
png(file="plot1.png", width=480, height=480)
hist(data$Global_active_power,main="Global Active Power",col="red",xlab="Global Active Power (in Kilowatts)")
dev.off()
