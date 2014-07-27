## Calls another script to make sure dataset is in place
source("loaddataset.R")

## Read summarized data from dataset
message("Please wait while loading the datasets.")
datasetSummarySCC <- readRDS(datasetRDS1)
datasetSourceClass <- readRDS(datasetRDS2)
message("Datasets are all set. Moving forward with the script")

## Plot1.png
png(filename = "./plot1.png", 
    width = 480, height = 480, 
    units = "px")
datasetAggregate <- with(datasetSummarySCC, aggregate(Emissions, by = list(year), sum))
plot(datasetAggregate, type = "l", xlab = "Year", 
     main = "Total Emissions in the United States from 1999 to 2008", 
     ylab = expression('Total PM'[2.5]*" Emission",border="red"))
dev.off()