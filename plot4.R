rm(list=ls())
library(data.table)
library(dplyr)
#url <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
setwd('~/') # change this if you want to use a specific directory to store all the files created by this script
setwd('./Coursera/Exploratory')
#download.file(url,'householdpower.zip')
#unzip('householdpower.zip')
columnnames <- read.table('household_power_consumption.txt',nrows=1,sep=';', stringsAsFactors = F)
hpc <- fread('household_power_consumption.txt', na.strings = '?',skip='1/2/2007',nrows=2880,header=F)
setnames(hpc,paste(columnnames))
hpc[,Instance:=as.POSIXct(paste0(Date,' ',Time), format = "%d/%m/%Y %H:%M:%S")]

png('plot4.png')
par(mfrow=c(2,2))
plot(hpc[,Instance],hpc[,Global_active_power],type = 'l',ylab='Global Active Power',xlab='')
plot(hpc[,Instance],hpc[,Voltage],type = 'l',ylab='Voltage',xlab='datetime')
plot(hpc[,Instance],hpc[,Sub_metering_1],type = 'l',ylab='Energy sub metering',xlab='')
lines(hpc[,Instance],hpc[,Sub_metering_2],col='red')
lines(hpc[,Instance],hpc[,Sub_metering_3],col='blue')
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c('black', 'red', 'blue'),lty=1,bty='n')
plot(hpc[,Instance],hpc[,Global_reactive_power],type = 'l',ylab='Global_reactive_power',xlab='datetime')
dev.off()