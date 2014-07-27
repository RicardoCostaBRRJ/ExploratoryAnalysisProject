## Calls another script to make sure dataset is in place
source("loaddataset.R")

## PM25 in Baltimore City
datasetSubsset <- datasetSummarySCC[datasetSummarySCC$fips == "24510", ] 

## PM25 in Baltimore City
png(filename = "./plot2.png", 
    width = 480, height = 480, 
    units = "px")
datasetEmissions <- aggregate(datasetSubsset$Emissions, list(datasetSubsset$year), FUN = "sum")
plot(datasetEmissions, type = "l", xlab = "Year", 
     main = "Total Emissions in Baltimore City from 1999 to 2008", 
     ylab = expression('Total PM'[2.5]*" Emission"))
dev.off()