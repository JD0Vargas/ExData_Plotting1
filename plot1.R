cat("\014")
library(dplyr)
library(lubridate)

## Loading the dataset into R

Data<-read.table(file='household_power_consumption.txt', header=TRUE, sep=';')
Data$Date<-dmy(Data$Date)
Data1<-filter(Data, Date==dmy('1-02-2007')|Date==dmy('2-02-2007'))
Data1$Global_active_power<-as.numeric(as.character(Data1$Global_active_power))
print

## Plot

png(file='myplot/plot1.png')
with(Data1,hist(Global_active_power,col='red',
                xlab='Global Active Power (Kilowatts)',
                main='Global Active Power'))

dev.off()
