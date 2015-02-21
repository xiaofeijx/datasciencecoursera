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

#https://rawgit.com/wiki/Rdatatable/data.table/vignettes/datatable-intro-vignette.html


#scraping for web

con = url("http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en")
htmlCode = readLines(con)
close(con)
htmlCode


library(XML)
url <- "http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en"
html <- htmlTreeParse(url, useInternalNodes=T)

xpathSApply(html, "//title", xmlValue)


xpathSApply(html, "//td[@class='gsc_a_c']", xmlValue)


library(httr); 
html2 = GET(url)
content2 = content(html2,as="text")
parsedHtml = htmlParse(content2,asText=TRUE)
xpathSApply(parsedHtml, "//title", xmlValue)

#API
myapp = oauth_app("twitter",
                  key="yourConsumerKeyHere",secret="yourConsumerSecretHere")
sig = sign_oauth1.0(myapp,
                    token = "yourTokenHere",
                    token_secret = "yourTokenSecretHere")
homeTL = GET("https://api.twitter.com/1.1/statuses/home_timeline.json", sig)

json1 = content(homeTL)
json2 = jsonlite::fromJSON(toJSON(json1))
json2[1,1:4]

#quiz question4

#http://biostat.jhsph.edu/~jleek/contact.html
url <- "http://biostat.jhsph.edu/~jleek/contact.html"
htmlCode = readLines(url)
nchar(htmlCode[c(10,20,30,100)])


#quiz question5
df <- read.fwf("getdata-wksst8110.for",skip=4,
               widths=c(-1,9,-5,4,-1,3,-5,4,-1,3,-5,4,-1,3,-5,4,-1,3))

str(df)
sum(df[,4])

#https://github.com/hadley/httr/blob/master/demo/oauth2-github.r


#object.size
object.size(df)
print(object.size(df), units = "Mb")

#reshape
library(reshape2)
mtcars$carname <- rownames(mtcars)
carMelt <- melt(mtcars,id=c("carname","gear","cyl"),
                measure.vars=c("mpg","hp"))
head(carMelt)

cylData <- dcast(carMelt,cyl~variable)
cylData

cylData <- dcast(carMelt,cyl~variable,mean)
cylData

with(InsectSprays,tapply(count,spray,sum))

spIns <- split(InsectSprays$count,InsectSprays$spray)
a <- lapply(spIns,sum)
unlist(a)
library(plyr)
ddply(InsectSprays,.(spray),summarise,sum=sum(count))

#dplyr
library(dplyr)


#quiz 4
if (!file.exists("data")) {
  dir.create("data")
}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv "
download.file(fileUrl, destfile = "./data/q1.csv")
list.files("./data")

mydf <- read.csv("./data/q1.csv",header=T)
str(mydf)

strsplit(names(mydf),split="wgtp")[[123]] 


#queston2

mydf2 <- read.csv("./data/getdata-data-GDP.csv",header = F)
str(mydf2)
mydf3 <- mydf2[6:195,c(5)]
mydf3 <- sub(",","",mydf3) #run two times
mean(as.numeric(mydf3))

#question3

mydf4 <-  mydf2[6:195,c(4,5)]
grep("^United",mydf4$V4)


#question4
mydf5 <- mydf2[6:195,c(1,2,4,5)]
names(mydf5) <- c("countrycode","ranking","countryname","gdp")
str(mydf5)


mydf6 <- read.csv("./data/getdata-data-EDSTATS_Country.csv")
str(mydf6)

mydf7 <- merge(mydf5,mydf6,by.x="countrycode",by.y="CountryCode")

grep("^Fiscal year end: Jun",mydf7$Special.Notes)

#question5
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn) 
class(sampleTimes)
library(lubridate)
yy <- year(sampleTimes)
table(yy)
wd <- wday(sampleTimes[year(sampleTimes)==2012])
table(wd)
