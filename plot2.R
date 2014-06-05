plot2<-function() {
    
    file<-read.csv("household_power_consumption.txt", sep=";")
    
    sub<-subset(file, as.Date(file[,1], format="%d/%m/%Y")=="2007-02-01" | as.Date(file[,1], format="%d/%m/%Y")=="2007-02-02")
    
    timstamp<-paste(sub[,1], sub[,2])
    
    timstamp<-strptime(timstamp, format="%d/%m/%Y %H:%M:%S")
    
    sub[,3]<-as.numeric(as.character(sub[,3]))
    
    plot(timstamp, sub[,3], type="l", lwd="2", xlab=" ", ylab="Global Active Power (kilowatts)")
    
    dev.copy(png, file="plot2.png")
    dev.off()
}