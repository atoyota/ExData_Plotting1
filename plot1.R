# download data file from the internet and and unzip it under "data" subfolder
# set the current working directory to "ExploratoryData" subdir if it it is at
# setwd('./ExploratoryData')
if(!file.exists('data')) dir.create('data')
fileUrl <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
download.file(fileUrl, destfile = './data/household_power_consumption.zip')
unzip('./data/household_power_consumption.zip', exdir = './data')

# read house hold power consumption data between 2007-02-01 and 2007-02-02 and load into memory with setting column names.
files <- file('./data/household_power_consumption.txt')
data <- read.table(text = grep("^[1,2]/2/2007",readLines(files),value=TRUE), sep = ';', col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = '?')
close(files)
# Plot 1
# set the current working directory to "graphs" subdir if it does not exist
# open device
if(!file.exists('graphs')) dir.create('graphs')
png(filename = './graphs/plot1.png', width = 480, height = 480, units='px')
# plot figure
with(data, hist(Global_active_power, xlab = 'Global Active Power (kilowatt)', main = 'Global Active Power', col = 'red'))
# close device
dev.off()
cat("Plot1.png has been saved in graphs subdirectory")