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
#lx * mx -> Σ (lx*mx) = Ro
a <- barnacle$lx*barnacle$mx
barnacle <- barnacle %>% data.frame(lx.mx = a)

#x*lx*mx -> Σx*lx*mx/ΣRo = Σx*lx*mx/Σ(lx*mx) = G
b <- barnacle$Age_x*barnacle$lx*barnacle$mx
barnacle <- barnacle %>% data.frame(x.lx.mx = b)

#lx*mx*e^-rx
c <- paste(barnacle$lx*barnacle$mx, 'e^-', barnacle$Age_x, 'r')
barnacle <- barnacle %>% data.frame(lx.mx.e_rx = c)


#Lx = (lx + lx+1)/2  每個年齡區間的平均存活率
Lx <- rep(0,9)
for (i in 1:9){
  Lx[i] <- (barnacle$lx[i] + barnacle$lx[i+1])/2
} 
Lx

#ex = (Lx + Lx+1 + Lx+2 + … + Lmax)/lx (life expectancy)
ex <- NULL
for (i in 1:length(Lx)){
  ex[i] <- sum(Lx[i:length(Lx)])/barnacle$lx[i]
}
ex

#Ro = Σ (lx*mx) (net reproductive rate)
Ro <- sum(a)
#Ro = 1.2829

#G = Σx*lx*mx/ΣRo = Σx*lx*mx/Σ(lx*mx)  (generation time) 
G <- sum(b)/sum(a)
# 3.067269

#估計r (approximate r)
#r~lnRo/G
#r~(ln(Σ lx*mx))/(Σx*lx*mx/Σ(lx*mx))
r <- log(sum(a))/(sum(b)/sum(a))
r
##r ~ 0.08121984


#true r
#function for r
lx.mx.e_rx <- NULL
true.r <- function(r){
  for (i in 1:9){
    lx.mx.e_rx[i] <- barnacle$lx[i]*barnacle$mx[i]*exp(-r*barnacle$Age_x[i])
  }
  return(sum(lx.mx.e_rx)-1)
}

#解方程式
Tr <- uniroot(true.r, lower = 0.08, upper = 0.09, tol = 0.0000000000001) #tol= accuracy
# true r = 0.08471204
Tr$root

#lx*mx*e^-rx
#plug approximate r in it
lme.r <- barnacle$lx*barnacle$mx*exp(-r*barnacle$Age_x)
barnacle <- barnacle %>% data.frame(lme.r = lme.r)
#plug true r in it
lme.tr <- barnacle$lx*barnacle$mx*exp(-Tr$root*barnacle$Age_x)
barnacle <- barnacle %>% data.frame(lme.tr = lme.tr)

#Vx (reproductive value) (Σ ly.my.e^-ry)/(e^-rx*lx)
#plug approximate r in it
Vx <- NULL
for (i in 1:length(lme.r)){
  Vx[i] <- sum(lme.r[i:length(lme.r)])/(barnacle$lx[i]*exp(-r*barnacle$Age_x[i]))
}
Vx


#plug true r in it
Vx.tr <- NULL
for (i in 1:length(lme.tr)){
  Vx.tr[i] <- round(sum(lme.tr[i:length(lme.tr)])/(barnacle$lx[i]*exp(-Tr$root*barnacle$Age_x[i])), digits = 4)
}
Vx.tr <- sprintf("%0.4f", Vx.tr)



#l1*m1*e-1r+l2*m2*e-2r+l3*m3*e-3r+.../l1*e-0r
#l2*m2*e-2r+l3*m3*e-3r+.../l2*e-1r
#l3*m3*e-3r+.../l3*e-2r


#年齡區間
barnacle_Age.range <- data.frame(Age_range = c('0-1', '1-2', '2-3', '3-4', '4-5', '5-6', '6-7', '7-8', '8-9'),
                                 Lx = Lx,
                                 ex = ex,
                                 vx = Vx[1:9],
                                 Vx.true.r = Vx.tr[1:9])


#匯出檔案
write.csv(x = barnacle, file = 'barnacle.csv')
write.csv(x = barnacle_Age.range, file = 'barnacle_Age_range.csv')
     
