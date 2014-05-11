##reading data from file
file<-"household_power_consumption.txt"
dataset<-read.table(file, sep=";",header=TRUE, dec=".", colClasses="character")

##creating subset of data
data<-dataset[dataset$Date %in% c("1/2/2007","2/2/2007"),] 

##plotting data for this subset of specific dates
par(mfrow=c(1,1),mar=c(4,4,2,1))
hist(as.numeric(data$Global_active_power), col="red", main="Global Active Power"
     ,xlab="Global Active Power (kilowatts)")

##creating PNG file
dev.copy(png, file = "plot1.png") 
dev.off() 