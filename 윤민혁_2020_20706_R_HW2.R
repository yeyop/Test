library(rbenchmark)
library(parallel)
detectCores()

x<-data.frame(rs=rnorm(n=100,mean=0,sd=1))
x


fun1<-function(x){
  u<-sapply(x,mean)
  ss<-as.data.frame(sapply(x-u,function(y){y^2}))
  sapply(ss,sum)
}
fun1(x)


fun2<-function(x){
  z<-0
  for(i in 1:length(x[,])){
    z<-z+x[i,]
  }
  u<-z/length(x[,])
  ss<-rep(NA,length(x[,]))
  for(i in 1:length(x[,])){
    ss[i]<-(x[i,]-u)^2
  }
  SS<-0
  for(i in 1:length(x[,])){
    SS<-ss[i]+SS
  }
  return(SS)
}
fun2(x)



res<-benchmark(fun1(x),fun2(x),replications=3000,
               columns=c("test","elapsed","relative","user.self","sys.self"))
res

