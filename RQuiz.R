


setwd('/home/pratapdangeti/Documents/softwares/RCodes')

#Importing datasets

datasets <- read.csv("http://www.biostat.jhsph.edu/~rpeng/coursera/selfquiz/selfquiz-data.csv")


# Column names
names(datasets)
colnames(datasets)
                     
# Row names

row.names(datasets)
rownames(datasets)


# Extract first 6 rows and print

head(datasets,6)
print(datasets[1:6,])

# no.of rows in dataset
nrow(datasets)

# last 6 rows
tail(datasets)

n <- nrow(datasets) 
print(datasets[(n-6+1):n,])


# How many missing values are in Ozone variable
miss <- is.na(datasets[,"Ozone"])
sum(miss)


# Mean of ozone value
mean(datasets[,"Ozone"],na.rm = TRUE)

use <- !is.na(datasets[,"Ozone"])
mean(datasets[use,"Ozone"])

# Subset values with Ozone values are above 31 
# and Temp values are above 90
subset(datasets,Ozone > 31 & Temp >90)
subset(datasets,Ozone > 31 | Temp >90)


# Use loop to create a vector of length 6 containing the mean
# of each column in data frame

m <- numeric(6)
print(m)

for (i in 1:6) {
m[i] <- mean(datasets[,i],na.rm = TRUE)  
  
}
print (m)

# Using apply funtion calculate the mean and sd for all columns

s <- apply(datasets,2,mean,na.rm= TRUE)
print(s)

sd <- apply(datasets,2,sd,na.rm = TRUE)
print(sd)

# Calculate mean of Ozone for each month in data frames

tapply(datasets$Ozone,datasets$Month,mean,na.rm = TRUE)

# Draw a random sample of 5 rows from data frame
set.seed(1)
datasets[sample(nrow(datasets),5),]


# Introduction to R from Abbas Al Sharif

Auto = read.csv("Auto.csv",na.string = "?")
attach(Auto)
head(Auto)

Auto = na.omit(Auto)
names(Auto)

# Graphics

plot(cylinders,mpg)
boxplot(cylinders,mpg)

cylinders_factor = as.factor(cylinders)

plot(cylinders_factor,mpg,
     xlab= "cylinders",
     ylab = "mpg",
     main="This is Boxplot")



#Statistics cases

# Binomial distribution with n=20 trails probability of success p = 1/6
dbinom(x=3,size = 20,prob = 1/6)

dbinom(x=0:3,size = 20,prob = 1/6)

# P (X<=3)

sum(dbinom(x=0:3,size = 20,prob = 1/6))
pbinom(q=3,size = 20,prob=1/6,lower.tail = TRUE)

# rbinom - to take sample from binomial distribution
# qbinom - to find quantiles for binomial distribution


# Poisson distribution with a known rate of Lambda = 7
# dpois - to find values for the probability density function of X

dpois(x=4,lambda=7)

# from x = 0 .. 4
dpois(x=0:4,lambda = 7)

# P(x <=4)
sum(dpois(x=0:4,lambda = 7))

#ppois
ppois(q=4,lambda=7,lower.tail = TRUE)

# P (x >=12)

ppois(q=12,lambda = 7,lower.tail = FALSE)

#rpois - to take random sample from POISSON distribution
#qpois - to find quantiles for POISSON distribution



# Normal distribution Mean = 75 and std.dev = 5

# P(x <= 70)
pnorm(q=70,mean=75,sd=5,lower.tail = TRUE)

pnorm(q=70,mean=75,sd=5)

# P(x >= 85)
pnorm(q=85,mean = 75,sd=5,lower.tail = FALSE)

# P(z >= 1)
pnorm(q=1,mean=0,sd=1,lower.tail = FALSE)
pnorm(q=1,mean=0,sd=1,lower.tail = FALSE)

# find Q1
qnorm(p=0.25,mean=75,sd=5,lower.tail = TRUE)

x <- seq(from=55,to=95, by = 0.25)
x

dens <- dnorm(x,mean = 75,sd=5)
plot(x,dens)
plot(x,dens,type = "l")
plot(x,dens,type="l",main = "X-Normal: Mean = 75, SD =5",xlab = "x",ylab = "Probability Density", las = 1)
abline(v=75)

rand <-rnorm(n=40, mean=75,sd=5)
hist(rand)

# t distribution
# t-stat = 2.3, df = 25
# P(t>2.3)

pt(q=2.3,df=25,lower.tail = FALSE)

#two sided pvalue

pt(q=2.3,df=25,lower.tail = FALSE)+pt(q=-2.3,df=25,lower.tail = TRUE)

pt(q=2.3,df=25,lower.tail=FALSE)*2

#find t value for 95% condifence
#value of t with 2.5% in each tail

qt(p=0.025,df=25,lower.tail=TRUE)

# pf and pexp commands


# One-sample t test in R


library(boot)
gravty<-gravity
plot(gravty$g)

# one-sided 95% 
idence interval for mu

t.test(gravty$g,mu = 75,alternative="less",conf.level =0.95)


t.test(gravty$g,mu = 75,alt="less",conf =0.95)

#two-sided 
t.test(gravty$g,mu = 75,alt="two.sided",conf =0.95)


t.test(gravty$g,mu = 75,conf=0.95)

test <-t.test(gravty$g,mu = 75,conf=0.99)
attributes(test)

#Two-sample t test in R: Independent groups

kidney <- kidney
boxplot(kidney$frail ~ kidney$sex)

# two-sided test
# Ho: Mean of frail of men = women
#assume non-equal variances

t.test(kidney$frail ~ kidney$sex,mu = 0,alt ="two.sided",conf = 0.95,var.eq = F, paired = F)

t.test(kidney$frail ~ kidney$sex)


t.test(kidney$frail[kidney$sex==1],kidney$frail[kidney$sex==2])

# equal variances
t.test(kidney$frail ~ kidney$sex,mu = 0,alt ="two.sided",conf = 0.95,var.eq = TRUE, paired = F)

# checking variances
var(kidney$frail[kidney$sex==1])
var(kidney$frail[kidney$sex==2])



# Paired t-test
setwd('E:/softwares/RCodes')

Bpres < - read.delim("BloodPressure.txt")

BloodPressure= read.table("BloodPressure.txt",header = T, sep = "\t")

head(BloodPressure)

boxplot(Before,After)
plot(Before,After)
abline(a=0,b=1)

#Ho: Mean difference in SBP is 0
#two sided test
t.test(Before,After,mu=0,alt="two.sided",paired = T,conf.level = 0.99)


# ANOVA
Diet= read.table("DietWeigthLoss.txt",header = T, sep = "\t")
head(Diet)
summary(Diet)
boxplot(Diet$WeightLoss ~ Diet$Diet)


aov(Diet$WeightLoss ~ Diet$Diet)

anv1 = aov(Diet$WeightLoss ~ Diet$Diet)
anv1

summary(anv1)
attributes(anv1)

anv1$coefficients

TukeyHSD(anv1)
plot(TukeyHSD(anv1))

plot(TukeyHSD(anv1),las=1)

# Kruskal Wallies One - way ANOVA is non -parametric equivalent to the one way ANOVA

kruskal.test(Diet$WeightLoss ~ Diet$Diet)


# Chi-square test, Fischers test and Cross tabulation

Lungcap = read.table("LungCapData.txt",header = T, sep = "\t")

head(Lungcap)
summary(Lungcap)
      
# LungCap Age Height Smoke Gender Caesarean

tab = table(Lungcap$Gender,Lungcap$Smoke)
tab
barplot(tab, beside = T,legend = T)

chi = chisq.test(tab,correct = T)
chi
attributes(chi)

chi$expected

fisher.test(tab,conf.int = T, conf.level = 0.99)


# Correlation and covariance 
Lungcapd = read.table("LungCapData.txt",header = T, sep = "\t")
attach(Lungcapd)
summary(Lungcap)
plot(Age,LungCap,main = "Scatterplot",las =1)

cor(Age,LungCap,method="pearson")
cor(Age,LungCap,method="pearson") 

cor(Lungcap$Age,Lungcap$LungCap)

cor(Lungcap$Age,Lungcap$LungCap,method="spearman")

cor(Lungcap$Age,Lungcap$LungCap,method="kendall")


cor.test(Age,LungCap,method="pearson")
cor.test(Lungcap$Age,Lungcap$LungCap,method="spearman")

cor.test(Lungcap$Age,Lungcap$LungCap,method="spearman",exact=F)
cor.test(Lungcap$Age,Lungcap$LungCap,method="pearson",alt = "greater",conf.level = 0.99)


cov(Age,LungCap)
pairs(Lungcapd)
# Need to verify
cor(Lungcapd[,1:3])


# Linear regression
colnames(Lungcapd)

plot(Age,LungCap,main = "Scatterplot")

cor(Age,LungCap)

mod <- lm(LungCap ~ Age)
summary(mod)

attributes(mod)

mod$coefficients
mod$coef
coef(mod)


plot(Age,LungCap,main = "Scatterplot")
abline(mod)
abline(mod,col=2,lwd=3)

confint(mod)
confint(mod,level = 0.99)
summary(mod)
anova(mod)

# Checking linear regression assumptions

plot(Age, LungCap)
mod <- lm(LungCap~Age)
summary(mod)

abline(mod)
#1Assmptn - Y values (or errors) are independent
#2Assmptn- Y values can be expressed as a linear function of X
#3Assmptn- Variation of obs around regression line is constant (homoscedasticity)
#4Assmptn- For given value of X,Y values are normally distributed

plot(mod)
# To see all 4 graphs in one window
par(mfrow=c(2,2))
plot(mod)

par(mfrow=c(1,1))

# non-constant variance

# Multiple linear regression in R

model1 <- lm(LungCap ~ Age + Height)
summary(model1)

cor(Age,Height,method = "pearson")

confint(model1,conf.level = 0.95)

model2 <- lm(LungCap ~ Age+Height+Smoke+Gender+Caesarean)
summary(model2)

plot(model2)


# Dummy variables or indicator variables
# create a variable of all 0's to store the categorical heights in
CatHeight <- rep(0, 725)
# run through a look, checking each row/value for height
for (i in 1:725){
  # if the height of person i is less than 50, then assign a value of "A" to the categorical height for person i
  if (Height[i]<50){CatHeight[i] <- "A"}
  # if the height of person i is less than 55 and greater/equal to 50, assign a value of "B" to the categorical height for person i
  if (Height[i]<55 & Height[i]>=50){CatHeight[i] <- "B"}
  # same for the rest...
  if (Height[i]<60 & Height[i]>=55){CatHeight[i] <- "C"}
  if (Height[i]<65 & Height[i]>=60){CatHeight[i] <- "D"}
  if (Height[i]<70 & Height[i]>=65){CatHeight[i] <- "E"}
  if (Height[i]>=70){CatHeight[i] <- "F"}
}


#CatHeight <- factor(CatHeight,order=T,levels=c("F","E","D","C","B","A"))

Lungcapd <- data.frame(Lungcapd,CatHeight)
head(Lungcapd)

levels(Smoke)
levels(CatHeight)
str(Lungcapd)
mean(LungCap[CatHeight=="A"])
mean(LungCap[CatHeight=="B"])
mean(LungCap[CatHeight=="C"])
mean(LungCap[CatHeight=="D"])
mean(LungCap[CatHeight=="E"])
mean(LungCap[CatHeight=="F"])

mod <- lm(LungCap ~ CatHeight)

summary(mod)

head(Lungcapd)






















































































































































