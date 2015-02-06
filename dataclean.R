#getting data and cleaning data

#quiz1
#question 3
if (!file.exists("data")) {
  dir.create("data")
}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileUrl, destfile = "./data/data.xlsx")
list.files("./data")


library(xlsx)
dat <- read.xlsx("./data/getdata_data_DATA.gov_NGAP.xlsx",sheetIndex=1,header=T,
                 colIndex=7:15,
                 rowIndex=18:23)



