myFunction<-function(x,y){
  if(x>y){print("x is greater")}else{print("y is greater or equal")}
  z<-x+y;return(z)}
a<-c(1,2,3,4,5);b<-c(5,4,3,2,1)
for(i in 1:length(a)){print(myFunction(a[i],b[i]))}