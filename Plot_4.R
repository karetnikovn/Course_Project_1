#Forth
file <- "C:/Users/Nikita Karetnikov/Documents/household_power_consumption.txt"
df <- read.table(file, header = TRUE, sep = ';', stringsAsFactors = FALSE)
df1 <- df[which((df[,1] == '1/2/2007')|(df[,1] == '2/2/2007')),]

df1$Global_active_power <- as.numeric(df1$Global_active_power)
  #first
  
  par(mfrow=c(2,2),mar=c(4,4,2,1))
  
  df1$Date <- strptime(df1$Date, "%m/%d/%Y")
  
  df1$Datetime <- as.POSIXct(paste(df1$Date, df1$Time), format="%Y-%d-%m %H:%M:%S")
  plot(x = df1$Datetime, y = df1$Global_active_power, type = "l",ylab = "Global Active Power", xlab = "")
  
  #second
  
  df1$Datetime <- as.POSIXct(paste(df1$Date, df1$Time), format="%Y-%d-%m %H:%M:%S")
  plot(x = df1$Datetime, y = df1$Voltage, type = "l",ylab = "Voltage", xlab = "datetime")
  
  #third
  
  plot(x = df1$Datetime, y = df1$Sub_metering_1, type = "l")
  
  lines(x = df1$Datetime, y = df1$Sub_metering_2, type = 'l',col = "red")
  lines(x = df1$Datetime, y = df1$Sub_metering_3, type = 'l',col = "blue")
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty =  1, lwd = 2, bty='n',cex=.6)
  
  #forth
  
  df1$Datetime <- as.POSIXct(paste(df1$Date, df1$Time), format="%Y-%d-%m %H:%M:%S")
  plot(x = df1$Datetime, y = df1$Global_reactive_power, type = "l",ylab = "Global_Reactive_Power", xlab = "datetime")

  
dev.copy(png, file="C:/Users/Nikita Karetnikov/Documents/plot4.png", height=480, width=480)

dev.off()
  
