
#Downloading files

file <- "C:/Users/Nikita Karetnikov/Documents/household_power_consumption.txt"
df <- read.table(file, header = TRUE, sep = ';', stringsAsFactors = FALSE)
df1 <- df[which((df[,1] == '1/2/2007')|(df[,1] == '2/2/2007')),]

df1$Global_active_power <- as.numeric(df1$Global_active_power)

#third
plot(x = df1$Datetime, y = df1$Sub_metering_1, type = "l")

lines(x = df1$Datetime, y = df1$Sub_metering_2, type = 'l',col = "red")
lines(x = df1$Datetime, y = df1$Sub_metering_3, type = 'l',col = "blue")

legend('topright', legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty =  1)


dev.copy(png, file="C:/Users/Nikita Karetnikov/Documents/plot3.png", height=480, width=480)

dev.off()