
# For removing all objects in one go
rm(list = ls())


setwd('E:/softwares/RCodes')
college = read.csv("College.csv")
fix(college)
rownames(college) = college[,1]
fix(college)
attach(college)

summary(college)

pairs(college[,1:10])

plot(Private,Outstate)

# creating Elite variable to bin top10%
Elite = rep("No",nrow(college))
Elite[Top10perc>50] = "Yes"
Elite = as.factor(Elite)
college = data.frame(college,Elite)
summary(college)

plot(Elite,Outstate)

colnames(college)
         
par(mfrow = c(1,1))
hist(Top10perc)
            

# Exercise 2
Auto = read.csv("Auto.csv",na.string = "?")
attach(Auto)
str(Auto)
range(mpg)
range(Auto[,4],na.rm=TRUE)

mean(mpg)
sd(mpg)

Auton = Auto[-c(10:85),-9]

apply(Auton,2,range,na.rm=TRUE)
apply(Auton,2,mean,na.rm=TRUE)
apply(Auton,2,sd,na.rm=TRUE)

plot (mpg,cylinders)
pairs(Auto[,c(1,2,3)])
cor(Auton)

Autod = data.frame(Auto[,-9])
Autod[is.na(Autod)] = 0
cor(Autod)


#3rd exercise

library(MASS)
Boston = Boston
attach(Boston)
dim(Boston)
rownames(Boston)
colnames(Boston)
?Boston

head(Boston)
pairs(Boston[,1:4])
pairs(Boston[,5:8])
pairs(Boston[,9:12])
pairs(Boston[,13:14])

plot(Boston[,1])

hist(Boston[,1])
str(chas)
chas = as.factor(chas)
summary(chas)
plot(crim,main = "Crim")
plot(tax,main = "tax")
plot(ptratio,main = "ptratio")
plot(tax,crim,main = "Crimvstax")

Boston[,"tax"]

median(ptratio)

plot(age,medv)

sad = subset()

rm = as.factor(rm)
summary(rm)
Boston[,"rm"]
sads = subset(Boston,rm>7)
sads[,"rm"]

sade = subset(Boston,rm>8)
sade[,"rm"]



# Linear regression exercises

Auto = read.csv("Auto.csv",na.string = "?")
attach(Auto)

head(Auto)
colnames(Auto)

Auto_lm = lm(mpg ~ horsepower)
summary(Auto_lm)
names(Auto_lm)

confint(Auto_lm,conf = 0.9)
predict(Auto_lm,interval = "prediction")


plot(horsepower,mpg)
abline(Auto_lm,col = "red",lwd = 3)

par(mfrow = c(1,1))
plot(Auto_lm)


pairs(Auto[,-9])
Autod = data.frame(Auto[,-9])
Autod[is.na(Autod)] = 0

plot(cor(Autod))



colnames(Autod)
Auto_lm2 = lm(mpg ~ cylinders+displacement+horsepower+weight+acceleration+
                year+origin )

summary(Auto_lm2)
names(Auto_lm2)
vif(Auto_lm2)
Auto_lm2$coef
plot(Auto_lm2)

colnames(Auto)

acc_l = log(acceleration)
acc_r = sqrt(acceleration)
acc_s = (acceleration)^2

Autot = data.frame(Auto,acc_l,acc_r,acc_s)
head(Autot)
pairs(Auto)
plot(mpg,acceleration)
plot(mpg,acc_l)
plot(mpg,acc_r)
plot(mpg,acc_s)


# Exercise - linear
library(ISLR)
Carseats = Carseats
attach(Carseats)
head(Carseats)

Car_lm = lm(Sales ~ Price +Urban + US)
summary(Car_lm)
names(Car_lm)
Car_lm$coef

Car_lm2 = lm(Sales ~ Price + US)
summary(Car_lm2)
confint(Car_lm2)


















