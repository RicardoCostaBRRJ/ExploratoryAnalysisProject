## Calls another script to make sure dataset is in place
source("loaddataset.R")

## Read summarized data from dataset
message("Please wait while loading the datasets.")
datasetSummarySCC <- readRDS(datasetRDS1)
datasetSourceClass <- readRDS(datasetRDS2)
message("Datasets are all set. Moving forward with the script")

## PM25 in Baltimore City
datasetSubsset <- datasetSummarySCC[datasetSummarySCC$fips == "24510" | datasetSummarySCC$fips == "06037", ]

## Plot6.png
png(filename = "./plot6.png", 
    width = 480, height = 480, 
    units = "px", bg = "transparent")
datasetMotor <- grep("motor", datasetSourceClass$Short.Name, ignore.case = T)
datasetMotor <- datasetSourceClass[datasetMotor, ]
datasetMotor <- datasetSubsset[datasetSubsset$SCC %in% datasetMotor$SCC, ]

datasetPlot6 <- ggplot(datasetMotor, aes(year, Emissions, color = fips))
datasetPlot6 + geom_line(stat = "summary", fun.y = "sum") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle("Comparison of Total Emissions From Motor\n Vehicle Sources in Baltimore City\n and Los Angeles County from 1999 to 2008") +
  scale_colour_discrete(name = "Group", label = c("Los Angeles","Baltimore"))
dev.off()