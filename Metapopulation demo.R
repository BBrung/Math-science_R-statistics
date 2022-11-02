#Island-mainland model
ismodel=function(pi,pe,p,t){  #p: total no. of patches
  patch=rep(NA,t)
  for (i in 1:t){
    patch[1]=p
    patch[i+1]=patch[i]-rbinom(1,patch[i],pe)+rbinom(1,p-patch[i],pi)  #binom(n, p) -> bionom (100, 0.5) 抽出機率 50
  }
  f=patch/p
  plot(f,type='l',xlab='time')
  abline(h=pi/(pi+pe),lty=2)
}

ismodel(0.2,0.2,100,100)

#Internal colonization model --immigration rate 隨時間上升
icmodel=function(pi,pe,p,t){
  patch=rep(NA,t)
  for (i in 1:t){
    patch[1]=p
    patch[i+1]=patch[i]-rbinom(1,patch[i],pe)+rbinom(1,p-patch[i],pi*patch[i]/p)
  }
  f=patch/p
  plot(f,type='l',xlab='time')
  abline(h=(1-pe/pi),lty=2)
}

icmodel(0.8,0.4,100,100)

