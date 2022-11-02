#Mathematics for Life Scientists
#Leslie_HW5
#Author: Chia-Jung Tsai

teasel <- matrix(0, 6, 6)
teasel[1,] <- c(0, 0, 0, 0, 0, 322.38)
teasel[2,] <- c(0.966, 0, 0, 0, 0, 0)
teasel[3,] <- c(0.013, 0.01, 0.125, 0, 0, 3.448)
teasel[4,] <- c(0.007, 0, 0.125, 0.238, 0, 30.17)
teasel[5,] <- c(0.008, 0, 0, 0.245, 0.167, 0.862)
teasel[6,] <- c(0, 0, 0, 0.023, 0.75, 0)
teasel

# population growth rate (λ)
#λ = e^r
λ <- eigen(teasel)$values[1]
λ # = 2.32188

# stable age distribution (re-scale so that the sum = 1)
stable_age_distribution <- round(eigen(teasel)$vectors[ ,1]/sum(eigen(teasel)$vectors[ ,1]),4)
sum(stable_age_distribution)
stable_age_distribution

#relative reproductive value (the first element is 1.0)
eigen(t(teasel))
stable_age_distribution_t <- 1000*round(eigen(t(teasel))$vectors[ ,1]/sum(eigen(t(teasel))$vectors[ ,1]),4)
stable_age_distribution_t

#sensitivity

#teasel[2,1] <- teasel[2,1]*1.1 #[2,1]
#eigen(teasel)$values[1] #λ


growth.rate.1.1 <- matrix(nrow = 6, ncol = 6)
for (i in 1:6){
  for (j in 1:6){
    teasel.new <- teasel
    teasel.new[i,j] <- teasel.new[i,j]*1.1
    growth.rate.1.1[i,j] <- eigen(teasel.new)$values[1]
  }
}
growth.rate.1.1

#Sensitivity value
#new teasel - old teasel = 0.1*teasel
growth.rate.new <- (growth.rate.1.1-eigen(teasel)$values[1])/0.1*teasel
growth.rate.new


#the two matrix elements (in terms of life histories) that caused the 
#largest increase in population growth rate
growth.rate.new.percentage <- round(growth.rate.new*teasel/eigen(teasel)$values[1],4)
growth.rate.new.percentage
#the two matrix elements = [1,6] & [4,6]

