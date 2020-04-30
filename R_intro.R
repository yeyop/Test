install.packages("rbenchmark")
library(rbenchmark)
fun1<-function(n){
  tmp<-0
  for(i in seq_len(n)){
    tmp<-tmp+i
  }
  return(tmp)
}
fun2<-function(n){
  return(sum(seq_len(n)))
}
res<-benchmark(fun1(100),fun2(100),replications=100000,
               columns=c("test","elapsed","relative","user.self","sys.self"))
res

#vectorized arithmetic
x<-1:100
y<-2:101
fun1<-function(){
  z<-NULL
  for(i in 1:100){
    z[i]<-x[i]+y[i]
  }
  return(z)
}
fun2<-function(){
  z<-x+y
  return(z)
}
res<-benchmark(fun1(),fun2(),replications=10000,
               columns=c("test","elapsed","relative","user.self","sys.self"))
res

#apply(X,margin,func)
matrix(1:4,2,2)
apply(matrix(1:4,2,2),1,sum)
apply(matrix(1:4,2,2),2,sum)

#lapply(x,func)
lapply(c(5,6),function(i){return(1:i)})
lapply(data.frame(a=1:4,b=2:5),mean)
lapply(list(a=1:10,b=1:3),mean)

#sapply(x,func)
sapply(c(3,4),function(i){return(1:i)})
sapply(c(3,3),function(i){return(1:i)})

install.packages("parallel")
library(parallel)
detectCores()
