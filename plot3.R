

# read source data
data <- read.table("./household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")

# data from the dates 2007-02-01 and 2007-02-02
data.selected <- data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]

# convert the Date to Date class
data.selected$Date <- as.Date(data.selected$Date, format="%d/%m/%Y")
str(data.selected)

# convert the Time variable to Time class
data.selected$Time <- strptime(paste(data.selected$Date, data.selected$Time), format="%Y-%m-%d %H:%M:%S")
str(data.selected)

# Plot 3
plot(data.selected$Time, data.selected$Sub_metering_1, 
     type="l", ylab="Energy sub metering", cex.lab=0.7)

# add other submeterings as separate lines
lines(data.selected$Time, data.selected$Sub_metering_2, col="red")
lines(data.selected$Time, data.selected$Sub_metering_3, col="blue")

# annotate the graph with a legend
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1,1), col=c("black","red", "blue"), cex=0.8)

# create png3
dev.copy(png,'plot3.png',  width = 480, height = 480)
dev.off()