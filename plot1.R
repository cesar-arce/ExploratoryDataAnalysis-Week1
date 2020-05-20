library("data.table")

setwd("D:/Cesar/0JohnsHopkins/4-ExploratoryDataAnalysis/Week1")
## file.choose()   another way to set setwd()

## Reads in data from file then subsets data for specified dates

    ## Actions required
    ## 1. read the household_power_consumption.txt file
    ## 2. Subset data we will only be using data from the dates 2007-02-01 and 2007-02-02
    ## 3. Generate histogram of global active power (Kilowatts)
    
    ## Assumes household_power_consumption.txt file located in working Dir
    
    ## read data
    powerdata <- read.table("household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";"  )
    
    ## Change class of all columns to correct class
    powerdata$Date <- as.Date(powerdata$Date, format="%d/%m/%Y")  ## Date in format dd/mm/yyyy
    powerdata$Time <- format(powerdata$Time, format="%H:%M:%S")   ## time in format hh:mm:ss
    powerdata$Global_active_power <- suppressWarnings(as.numeric(powerdata$Global_active_power))  ## household global minute-averaged active power (in kilowatt)
    powerdata$Global_reactive_power <- suppressWarnings(as.numeric(powerdata$Global_reactive_power))  ## household global minute-averaged reactive power (in kilowatt)
    powerdata$Voltage <- suppressWarnings(as.numeric(powerdata$Voltage))  ## minute-averaged voltage (in volt)
    powerdata$Global_intensity <- suppressWarnings(as.numeric(powerdata$Global_intensity))  ## household global minute-averaged current intensity (in ampere)
    powerdata$Sub_metering_1 <- suppressWarnings(as.numeric(powerdata$Sub_metering_1)) ## energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
    powerdata$Sub_metering_2 <- suppressWarnings(as.numeric(powerdata$Sub_metering_2)) ## energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
    powerdata$Sub_metering_3 <- suppressWarnings(as.numeric(powerdata$Sub_metering_3)) ## energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.
    
    ## We will only be using data from the dates 2007-02-01 and 2007-02-02.
    subsetdata <- subset(powerdata, Date == "2007-02-01" | Date =="2007-02-02") 
    
    ## plot histogram of global active power for those 2 days
    png("plot1.png", width=480, height=480)
    hist(subsetdata$Global_active_power, border="black", main ="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
    dev.off()
