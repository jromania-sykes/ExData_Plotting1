plot2<-function(){
    # preprocess file with grep to only bring in data for days we will use

    df<-read.csv(pipe('grep ^[12]/2/2007 household_power_consumption.txt'),sep=';')
    # set column names
    colnames(df)<-c('Date','Time','Global_active_power','Global_reactive_power','Voltage','Global_intensity','Sub_metering_1','Sub_metering_2','Sub_metering_3')
    #combine date and time columns into a datetime column
    df$DateTime <- as.POSIXct(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")
    #create png device
    png('~/datascience/ExData_Plotting1/plot2.png',width=480,height=480)
    #draw plot
    plot(df$DateTime,df$Global_active_power,type='l',ylab='Global Active Power (kilowatts)',xlab='')
    dev.off()
}