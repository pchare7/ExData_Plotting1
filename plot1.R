library(dplyr)
d_file<-read.table("household_power_consumption.txt", header = TRUE,
               sep=";", stringsAsFactors=FALSE, na.strings="?")
#Get data for 2/1/2007 and 2/2/2007 only
d_plot <- subset(d_file,d_file$Date=="1/2/2007" | d_file$Date=="2/2/2007")
#Convert date to datetime and add column
#dt <- strptime(paste(d_plot$Date, d_plot$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
#d_plot <- mutate(d_plot, datetime = as.POSIXct(dt))
#Remove the raw data file
rm(d_file)

hist(d_plot$Global_active_power, col="red", main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()


