
setwd('/home/pratapdangeti/Documents/softwares/RCodes')
list.files()
FNO <- read.csv("FNO.CSV")
head(FNO)
str(FNO)

cmnth <- subset(FNO,SYMBOL == "BANKNIFTY",select = c("SYMBOL"))
cmnth
cmnth <- head(subset(FNO,HIGH > 0,select = c("SYMBOL","HIGH")))
cmnth

cmnth <- subset(FNO,EXPIRY_DT == "26-Feb-2015",select = c("SYMBOL","EXPIRY_DT"))
cmnth



