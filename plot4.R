##reading data from file
file<-"household_power_consumption.txt"
dataset<-read.table(file, sep=";",header=TRUE, dec=".", colClasses="character")

##creating subset of data
data<-dataset[dataset$Date %in% c("1/2/2007","2/2/2007"),] 

##formating date variable
datetime<-paste(data$Date,data$Time)
time<-strptime(datetime, format="%d/%m/%Y %H:%M:%s")

##creating PNG file
png(filename = "plot4.png", width = 480, height = 480, units = "px", pointsize = 12)

##plotting data for this subset of specific dates
par(mfrow=c(2,2),mar=c(4,4,2,2),ps=12)

plot(time, as.numeric(data$Global_active_power), type = "l"
     ,ylab="Global Active Power", xlab="")

plot(time, as.numeric(data$Voltage), type = "l"
     ,ylab="Voltage", xlab="datetime")

with(data, plot(time,as.numeric(data$Sub_metering_1),type="n",
                ylab="Energy sub metering", xlab=""))
with(data, lines(time,as.numeric(data$Sub_metering_1)))
with(data, lines(time,as.numeric(data$Sub_metering_2),col="red"))
with(data, lines(time,as.numeric(data$Sub_metering_3),col="blue"))
legend("topright", lwd=1, col=c("black","red","blue"), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty = "n")

plot(time, as.numeric(data$Global_reactive_power), type = "l"
     ,ylab="Global_reactive_power", xlab="datetime")

##closing PNG file
dev.off() 
