## Calls another script to make sure dataset is in place
source("loaddataset.R")

## Read summarized data from dataset
message("Please wait while loading the datasets.")
datasetSummarySCC <- readRDS(datasetRDS1)
datasetSourceClass <- readRDS(datasetRDS2)
message("Datasets are all set. Moving forward with the script")

## Plot4.png
png(filename = "./plot4.png", 
    width = 480, height = 480, 
    units = "px")
datasetSourceCoal <- grep("coal", datasetSourceClass$Short.Name, ignore.case = T)
datasetSourceCoal <- datasetSourceClass[datasetSourceCoal, ]
datasetSourceCoal <- datasetSummarySCC[datasetSummarySCC$SCC %in% datasetSummarySCC$SCC, ]

datasetCoalEmissions <- aggregate(datasetSourceCoal$Emissions, list(datasetSourceCoal$year), FUN = "sum")
plot(datasetCoalEmissions, type = "l", xlab = "Year", 
     main = "Total Emissions From Coal Combustion-related\n Sources from 1999 to 2008", 
     ylab = expression('Total PM'[2.5]*" Emission"))

dev.off()