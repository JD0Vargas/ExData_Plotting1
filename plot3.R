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

Date1=ymd_hms(paste(as.character(Data1$Date),Data1$Time))

## Plot

png(file='myplot/plot3.png')
with(Data1,plot(Date1,Sub_metering_1,
                ylab='Energy sub metering',
                type='l',xlab=""))
with(Data1,lines(Date1,Sub_metering_2,
                type='l', col='red'))
with(Data1,lines(Date1,Sub_metering_3,,
                 type='l', col='blue'))
legend("topright",lty=1, col=c('black','red','blue'),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()