#Downloading files

file <- "C:/Users/Nikita Karetnikov/Documents/household_power_consumption.txt"
df <- read.table(file, header = TRUE, sep = ';', stringsAsFactors = FALSE)
df1 <- df[which((df[,1] == '1/2/2007')|(df[,1] == '2/2/2007')),]

df1$Global_active_power <- as.numeric(df1$Global_active_power)

#first
hist(df1$Global_active_power, col = "red", main = "Global Active Power", ylab = "Frequency", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file="C:/Users/Nikita Karetnikov/Documents/ploct1.png", height=480, width=480)

dev.off()