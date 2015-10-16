

setwd('/home/pratapdangeti/Documents/softwares/RCodes')
library(ISLR)
library(tree)
library(nutshell)
??nutshell
install.packages("nutshell.bbdb")
install.packages("nutshell.audioscrobbler")


# 25 Recipes book

help(lm)
?lm
# shows arguments of the functions
args(lm)
#shows the sample example where function has been used
example(lm)

example(mean)

# Links available for all the installed documents

help.start()



rdt = read.table("DietWeigthLoss.txt",header = TRUE)
head(rdt)
args(read.table)


rdc = read.csv("College.csv",header = TRUE)
head(rdc)
attach(rdc)

str(rdc)
args(read.csv)

# as.is = TRUE for not converting non numeric values into Factor automatically 

rdc = read.csv("College.csv",header = TRUE,as.is = TRUE)
head(rdc)


# Computing basic statistics

x = c(0,1,1,2,3,5,8,13,21,34)

mean(x)
median(x)
sd(x)
var(x)

y = log(x+1)

cor(x,y)
cov(x,y)

# Handling NA values
x = c(0,1,1,2,3,NA)
mean(x)
mean(x,na.rm = TRUE)

sd(x,na.rm = TRUE)
 

# for aseembling vectors and/or factors

dfrm = data.frame(v1,v2,v3,f1,f2)

# for assembling  data if captured in a list that contains vectors and/or factors
dfrm = as.data.frame (list.of.vectors)



dfrm = data.frame(p1=pred1,p2=pred2,p3=pred3,r=resp)


# saving in list

lst = list(p=pred1,p2=pred2,p3=pred3,r=resp)

as.data.frame(lst)

rm(abc)
# returns the column
rdc[[2]]
# returns the dataframe consisting one column
rdc[2]

rdc[c(2,3)]


rdc[,2]
rdc[[2]]
rdc[,c(2:4)]

# forces R to return a data frame

rdc[,2,drop = FALSE]


# selecting columns by name

# retuns only one column
rdc[["Private"]]
rdc$Private

# following returns the data frame

rdc[,"Private"]
head(rdc)

rdc[,c("Private","Apps")]



# Have sample from population, but we would like to calculate confidence interval for the population's mean
x = rnorm(50,mean=100,sd=15)
t.test(x)


# predicting population mean at 99 %
t.test(x,conf.level = 0.99)

# forming confidence interval for proportion

prop.test(6,9)

prop.test(6,9,conf.level = 0.99)


# have one sample each from two populations. want to know if 2 populations
# could have the same mean

t.test(Top10perc,Top25perc)

t.test(x,y,paired = TRUE)


# Testing correlation for significance
# pearson was by default
cor.test(Top10perc,Top25perc)

# for spearman method - no normal population assumption is required
cor.test(Top10perc,Top25perc,method = "spearman")


# creating a scatter plot

plot(Top10perc,Top25perc)

plot(Top25perc,Top10perc)



# creating bar plot
barplot(Top10perc)
barplot(Top10perc,Top25perc)
barplot(Top25perc,Top10perc)


head(rdc)

tops = tapply(rdc$Top10perc,rdc$Private,mean)
barplot(tops)
text(tops)


# Histogram


data(Cars93,package="MASS")
hist(Cars93$MPG.city)
head(Cars93)


hist(Cars93$MPG.city,20)

# Multiple linear regression
attach(Cars93)
cmodel = lm(MPG.city ~ Weight+Length,data = Cars93)
summary(cmodel)

install.packages("car")

library(car)
outlier.test(cmodel)

plot(cmodel)

# predicting new values
preds = data.frame(Weight=4000,Length=200)
predict(cmodel,newdata =preds)

install.packages("nutshell")


















































