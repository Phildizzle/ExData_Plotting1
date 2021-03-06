## Fourth plot code:
#Set Working directory and open packages
setwd("C:\\Users\\user1\\Desktop\\Data Science\\4. Exploratory Analysis\\First Assignment")
library("dplyr")
library("lubridate")
library("Cairo")

# Download and unzip the file inside our working directory
fileurl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
dst = 'UCIMachLearnRep.zip'
download.file(fileurl, dst, mode = 'wb')
unzip("UCIMachLearnRep.zip", unzip = "internal")
#List current WD-files to check if everything worked
list.files()

#Read txt.file into "data"
data <- read.table("household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880)

#Clear name rows and irrelevant variables, create numeric variable "V3" 
data <- data %>% mutate(V1 = as.POSIXct(dmy_hms(as.character(paste(V1, V2)))),
                        V3 = as.numeric(as.character(V3)),
                        V4 = as.numeric(as.character(V4)),
                        V5 = as.numeric(as.character(V5)),
                        V7 = as.numeric(as.character(V7)),
                        V8 = as.numeric(as.character(V8)),
                        V9 = as.numeric(as.character(V9))
) %>% select(V1,V3,V4,V5,V7,V8,V9)


#Create dimensions for four chart
par(mfrow = c(2,2))
#First plot
with(data, plot(V1,V3, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
#second plot
with(data, plot(V1,V5, type="l", xlab="Voltage", ylab="datetime"))
#Third plot
with(data, plot(V1,V7, type="n", xlab = "", ylab = "Energy Sub Metering"))
with(data, points(V1,V7, col="black", type="l"))
with(data, points(V1,V8, col="red", type="l"))
with(data, points(V1,V9, col="blue", type="l"))
legend("topright", lty=1, col = c("black", "red", "blue"), 
       legend = c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"))
#Fourth plot
with(data, plot(V1,V4, type="l", xlab = "datetime", ylab = "Global_reactive_power"))

#Export resulting chart into PNG
CairoPNG(filename = "Rplot4.png", width = 480, height = 480, pointsize = 12, bg = "white",  res = NA)
