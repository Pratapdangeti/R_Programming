

rm(list = ls())

setwd("/home/pratapdangeti/Documents/softwares/RCodes/ISLR")


library(MASS)
library(ISLR)

fix(Boston)
names(Boston)
lm.fit = lm(medv~lstat,data=Boston)
attach(Boston)
lm.fit = lm(medv~lstat)
lm.fit
summary(lm.fit)
names(lm.fit)
confint(lm.fit)

predict(lm.fit,data.frame(lstat=(c(5,10,15))),interval="confidence")
predict(lm.fit,data.frame(lstat=(c(5,10,15))),interval="prediction")


plot(lstat,medv)
abline(lm.fit,lwd=3,col="red")

plot(lstat,medv,pch=20)
plot(lstat,medv,pch="+")


par(mfrow=c(2,2))
plot(lm.fit)

plot(predict(lm.fit),residuals(lm.fit))
plot(predict(lm.fit),rstudent(lm.fit))
plot(hatvalues(lm.fit))
which.max(hatvalues(lm.fit))

par(mfrow=c(1,1))




















