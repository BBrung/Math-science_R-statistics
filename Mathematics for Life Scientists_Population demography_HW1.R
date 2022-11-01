#Mathematics for Life Scientists
#Population demography_HW
#Author: Chia-Jung Tsai

#Homework Q1: life table

#set data as data frame
barnacle <- data.frame(Age_x = 0:9,
                       lx = c(1.0000000, 0.0000620, 0.0000340, 0.0000200, 0.0000155, 0.0000110, 0.0000065, 0.0000020, 0.0000020, 0),
                       mx = c(0, 4600, 8700, 11600, 12700, 12700, 12700, 12700, 12700, 0))

#Calculation
library(tidyverse)
#lx * mx
a <- barnacle$lx*barnacle$mx
barnacle <- barnacle %>% data.frame(lx.mx = a)

#x*lx*mx
b <- barnacle$Age_x*barnacle$lx*barnacle$mx
barnacle <- barnacle %>% data.frame(x.lx.mx = b)

#lx*mx*e^-rx
c <- paste(barnacle$lx*barnacle$mx, 'e^-', barnacle$Age_x, 'r')
barnacle <- barnacle %>% data.frame(lx.mx.e_rx = c)

#function for r
lx.mx.e_rx <- NULL
true.r <- function(r){
  for (i in 1:9){
    lx.mx.e_rx[i] <- barnacle$lx[i]*barnacle$mx[i]*exp(-r*barnacle$Age_x[i])
  }
  return(sum(lx.mx.e_rx)-1)
}

ans <- NULL
for (j in seq(0.0800, 0.0900, by = 0.0001)) {
  ans[j] <- true.r(j)
}
true.r(seq(0.0800, 0.0900, by = 0.0001))
true.r(0.0855)
true.r(0.07)
true.r(0.08)
true.r(0.09)
?nlm


true.r <- function(r){
  for (i in 1:9){
     barnacle$lx[i]*barnacle$mx[i]*exp(-r*barnacle$Age_x[i])
  }
}
curve(true.r, from = 0, to = 1)  

?uniroot
uniroot(true.r, )

#Lx = (lx + lx+1)/2
Lx <- rep(0,9)
d <- for (i in 1:9){
  Lx[i] <- (barnacle$lx[i] + barnacle$lx[i+1])/2
} 
Lx

#年齡區間
barnacle_Age.range <- data.frame(Age_range = c('0-1', '1-2', '2-3', '3-4', '4-5', '5-6', '6-7', '7-8', '8-9'),
                                 Lx = Lx)

#ex (life expectancy)
ex <- rep(0,9)
e <- for (i in 1:9){
  ex[i] <- sum(barnacle_Age.range$Lx[i]:barnacle_Age.range$Lx[9])/barnacle$lx[i]
}
barnacle_Age.range <- barnacle_Age.range %>% data.frame(ex = ex)


#Vx (reproductive value) (Σ lx.mx.e^-rx)/(e^-rx*lx)



#R0 (net reproductive rate = Σ 𝑙𝑥𝑚𝑥
sum(a)
#G (generation time) 
#approximate r
#true r



