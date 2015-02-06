#getting data and cleaning data

#quiz1
#question 3
if (!file.exists("data")) {
  dir.create("data")
}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileUrl, destfile = "./data/data.xlsx",mode="wb" )
list.files("./data")

library(xlsx)
dat <- read.xlsx("./data/getdata_data_DATA.gov_NGAP.xlsx",sheetIndex=1,header=T,
                 colIndex=7:15,
                 rowIndex=18:23)
sum(dat$Zip*dat$Ext,na.rm=T) 


#lecture
library(XML)
fileUrl <- "http://www.w3school.com.cn/example/xmle/simple.xml"
doc <- xmlTreeParse(fileUrl,useInternal=TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)
names(rootNode)
rootNode[[1]]
rootNode[[1]][[1]]
rootNode[[1]][[2]]

xmlSApply(rootNode,xmlValue)
xpathSApply(rootNode,"//food",xmlValue)
xpathSApply(rootNode,"//name",xmlValue)
xpathSApply(rootNode,"//price",xmlValue)

fileUrl <- "http://espn.go.com/nfl/team/_/name/bal/baltimore-ravens"
doc <- htmlTreeParse(fileUrl,useInternal=TRUE)
scores <- xpathSApply(doc,"//li[@class='score']",xmlValue)
teams <- xpathSApply(doc,"//li[@class='team-name']",xmlValue)
scores

#question 4
library(XML)
fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc <- xmlTreeParse(fileUrl,useInternal=TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)
names(rootNode)



table(xpathSApply(rootNode,"//zipcode",xmlValue))


#lecture jsonlite
library(jsonlite)
jsonData <- fromJSON("https://api.github.com/users/jtleek/repos")
names(jsonData)
names(jsonData$owner)
jsonData$owner$login

#Writing data frames to JSON
myjson <- toJSON(iris, pretty=TRUE)
cat(myjson)

#Convert back to JSON
iris2 <- fromJSON(myjson)
head(iris2)
