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

png('plot1.png')
par(mfrow=c(1,1))
hist(hpc[,Global_active_power],main='Global Active Power',col = 'orangered',xlab='Global Active Power (kilowatts)')
dev.off()