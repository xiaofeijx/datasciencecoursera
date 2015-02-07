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


#lecture data.table
library(data.table)
DT = data.table(x=rnorm(9),y=rep(c("a","b","c"),each=3),z=rnorm(9))
head(DT,3)

tables()#查看data.table的情况

DT[2,]
DT[DT$y=="a",]
DT[c(2,3)]#subset row

DT[,list(mean(x),sum(z))]

DT[,table(y)]

DT[,w:=z^2] #adding new clumns
DT[,m:={tmp <- (x+z);log2(tmp+5)}]
DT[,a:= x>0]
DT[,b:=mean(x+w),by=a]

set.seed(123);
DT <- data.table(x=sample(letters[1:3], 1E5, TRUE))
DT[, .N, by=x]  #.N为计数

#keys
DT <- data.table(x=rep(c("a","b","c"),each=100), y=rnorm(300))
setkey(DT, x)
DT['a']

#joins
DT1 <- data.table(x=c('a', 'a', 'b', 'dt1'), y=1:4)
DT2 <- data.table(x=c('a', 'b', 'dt2'), z=5:7)
setkey(DT1, x); setkey(DT2, x)
merge(DT1, DT2)
