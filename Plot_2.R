
#Downloading files

file <- "C:/Users/Nikita Karetnikov/Documents/household_power_consumption.txt"
df <- read.table(file, header = TRUE, sep = ';', stringsAsFactors = FALSE)
df1 <- df[which((df[,1] == '1/2/2007')|(df[,1] == '2/2/2007')),]

df1$Global_active_power <- as.numeric(df1$Global_active_power)

#second

df1$Date <- strptime(df1$Date, "%m/%d/%Y")


df1$Datetime <- as.POSIXct(paste(df1$Date, df1$Time), format="%Y-%d-%m %H:%M:%S")
plot(x = df1$Datetime, y = df1$Global_active_power, type = "l",ylab = "Global Active Power (kilowatts)", xlab = "")

dev.copy(png, file="C:/Users/Nikita Karetnikov/Documents/plot2.png", height=480, width=480)

dev.off()