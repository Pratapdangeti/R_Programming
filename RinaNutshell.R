
install.packages("nutshell")
rm(list=ls())
library(nutshell)

b = c(1:7)
b[1:3]
b[b%%3==0]
#odd and even numbers
b[b%%2==0]
b[b%%2==1]

b[c(1,3)]
b[c(5,3)]

b%%3==0

# Array

abc = array(c(1,2,3,4,5,6,7,8,9,10,11,12),dim = c(3,4))
abc

mat = matrix(data = c(1,2,3,4,5,6,7,8,9,10,11,12),nrow = 3, ncol =4)
mat

w <- array(c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18),dim=c(3,3,2))
w

abc
abc[1,2]

# data frame

teams = c("PHI","NYM","FLA","ATL","WSN")
w = c(92,89,94,72,59)
l = c(70,73,77,90,102)
nleast = data.frame(teams,w,l)
nleast
nleast$w
nleast$teams == "FLA"
nleast$l[nleast$teams == "FLA"]

# Class function to determine class of an object
class(l)
class(teams)

library(nutshell)
data(field.goals)
head(field.goals)
names(field.goals)

hist(field.goals$yards,breaks =3)
table(field.goals$play.type)

data(cars)
dim(cars)
names(cars)
summary(cars)

#ploting data

plot(cars,xlab = "Speed (mph)",ylab = "Stopping dist(ft)",
    las =1,xlim = c(0,25) )


getOption("defaultPackages")
(.packages())
(.packages(all.available = TRUE))

library()

library(rpart)


animals = c("cow","chicken","pig","tuba")
animals[4]
animals[4]="duck"
animals

apples = 3
oranges = 4

if (apples > oranges) "apples are better" else "oranges are better"


# functions

x = function(i) i^2
x(3)


2^1024
-2^1024


# Coercion

# logical<integer<numeric<complex<character<list

c
# modulus
41%%21

# functions
abcd = function(a,b) {2*a + 2*b}
abcd(1,2)
abcd(3,6)

f = function () {x =1;y=2;x+y}
f()


# loops

i = 5;
repeat{if(i>25) break else {print(i);i = i+5}}


while (i<=25) {print(i); i = i+5}

for (i in seq(from = 5,to=25,by=5)) print(i)

for (i in 1:10) print(i)

for (i in seq(from = 5,to=25,by =5)) i
i

#indexing vectors

v = 100:119

v[5]
v[1:5]
v[c(1,6,11,16)]

# double bracket only used for one element rather than set of elements
v[[3]]

v[[c(1,6,11,16)]]

# excluding elements
v[-15:-1]

# working with lists
l = list(a=1,b=2,c=3,d=4,e=5,f=6,g=7,h=8,i=9,j=10)
l[1:3]

l[-7:-1]

#matrix

m = matrix(data = c(101:112),nrow = 3, ncol =4)
m


m[3]
m[3,4]
m[1:2,1:2]
m[1:2,]

m[6]


# indexing by logical vector
rep(c(TRUE,FALSE),10)
v[rep(c(TRUE,FALSE),10)]

v[(v==103)]
v[(v%%3==0)]
v[c(TRUE,FALSE,FALSE)]

l[(l>7)]
l$j
l[2]
l["b"]

dairy = list(milk ="1 gallon",butter = "1 pound",eggs = 12 )
dairy$milk
dairy[["milk"]]
dairy[["mil"]]
dairy[["mil",exact = FALSE]]

dairy
fruit = list(apples = 6,oranges = 3,bananas = 10)
shopping.list = list(dairy,fruit)
shopping.list

shopping.list[[c("dairy","milk")]]

shopping.list[[c(1,2)]]


m = matrix(data = 1:12,nrow = 4, ncol = 3,
           dimnames = list(c("r1","r2","r3","r4"),c("c1","c2","c3")))

m

a= array(data=1:24,dim = c(3,4,2))
a


#objects

eye.colors = c("brown","blue","blue","green","brown","brown","brown")
eye.colors


# as factor
eye.colors = factor(c("brown","blue","blue","green","brown","brown","brown"))
eye.colors

# factor ordered
survey.results = factor(
  c("Disagree","Neutral","Stronlgy Disagree",
    "Neutral","Agree","Strongly Agree",
    "Disagree","Stronlgy Agree","Neutral",
    "Stronlgy Disagree","Neutral","Agree"),
  levels = c("Strongly Disagree","Disagree",
    "Neutral","Agree","Strongly Agree"),
  ordered = TRUE)
survey.results


library(nutshell)
data()
top.bacon.searching.cities

data(top.bacon.searching.cities)
head(top.bacon.searching.cities)

bacon = top.bacon.searching.cities
bacon

class(bacon)

names(bacon)

bacon$rank

# formulas

sample.formula = as.formula(y~x1+x2+x3)
class(sample.formula)
typeof(sample.formula)

# Asterik used for calculating interactions acrosss the variables
y ~ (u+v)*w
# is equivalent to 

y ~ u+v+w + I(u*W)+I(v*w)

attributes(m)
colnames(m)
rownames(m)


a = array(1:12,dim = c(3,4))
a

b= 1:12
b

a==b
all.equal(a,b)

identical(a,b)
dim(b) = c(3,4)
all.equal(a,b)
identical(a,b)

#symbols

x=1
y=2
z=3
v=c(x,y,z)
v
x=10
v

# delay evaluation

x=1
y=2
z=3
v=quote(c(x,y,z))
eval(v)
x=5
eval(v)

x=1
y=2
x=3
objects()

# functions

f = function(x,y) {x+y}
f(1,2)
f(1)

g= function(x,y=10) {x+y}
g(1)

g(1,2)


v=c(sqrt(1:100))
f= function (x,...){print(x);summary(...)}
f("Here is the summary for v",v,digits=2)

# return values
f = function (x) {return(x^2+3)}
f(3)


f = function (x){x^2+3}
f(3)

# functions as arguments
a= 1:17
sapply(a,sqrt)

# to check memory
gc()

memory.limit()



# machine learning

library(arules)
args(apriori)
write.table(audioscrobbler,file = "audioscrobbler.csv")

library(nustshell)
data(audioscrobbler)
head(audioscrobbler)

audioscrobbler.apriori <- apriori(data=audioscrobbler,
  parameter=new("APparameter",support=0.0645)
)

summary(audioscrobbler.apriori)


inspect(audioscrobbler.apriori)




audioscrobbler.eclat <- eclat(data=audioscrobbler,
   parameter=new("ECparameter",support=0.129,minlen=2)
 )
summary(audioscrobbler.eclat)
inspect(audioscrobbler.eclat)



# clustering

data(sanfrancisco.home.sales)
library(cluster)
sf.dist <- daisy(
   na.omit(sanfrancisco.home.sales[,
  c("price", "bedrooms", "squarefeet", "lotsize",
   "year", "latitude", "longitude")]),
   metric="euclidean",
   stand=TRUE
   )

summary(sf.dist)

sf.price.model.kmeans <- kmeans(sf.dist,centers=6)

sf.price.model.kmeans$size
sf.price.model.kmeans$withinss



sanfrancisco.home.sales$cluster <- NA
for (i in names(sf.price.model.kmeans$cluster)) {
  sanfrancisco.home.sales[i,"cluster"] <-
   sf.price.model.kmeans$cluster[i]
   }


by(sanfrancisco.home.sales[ ,
     c("price", "bedrooms", "squarefeet",
        "lotsize", "year", "latitude", "longitude") ],
     INDICES=sanfrancisco.home.sales$cluster,
     FUN=mean)



# reading datasets


setwd('E:/softwares/RCodes')

#reading csv files
college = read.table("College.csv",header = TRUE, sep = ",",nrows = 6)
college

#reading text files
diet = read.table("DietWeigthLoss.txt",header = TRUE, sep = "\t",nrows = 6)
diet


# exporting files
write.table(college,file = "colleget.txt",append = FALSE,sep = "\t",row.names = FALSE)
write.table(diet,file = "diett.csv",append = FALSE,sep = ",",row.names = FALSE)

write.table(college,file = "colleget.txt",append = TRUE,sep = "\t",row.names = FALSE,col.names = FALSE)
write.table(diet,file = "diett.csv",append = TRUE,sep = ",",row.names = FALSE,col.names = FALSE)

library()


#duplicate entries

data = c("GE","GOOG","AAPL","AXP","GS","GE")
duplicated(data)

datau = data[!duplicated(data)]
datau

datau2 = unique(data)
datau2


#sorting

w= c(5,4,7,2,7,1)
w
sort(w)
sort(w,decreasing = TRUE)

length(w)
length(w) =7
sort(w)

sort(w,na.last = TRUE)
sort(w,na.last = FALSE)

v= c(11,12,13,15,14)
u=c("pig","cow","duck","horse","rat")
w= data.frame(v,u)
w

w[order(w$v,w$u),]

w[order(w$v),]



# single differencing in R
head(cars)

diff = rep(0,nrow(cars))

for (i in 1:nrow(cars)-1) {
  diff[i] = cars$dist[i+1]-cars$dist[i]
  diff
}

tot = data.frame(cars,diff)
head(tot)
tot

tot2 = tot[order(-tot$diff),]
tot2










































