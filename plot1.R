##reading data from file
file<-"household_power_consumption.txt"
dataset<-read.table(file, sep=";",header=TRUE, dec=".", colClasses="character")

##creating subset of data
data<-dataset[dataset$Date %in% c("1/2/2007","2/2/2007"),] 

##creating PNG file
png("plot1.png", width = 480, height = 480, units = "px", pointsize = 12)

##plotting data for this subset of specific dates
par(mfrow=c(1,1),mar=c(4,4,2,2),ps=12)
hist(as.numeric(data$Global_active_power), col="#FF2500", 
     main="Global Active Power",xlab="Global Active Power (kilowatts)")

##closing PNG file
dev.off() 