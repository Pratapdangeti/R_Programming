

rm(list = ls())


# Equivalent SAS functions in R

setwd('/home/pratapdangeti/Documents/softwares/RCodes')
ABC = read.csv("TableABC.CSV")
head(ABC) # For taking a look into top 6 rows
str(ABC) # For looking into structure of data

# Converted factor into character
ABC$Patient = as.character(ABC$Patient)
str(ABC)
# Converted factor into date
ABC$Date <- as.Date(ABC$Date,format = "%d/%m/%Y")
str(ABC)

# Factor -> Character -> Numeric

# Convertint missing values NA into 0
d = as.data.frame(ABC)
d[is.na(d)]= 0
d
head(d)


NABCN <- sapply(ABC,is.numeric)
ABC[,NABCN]
apply(ABC[,NABCN],2,sum,na.rm = TRUE)


# Subsetting
NABC <- subset(ABC,select = c('N','BPD','Calculated_BPD_High','BPD_pct'))
NABC



# Decision trees - Classification trees
library(ISLR)
library(tree)

attach(Carseats)
head(Carseats)
str(Carseats)

range(Sales)

High = ifelse (Sales >= 8, "Yes","No")
Carseats = data.frame(Carseats,High)
Carseats = Carseats[,-1]

set.seed(2)
train = sample(1:nrow(Carseats),nrow(Carseats)/2)
test = -train
training_data = Carseats[train,]
testing_data = Carseats[test,]
testing_High = High[test]

tree_model = tree(High ~. ,training_data )
plot(tree_model)
text(tree_model, pretty = 0)


tree_pred = predict(tree_model,testing_data,type = 'class')
mean(tree_pred != testing_High) # 28.5 %

set.seed(3)
cv_tree = cv.tree(tree_model,FUN = prune.misclass)
names(cv_tree)

plot(cv_tree$size, cv_tree$dev, type = 'b')

# pruning 

pruned_model = prune.misclass(tree_model,best = 9)
plot(pruned_model)
text(pruned_model, pretty = 0)

# checking
tree_pred = predict(pruned_model,testing_data,type = "class")
mean(tree_pred != testing_High) # 23 %


rm(list=ls())

# Decision trees- Regression trees
library(MASS)
library(tree)
attach(Boston)
head(Boston)
tail(Boston)
summary(Boston)
Boston

set.seed(1)
train = sample(1:nrow(Boston),nrow(Boston)/2)
test = -train

training_data = Boston[train,]
testing_data = Boston[test,]
testing_medv = medv[test]


# fit a  tree based on training data

tree_model = tree(medv~., training_data)
tree_model
plot(tree_model)
text(tree_model,pretty =0)

# check how the model is doing using the testing dataset

tree_pred = predict(tree_model,testing_data)
mean((tree_pred-testing_medv)^2)     # 25.04


# cross validation for pruning the tree

cv_tree = cv.tree(tree_model)
names(cv_tree)
plot(cv_tree$size,
     cv_tree$dev,
     type = "b",
     xlab = "Tree Size",
     ylab = "MSE")


which.min(cv_tree$dev)
cv_tree$size[1]

# Prune the tree to size 4

pruned_model = prune.tree(tree_model,best = 4)
plot(pruned_model)
text(pruned_model)

# check the accuracy of the model using testing data
tree_pred = predict(pruned_model,testing_data)
mean((tree_pred-testing_medv)^2)    # 32.22


rm(list = ls())

#Logistic regression

# Step 1: Load data, and run numerical and graphical summaries
library(ISLR)
attach(Smarket)
head(Smarket)
summary(Smarket)
cor(Smarket[,-9])
pairs(Smarket[,-9])

# Step 2: Split the data into training and testing data

training = (Year < 2005)
testing = !training
training_data = Smarket[training,]
testing_data = Smarket[testing,]

Direction_testing = Direction[testing]


#Step 3: Fit a logistic regression model using training data

stock_model = glm(Direction~ Lag1 +Lag2+Lag3+Lag4+Lag5+Volume,
                 data = training_data,family = binomial )

summary(stock_model)


#Step 4: Use the fitted model to do predictions for the test data

model_pred_probs = predict(stock_model,testing_data,type = "response")

model_pred_Direction = rep("Down",252)
model_pred_Direction [model_pred_probs > 0.5] = "Up"

# Step 5: Create the confusion matrix, and compute the misclassification rate

table(model_pred_Direction,Direction_testing)
mean(model_pred_Direction != Direction_testing)



# Linear regression

rm(list = ls ())

# Simple linear regression

library(MASS)
attach(Boston)
names(Boston)

lm.fit = lm(medv ~ lstat)
summary(lm.fit)
plot(lm.fit)

plot(lstat,medv,main = "Scatterplot", xlab = "Lstat", ylab = "Median Value")
abline(lm.fit,col = "red",lwd = 3)



# Multiple linear regression
pairs(Boston[,c(1,3,7)])
lm.fit2 = lm(medv~ lstat+age)
summary(lm.fit2)

lm.fit3 = lm(medv ~.,data = Boston )

summary (lm.fit3)

# Running model without age variable

lm.fit4 = lm(medv ~.-age,data = Boston )

summary (lm.fit4)

#Interaction terms
lm.fit5 = lm(medv ~ lstat*age)
summary(lm.fit5)

lm.fit6 = lm(medv ~ lstat+lstat:age)
summary(lm.fit6)

# Non-linear transformation of Predictors

lm.fit7 = lm(medv~poly(lstat,2))
summary(lm.fit7)

# raise the power and stop when non significant power raises
lm.fit7 = lm(medv~poly(lstat,6))
summary(lm.fit7)


