cat("\014")
library(dplyr)
library(lubridate)

## Loading the dataset into R

Data<-read.table(file='household_power_consumption.txt', header=TRUE, sep=';')
Data$Date<-dmy(Data$Date)
Data1<-filter(Data, Date==dmy('1-02-2007')|Date==dmy('2-02-2007'))
Data1$Global_active_power<-as.numeric(as.character(Data1$Global_active_power))

Date1=ymd_hms(paste(as.character(Data1$Date),Data1$Time))

## Plot

png(file='myplot/plot2.png')
with(Data1,plot(Date1,Global_active_power,
                ylab='Global Active Power (Kilowatts)',
                type='l', xlab=""))

dev.off()