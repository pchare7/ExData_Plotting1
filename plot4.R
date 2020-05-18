library(dplyr)
d_file<-read.table("household_power_consumption.txt", header = TRUE,
               sep=";", stringsAsFactors=FALSE, na.strings="?")
#Get data for 2/1/2007 and 2/2/2007 only
d_plot <- subset(d_file,d_file$Date=="1/2/2007" | d_file$Date=="2/2/2007")
#Convert date to datetime and add column
dt <- strptime(paste(d_plot$Date, d_plot$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
d_plot <- mutate(d_plot, datetime = as.POSIXct(dt))
#Remove the raw data file
rm(d_file)

par(mfcol=c(2,2))

#create the 4 graphs
plot(d_plot$datetime,d_plot$Global_active_power,xlab="",ylab="Global Active Power",
     type="l")

plot(d_plot$datetime,d_plot$Sub_metering_1,xlab = "",ylab="Energy sub metering",type="l")
lines(d_plot$datetime,d_plot$Sub_metering_2,col="red")
lines(d_plot$datetime,d_plot$Sub_metering_3,col="blue")
legend("topright",legend=names(d_plot[,c(7,8,9)]),col=c("black","red","blue"),
       lty=c(1,1,1),cex=0.25)

plot(d_plot$datetime,d_plot$Voltage,xlab="",ylab="Voltage",type="l") 

plot(d_plot$datetime,d_plot$Global_reactive_power,xlab="",ylab="Global_reactive_power",type="l")

dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()


