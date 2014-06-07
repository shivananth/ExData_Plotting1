##reading data
data1<-read.table("E:/shiva/R work/household_power_consumption.txt",sep=";",header=TRUE)

##changing the format of date column from factor to character
data1$date_char<-as.character(data1$Date)

##subsetting for required data
req_data<-data1[which((data1$date_char=="2/2/2007") | (data1$date_char=="1/2/2007")),]


## cleaning the date and time columns
for(i in 1:nrow(req_data)){
  req_data$date_edt[i]<-as.Date(paste(strsplit(req_data$date_char[i],"/")[[1]][3],
                                      strsplit(req_data$date_char[i],"/")[[1]][2],
                                      strsplit(req_data$date_char[i],"/")[[1]][1],sep="/"))
}

for(i in 1:nrow(req_data)){
  req_data$Date_edt[i]<-as.Date(req_data$date_edt[i],origin="1970-01-01")
}

for(i in 1:nrow(req_data)){
  req_data$date_time[i]<-paste(paste(strsplit(req_data$date_char[i],"/")[[1]][3],
                                      strsplit(req_data$date_char[i],"/")[[1]][2],
                                      strsplit(req_data$date_char[i],"/")[[1]][1],sep="/"),
                                as.character(req_data$Time[i]),sep=" ")
}

req_data$date_time_final<-as.POSIXct(req_data$date_time)

##plotting the required plot
plot(req_data$date_time_final,as.numeric(as.character(req_data$Global_active_power)),type="l",ylab="Global Active Power(Kilowatts)",xlab="")


##copying to png file
dev.copy(png,"plot2.png")

##closing the device connection
dev.off()
