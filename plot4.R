plot4<-function(){
	# preprocess file with grep to only bring in data for days we will use

	df<-read.csv(pipe('grep ^[12]/2/2007 household_power_consumption.txt'),sep=';')
    # set column names
	colnames(df)<-c('Date','Time','Global_active_power','Global_reactive_power','Voltage','Global_intensity','Sub_metering_1','Sub_metering_2','Sub_metering_3')
    #combine date and time columns into a datetime column
    df$DateTime <- as.POSIXct(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")
    #create png device
    png('~/datascience/ExData_Plotting1/plot4.png',width=480,height=480)
    par(mfrow=c(2,2))
    
    #draw 1st plot
    plot(df$DateTime,df$Global_active_power,type='l',ylab='Global Active Power',xlab='')
 	#draw 2nd plot
    
    plot(df$DateTime,df$Voltage,type='l',ylab='Voltage',xlab='datetime')
    #draw 3rd
    plot(df$DateTime,df$Sub_metering_1,type='l',ylab='Energy sub metering',xlab='')
	#add additional lines
	lines(df$DateTime,df$Sub_metering_2,col='red')
	lines(df$DateTime,df$Sub_metering_3,col='blue')
	#setup the legend
	legend("topright",40,c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),lwd=c(1,1),col=c("black","red","blue"),cex=.7,lty=1,bty='n')
	#4th and final
	plot(df$DateTime,df$Global_reactive_power,type='l',ylab='Global_reactive_power',xlab='datetime')
    dev.off()
}