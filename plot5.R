## Calls another script to make sure dataset is in place
source("loaddataset.R")

## Read summarized data from dataset
message("Please wait while loading the datasets.")
datasetSummarySCC <- readRDS(datasetRDS1)
datasetSourceClass <- readRDS(datasetRDS2)
message("Datasets are all set. Moving forward with the script")

## PM25 in Baltimore City
datasetSubsset <- datasetSummarySCC[datasetSummarySCC$fips == "24510", ]

## Plot5.png
png(filename = "./plot5.png", 
    width = 480, height = 480, 
    units = "px")
datasetMotor <- grep("motor", datasetSourceClass$Short.Name, ignore.case = T)
datasetMotor <- datasetSourceClass[datasetMotor, ]
datasetMotor <- datasetSubsset[datasetSubsset$SCC %in% datasetMotor$SCC, ]
motorEmissions <- aggregate(datasetMotor$Emissions, list(datasetMotor$year), FUN = "sum")
plot(motorEmissions, type = "l", xlab = "Year", 
     main = "Total Emissions From Motor Vehicle Sources\n from 1999 to 2008 in Baltimore City", 
     ylab = expression('Total PM'[2.5]*" Emission"))
dev.off()