##reading data
data1<-read.table("E:/shiva/R work/household_power_consumption.txt",sep=";",header=TRUE)

##changing the format of date column from factor to character
data1$date_char<-as.character(data1$Date)

##subsetting for required data
req_data<-data1[which((data1$date_char=="2/2/2007") | (data1$date_char=="1/2/2007")),]

##plotting the required histogram
hist(as.numeric(as.character(req_data$Global_active_power)),col="red",xlab="Global Active Power (Kilowatts)"
     ,main="Global Active Power")

##copying to png file
dev.copy(png,"plot1.png")

##closing the device connection
dev.off()