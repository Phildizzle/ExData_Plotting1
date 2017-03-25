## First plot ode:
#Set Working directory and open packages
setwd("C:\\Users\\user1\\Desktop\\Data Science\\4. Exploratory Analysis\\First Assignment")
library("dplyr")

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
data <- data %>% select(V3) %>% mutate(V3 = as.numeric(as.character(V3)))

#Create histogram
hist(data$V3, col = "red", main = "Global Active Power", xlab = "Global Active Power (killowatts)", ylab = "Frequency")

#Export resulting chart into PNG
CairoPNG(filename = "Rplot1.png", width = 480, height = 480, pointsize = 12, bg = "white",  res = NA)
