cat("\014")
library(dplyr)
library(lubridate)

## Loading the dataset into R

Data<-read.table(file='household_power_consumption.txt', header=TRUE, sep=';')
Data$Date<-dmy(Data$Date)
Data1<-filter(Data, Date==dmy('1-02-2007')|Date==dmy('2-02-2007'))

Data1$Global_active_power<-as.numeric(as.character(Data1$Global_active_power))
Data1$Sub_metering_1<-as.numeric(as.character(Data1$Sub_metering_1))
Data1$Sub_metering_2<-as.numeric(as.character(Data1$Sub_metering_2))
Data1$Sub_metering_3<-as.numeric(as.character(Data1$Sub_metering_3))
Data1$Voltage<-as.numeric(as.character(Data1$Voltage))
Data1$Global_reactive_power<-as.numeric(as.character(Data1$Global_reactive_power))

Date1=ymd_hms(paste(as.character(Data1$Date),Data1$Time))

## Plot

png(file='myplot/plot4.png')
par(mfrow=c(2,2))
#subplot1
with(Data1,plot(Date1,Global_active_power,
                ylab='Global Active Power (Kilowatts)',xlab="",
                type='l'))
#subplot2
with(Data1,plot(Date1,Voltage,
                ylab='Voltage',xlab="datetime",
                type='l'))
#Subplot3
with(Data1,plot(Date1,Sub_metering_1,
                ylab='Energy sub metering',xlab="",
                type='l'))
with(Data1,lines(Date1,Sub_metering_2,
                 type='l', col='red'))
with(Data1,lines(Date1,Sub_metering_3,,
                 type='l', col='blue'))
legend("topright",lty=1, col=c('black','red','blue'),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#subplot4
with(Data1,plot(Date1,Global_reactive_power,xlab="datetime",
                type='l'))
dev.off()