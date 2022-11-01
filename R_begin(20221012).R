# R and R studio 101

# First, if you put "#" in front, it changes "codes" do "notes", they won't run!
# I know it's scary...Hang in there!

# Section 1 : Easy math calculations ----- 
# R can do simple numerical operations =====
1 + 1 # addition
8 - 7 # subtraction
(1 + 1) * 3 # multiplication
36 / 3 # division


# more advanced ones are done by functions =====
sqrt (x = 25) # square root
5^3 # power
25^0.5 # power
log(2) # natural log
logb (x = 100, base = 10) # log
logb (100, 10) # log
logb (10, 100) # log
logb (b = 10, x = 100) # log
logb (base = 10, x = 100) # log
exp(1.11) # natural log
abs(-3.1416) #絕對值

# Section 2 : What to put in my code -----
# Not familliar with the function 1 =====
help(sqrt)
?logb
# Not familliar with the function 2
# "Help" tab and search


# How do I know which function to use? =====
# Well, you can: 
# 1. Google 
# 2. Ask Github, a website where programmers are (https://github.com/) or 
# 3. What you're looking for is a statistic problem


# Section 3 : Packages ------
# Others paived the way, you just need to install and reference it.
install.packages("cowsay") # install for 1st time if not in local R library
library("cowsay") # call in package from local library
require("cowsay")# call in package from local library 2
remove.packages("cowsay") # remove package from local R library


# Pop quiz 1 --------
# Do 2 calculations
# Install package and run function



# Section 4 : Where the "language" part starts -----
# Section 4-1 : defining and using objects =====
individuals <- 100 # most common way
100 -> individuals # works just as well
individuals = 100 # better not to use due to the next line
100 = individuals # this does not work at all

INDIVIDUALS # is not existing - R is case sensitive, i and I has different meaning

rm (individuals)  # removes existing object

# redefine object
individuals <- 200
individuals <- individuals + 56

# Different types of elements : character, logic and numeric =====
text_vector <- "that's good morning"  # character string
logical_vector <- TRUE  # logical value (true/ false)
No.individuals <- 234  # numeric element (double, integer)
pi
class(pi)
1+3i # numeric element (complex)
class(1+3i)


# using different objects for calculation
area <- 5
total_individuals <- individuals * area

# use of logical operators
5 > 6  # logical operator


# Section 4-2 : Common types of objects include vector, matrix, data-frame, list =====
# Section 4-2-1 : Vector #########
# all elements in vector must be of the same type (either numeric, character or logical)
temp <- c(1,2,3)
class (temp)
temp[2] <- 'l'# [n] is for object
temp
temp[1] + 3  # not working if temp[1] is character string
class (temp)

# creating vectors
numeric_vector <- c (1, 2, 3, 4, 5)
numeric_vector_2 <- seq (from = 1, to = 100, by = 1)
numeric_vector_3 <- seq (from = .1, to = 53, by = .2)
length (numeric_vector_3)
char_vector <- c('good', 'morning', 'today', 'is', 'Tuesday')
length (char_vector)
nchar (char_vector[1])

# Subsetting objects
numeric_vector <- c (10, 20, 30, 40, 50)
numeric_vector [2:3]
2:10  # sequence of integer values
numeric_vector [c(2,4)]
numeric_vector [c(4,2)]


# Section 4-2-2 : Common types of objects : matrix #############
# create matrix: all elements in matrix must be of the same type (either numeric, character or logical)
# Matrix method 1: simple matrix
matrix (data = 1:12, nrow = 3, ncol = 4) # assign data into matrix
M <- matrix (data = 1:12, nrow = 3, ncol = 4, byrow = 1) # assign data into matrix
# Matrix method 2: merging matrix, NOTE: needs to be same length to merge
a <- matrix(1:6, nrow = 2, ncol = 3)
b <- matrix(c(10, 20, 30, 40, 50, 60), nrow = 2, ncol = 3)
cbind(a,b) # combind by column
rbind(a,b) # combind by row

# apply
a
apply(a,2,sum) # sum by column (2)
apply(a,1,sum) # sum by row (1)

# subsetting matrix
M [2, 3] # [r,c] is for row and column 
M [2, c(2,3)]
M [2, ]
M [ , ]
colnames (M) <- c('a', 'b', 'c', 'd')
M
M [, c('b', 'c')]

# Common calculations for matrix
t(M) # transpose
a*b # element-wise multiplication
a2 <- matrix(1:4, nrow = 2, ncol = 2)
b2 <- matrix(c(10, 20, 30, 40), nrow = 2, ncol = 2)
a2 %*% b2 # %*% is for matrix multiplication


# Section 4-2-3 : Common types of objects : data frame #############
# data frame: elements in vector can be in different types
stdata<-data.frame(grade=c(1,2,3,3,NA),year=c(18,20,21,22,25),
                   sex=c("M","F","F","M","M"))
# Common use for matrix and data.frame
stdata
dim(stdata) # dimension of frame [r,c]
nrow(stdata) # number of row
ncol(stdata) # number of column
head(stdata) # top rows of frame
tail(stdata) # bottom rows of frame

# call a data frame column
stdata$grade
# add a column to data frame call "grade2 
stdata$grade2<-c(1,5,8,9,7)

# change name of column or row
colnames(stdata)[2]<-"study_year" # change 2nd column name
row.names(stdata)[5]<-"5_missing_grade" # change 5th row name
stdata

# data.frame - subsetting
stdata [1:2, 2]
stdata [1:2, 'grade2']
stdata$grade[4:5]

# combine data
rbind(stdata$grade,stdata$sex)#return matrix, $ is for name searching
class(rbind(stdata$grade,stdata$sex))
cbind(stdata,identity=c("offered","student",
                        "offered","student","offered"))
# return data.frame #like date.frame()


# Section 4-2-4 : list #########
# list: elements in cell can be in different types or layers
zoo <-list(
  name = 'Taipei zoo',
  total_animals = 2700,
  categories = data.frame(
    type = c('giraffe','panda','elephant'),
    origin = c('Kenya','China','India'),
    number = c(6,3,5)
  )
)
zoo
unlist(zoo) # list unfolds into character


# Small summary of how to find data from different type of objects
# call from vector
a.vector<-c("Amy","John","hihi")
a.vector
a.vector[2]
# call from dataframe/matrix [row number,column number]
stdata
stdata[,3]
stdata[1,]
stdata[1,3]
# return index for specifics
# condision 1: find "M"
stdata$sex # column namd "sex"
which(stdata$sex =="M") # which index is "M" in the "sex" column
stdata[which(stdata$sex =="M"),] # row if data frame with "M" in the sex column
stdata[which((stdata$sex =="M")&(stdata$grade2>6)),] # row if "M" and grade2 > 6
stdata[stdata$sex =="F"|stdata$study_year<20,] # row if "F" or grade1 > 3
stdata[!is.na(stdata$grade),]# remove by ! which grade is na
stdata[-4,]# remove the 4th row
# call from list[[]]: find zoo and run list again!
zoo
zoo$categories
zoo[[3]]


# Section 5 : Where the "logic" part starts -----
# Section 5-1: if(){}else{}
x <- c(1:100)

if(length(x)>150){
  print("long")
}else{
  print("short")
}

#if(){}elseif(){}else{}
if(length(x)>100){
  print("long")
}else if(length(x)==100){
  print("medium")
}else{
  print("short")
}

# Section 5-2: loops
# Say I wan to know from 101 to 200, who are the integer multiple of 7?
Div7 <- c() # set vecter to save output
for(i in c(101:200)){ # loop i in 101 to 200
  if(i/7==round(i/7)){ # if i/7 is a rounded number
    j <- (i-105)/7+1 # which cell to save in vecter?
    Div7[j] <- i # what to save in cell?
  }else{next} # if i/7 is NOT a rounded number, move on to the next number
}
Div7 # output of loop

# Section 6 : Functions ----------------------
func <- function(x){x^2+1}
curve(func,from=-3,to=3)

BMI_func <- function(height=170,weight=60){
  BMI = weight/(height/100)^2
  return(BMI)
}

BMI_func(c(160,180),c(70,60))
BMI_func(c(160,180))

# Section 7 : pathway ----------------------
# Where are we in the computer?
getwd() # get working direction
setwd() # set working direction

# Section 8 : plotting ----------------------
# Read in data
demoDF <- read.table("C:/Users/user/Desktop/台大/生命科學數學/R statistics/Data/demo.txt",sep=" ")
head(demoDF)

# Basic plots by data =============
par(mfrow=c(3,1),mar=c(1,4,2,1)) # mfrow: layout; mar: margin (bottom, left, top, right)
plot(demoDF$Chl.a,type = "p") # point
plot(demoDF$Chl.a,type = "l") # line
plot(demoDF$Chl.a,type = "b") # both point and line

plot(demoDF$Temp,demoDF$Chl.a) # plot(x,y)
plot(demoDF$Chl.a~demoDF$Temp) # plot(y~x)
plot(demoDF$Temp,demoDF$Chl.a,main = "Chl.a vs. Temperature",
     xlab = "Temperature",ylab="Chl.a")
plot(Chl.a~Temp,data=demoDF, main = "Chl.a vs. Temperature",
     xlab = "Temperature",ylab="Chl.a",ylim=c(0,1.6))

plot(Chl.a~Temp,data=demoDF, main = "Chl.a vs. Temperature",
     xlab = "Temperature",ylab="Chl.a",ylim=c(0,1.6),pch=15,col=2)
hist(demoDF$Chl.a)
hist(demoDF$Chl.a,breaks = seq(0,1.5,by=0.1))
abline(v=mean(demoDF$Chl.a),col="red",lwd=2)
dev.off() # stop 3 panel plot

# Primary production of dataset if >= 1 Chl.a is considered as high
for(A in c(1:nrow(demoDF))){
  if(demoDF$Chl.a[A]>=1){demoDF$Production[A] <- "high"}else
  {demoDF$Production[A] <- "low"}
}
jpeg(filename="mynewdata.jpeg")	
par(mfrow=c(1,2))
pie(table(demoDF$Production), cex=2, cex.main=2, main="Production")
barplot(table(demoDF$Production),ylab = "Cases", xlab = "Production",names.arg = c("high","low"))
dev.off()

# Basic plots by equations =============
par(mfrow=c(3,1))
# for a curve:
func <- function(x){x^2+3}
func(3)
curve(func, from=-3, to=3)

# for a circle: 
x = seq(-pi, pi, length.out=30)
plot(sin(x),cos(x))

# for a star: 
a=10; b=10/1.8
x=seq(-50,50,length.out=500)
plot((a-b)*cos(x)+b*cos(x*((a/b)-1)), (a-b)*sin(x)-b*sin(x*((a/b)-1)), ylim=range(-13,13))
dev.off()

# Plot equations in 3D =============
#install.packages("lattice")
library(lattice)
t<-seq(-2*pi, 2*pi, length.out=200)
cloud(z~x+y,data.frame(x=3*cos(t),y=3*sin(t), z=2*t)) # plot

#install.packages("plotly")
library(plotly)
dat <- data.frame(x=3*cos(t), y=3*sin(t), z=2*t)
plot_ly(dat, x = ~x, y = ~y, z = ~z, type = 'scatter3d', mode = 'lines',
        line = list(width = 4)) # 3D Viewer

# Bonus ----------------------
# Rstudio has cheet-sheets ready for popular packages
# https://www.rstudio.com/resources/cheatsheets/
#install.packages("ggplot2")
install.packages("ggpubr")
library(ggplot2)
library(ggpubr)

as.data.frame(iris)
ggplot(iris, aes(x=Sepal.Length,y=Petal.Length,color=Species))+
  geom_point(size=4,shape=17,aes(color=Species))+ # Point in plot
  stat_smooth(method = "lm", col = "grey60", se = F)+ # linear regression
  stat_cor(label.x.npc = "middle",label.y.npc = "bottom",col="grey20",size=6)+ # from package "ggpubr"
  labs(title="Demo plot",subtitle = "iris petal:sepal", caption = "Good luck!")+
  theme_bw(base_size = 18) # theme of plot

