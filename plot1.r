library("data.table")

#Set directory
setwd("C:\\datasciencecoursera\\Assignment4")

#Reads in data from file then subsets data for specified dates
plotdataset <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?"
)

# Prevents histogram from printing in scientific notation
plotdataset[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

# Change Date Column to Date Type
plotdataset$Date <- as.Date(plotdataset$Date, format="%d/%m/%Y")

# Filter Dates for 2007-02-01 and 2007-02-02
plotdataset <- plotdataset[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

png("plot1.png", width=480, height=480)

## Produce Plot 1
hist(plotdataset[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()