## Calls another script to make sure dataset is in place
source("loaddataset.R")

## PM25 in Baltimore City
datasetSubsset <- datasetSummarySCC[datasetSummarySCC$fips == "24510", ] 

## Decrease type in Baltimore City
library(ggplot2)
datasetEmissions <- aggregate(datasetSubsset$Emissions, list(datasetSubsset$year), FUN = "sum")
png(filename = "./plot3.png", 
    width = 480, height = 480, 
    units = "px")
datasetPlot <- ggplot(datasetSubsset, aes(year, Emissions, color = type))
datasetPlot + geom_line(stat = "summary", fun.y = "sum") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle("Total Emissions in Baltimore City from 1999 to 2008")
dev.off()