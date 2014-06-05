plot4<-function() {
    
    file<-read.csv("household_power_consumption.txt", sep=";")
    
    file<-subset(file, as.Date(file[,1], format="%d/%m/%Y")=="2007-02-01" | as.Date(file[,1], format="%d/%m/%Y")=="2007-02-02")
    
    timstamp<-paste(file[,1], file[,2])
    
    timstamp<-strptime(timstamp, format="%d/%m/%Y %H:%M:%S")
    
    file[,7]<-as.numeric(as.character(file[,7]))
    
    file[,8]<-as.numeric(as.character(file[,8]))
    
    file[,3]<-as.numeric(as.character(file[,3]))
    
    file[,4]<-as.numeric(as.character(file[,4]))
    
    file[,5]<-as.numeric(as.character(file[,5]))
    
    par(mfrow=c(2,2))
    plot(timstamp, file[,3], type="l", lwd="1", xlab=" ", ylab="Global Active Power")
    plot(timstamp, file[,5], type="l", lwd="1", xlab="datetime", ylab="Voltage")
    plot(timstamp, file[,7], type="l", lwd="1", xlab=" ", ylab="Enery sub metering")
    points(timstamp, file[,8], col="red", lwd="1", type="l")
    points(timstamp, file[,9], col="blue", lwd="1", type="l")
    legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=c(1,1,1), col=c("black", "red", "blue"), cex=0.25, bty="n")
    plot(timstamp, file[,4], type="l", lwd="1", xlab="datetime", ylab="Global_reactive_power")
    
    dev.copy(png, file="plot4.png")
    dev.off()
}