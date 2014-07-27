## Loads all required libraries (data.table & reshape2)

if (!require("plyr")) {
  install.packages("plyr")
  library("plyr")
  message("Required plyr package is now in place.")
} else {
  message("Required plyr package is already in place.")
}
if (!require("ggplot2")) {
  install.packages("ggplot2")
  library("ggplot2")
  message("Required ggplot2 package is now in place.")
} else {
  message("Required ggplot2 package is already in place.")
}
if (!require("data.table")) {
  install.packages("data.table")
  library("data.table")
  message("Required data.table package is now in place.")
} else {
  message("Required data.table package is already in place.")
}

## Tests if dataset was downloaded and unziped
## If can't find the unziped dataset, it unzips the downloaded zip file
## If can't find the unziped dataset, nor the zip file itself, it downloads and unzips it

workingDir <- getwd()
datasetFile <- paste0(workingDir,"/exdata-data-NEI_data.zip")
datasetRDS1 <- paste0(workingDir,"/summarySCC_PM25.rds")
datasetRDS2 <- paste0(workingDir,"/Source_Classification_Code.rds")
if (file.exists(datasetRDS1) & file.exists(datasetRDS2)) {
  message("Dataset is already in place.")
  message("All set. Moving forward with the script.")
} else {
  message("Unziped dataset not detected.")
  if (!file.exists(datasetFile)){
    message("Ziped dataset wasn't found. Please wait while it is downloaded and unziped.")
    TempFile <- tempfile()
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip",TempFile, method="curl")
    unzip(TempFile)
    unlink(TempFile)
    message("All set. Moving forward with the script.")
  } else {
    message("Ziped dataset was found. Unziping its content. Please wait.")
    unzip(datasetFile)
    message("All set. Moving forward with the script.")
  }
}