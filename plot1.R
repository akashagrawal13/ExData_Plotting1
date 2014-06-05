plot1<-function() {
    
    file<-read.csv("household_power_consumption.txt", sep=";")
    
    file[,1]<-as.Date(file[,1], format="%d/%m/%Y")
    
    sub<-subset(file, file[,1]=="2007-02-01" | file[,1]=="2007-02-02")
    
    sub[,3]<-as.numeric(as.character(sub[,3]))
    
    hist(sub[,3], col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
    
    dev.copy(png, file="plot1.png")
    dev.off()
}