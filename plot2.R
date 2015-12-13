

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

# Plot 2
with(data.selected, plot(Time, Global_active_power, 
                         type="l",
                         xlab="",
                         ylab="Global Active Power (in kilowatts)",
                         cex.lab=0.7, cex.axis=0.8))

# create png2
dev.copy(png,'plot2.png',  width = 480, height = 480)
dev.off()