delta1<-function(t){0.04-0.01*exp(-0.2*t)}
delta2<-function(t){0.05-0.01*exp(-0.2*t)}
delta3<-function(t){0.06-0.01*exp(-0.2*t)}

spot1<-function(t){(0.04*t+0.05*exp(-0.2*t)-0.05)/t}
spot2<-function(t){(0.05*t+0.05*exp(-0.2*t)-0.05)/t}
spot3<-function(t){(0.06*t+0.05*exp(-0.2*t)-0.05)/t}

forward1<-function(t){(0.04*t+0.05*exp(-0.2*t)-0.04-0.05*exp(-0.2))/(t-1)}
forward2<-function(t){(0.05*t+0.05*exp(-0.2*t)-0.05-0.05*exp(-0.2))/(t-1)}
forward3<-function(t){(0.06*t+0.05*exp(-0.2*t)-0.06-0.05*exp(-0.2))/(t-1)}

plot(seq(0,25,.1),delta1(seq(0,25,.1)),lty=6,ylim=c(0.02,0.08),xlab="term", ylab="",type="l",main="Instantaneous forward rates at t=0")
lines(seq(0,25,.1),delta2(seq(0,25,.1)),lwd=2,lty=5)
lines(seq(0,25,.1),delta3(seq(0,25,.1)),lwd=4,lty=1)
legend("topleft",legend=c("A","AA","AAA"),lwd=c(4,2,1),lty=c(1,5,6))



plot(seq(0,25,.1),spot1(seq(0,25,.1)),lty=6,ylim=c(0.02,0.08),xlab="term", ylab="",type="l",main="Corresponding spot rates")
lines(seq(0,25,.1),spot2(seq(0,25,.1)),lwd=2,lty=5)
lines(seq(0,25,.1),spot3(seq(0,25,.1)),lwd=4,lty=1)
legend("topleft",legend=c("A","AA","AAA"),lwd=c(4,2,1),lty=c(1,5,6))

time1<-seq(1,5);     y1<-spot1(time1)
(bond1<-presentValue(c(rep(5,4),105),time1,exp(y1)-1))

time2<-seq(1,10);    y2<-spot1(time2)
bond2<-presentValue(c(rep(5,9),105),time2,exp(y2)-1)

time3<-seq(1,15);  y3<-spot1(time3)
bond3<-presentValue(c(rep(5,14),105),time3,exp(y3)-1)

time4<-seq(1,20)
y4<-spot1(time4)
bond4<-presentValue(c(rep(5,19),105),time4,exp(y4)-1)

time5<-seq(1,25);    y5<-spot3(time5) 
bond5<-presentValue(c(rep(5,24),105),time5,exp(y5)-1)

c(bond1,bond2,bond3,bond4,bond5)

time1next<-time1[-length(time1)]
time2next<-time2[-length(time2)]
time3next<-time3[-length(time3)]
time4next<-time4[-length(time4)]
time5next<-time5[-length(time5)]

y1next1<-forward1(time1next+1)
y1next2<-forward2(time1next+1)
y1next3<-forward3(time1next+1)

y2next1<-forward1(time2next+1)
y2next2<-forward2(time2next+1)
y2next3<-forward3(time2next+1)

y3next1<-forward1(time3next+1)
y3next2<-forward2(time3next+1)
y3next3<-forward3(time3next+1)

y4next1<-forward1(time4next+1)
y4next2<-forward2(time4next+1)
y4next3<-forward3(time4next+1)

y5next1<-forward1(time5next+1)
y5next2<-forward2(time5next+1)
y5next3<-forward3(time5next+1)

bond1next1<-presentValue(c(rep(5,3),105),time1next,exp(y1next1)-1)+5
bond1next2<-presentValue(c(rep(5,3),105),time1next,exp(y1next2)-1)+5
bond1next3<-presentValue(c(rep(5,3),105),time1next,exp(y1next3)-1)+5

bond2next1<-presentValue(c(rep(5,8),105),time2next,exp(y2next1)-1)+5
bond2next2<-presentValue(c(rep(5,8),105),time2next,exp(y2next2)-1)+5
bond2next3<-presentValue(c(rep(5,8),105),time2next,exp(y2next3)-1)+5

bond3next1<-presentValue(c(rep(5,13),105),time3next,exp(y3next1)-1)+5
bond3next2<-presentValue(c(rep(5,13),105),time3next,exp(y3next2)-1)+5
bond3next3<-presentValue(c(rep(5,13),105),time3next,exp(y3next3)-1)+5

bond4next1<-presentValue(c(rep(5,18),105),time4next,exp(y4next1)-1)+5
bond4next2<-presentValue(c(rep(5,18),105),time4next,exp(y4next2)-1)+5
bond4next3<-presentValue(c(rep(5,18),105),time4next,exp(y4next3)-1)+5

bond5next1<-presentValue(c(rep(5,23),105),time5next,exp(y5next1)-1)+5
bond5next2<-presentValue(c(rep(5,23),105),time5next,exp(y5next2)-1)+5
bond5next3<-presentValue(c(rep(5,23),105),time5next,exp(y5next3)-1)+5

c(bond1next1,bond2next1,bond3next1,bond4next1,bond5next3)

return1_11<-(bond1next1/bond1)-1;		return2_11<-(bond2next1/bond2)-1
return1_12<-(bond1next2/bond1)-1;		return2_12<-(bond2next2/bond2)-1
return1_13<-(bond1next3/bond1)-1;		return2_13<-(bond2next3/bond2)-1


return3_11<-(bond3next1/bond3)-1
return3_12<-(bond3next2/bond3)-1
return3_13<-(bond3next3/bond3)-1

return4_11<-(bond4next1/bond4)-1
return4_12<-(bond4next2/bond4)-1
return4_13<-(bond4next3/bond4)-1

return5_31<-(bond5next1/bond5)-1
return5_32<-(bond5next2/bond5)-1
return5_33<-(bond5next3/bond5)-1

return_def<-(-0.2)
return_matrix<-(matrix(c(return1_11,return1_12,return1_13,return_def,return2_11,
                         return2_12,return2_13,return_def,return3_11,return3_12,return3_13,return_def,
                         return4_11,return4_12,return4_13,return_def,return5_31,return5_32,return5_33,
                         return_def),5,4,byrow = TRUE))

round(return_matrix,4)

transition1<-c(.85,.12,.02,.01)
transition2<-c(.1,.73,.15,.02)
transition3<-c(.05,.3,.45,.2)
trans_matrix<-matrix(c(transition1,transition2,transition3),3,4,byrow=TRUE)
rownames(trans_matrix)<-c(1,2,3); colnames(trans_matrix)<-c(1,2,3,"default")
trans_matrix

cum1<-cumsum(transition1);cum2<-cumsum(transition2);cum3<-cumsum(transition3)
(cum_transx<-matrix(c(cum1,cum2,cum3),3,4,byrow=TRUE))




exp_valuebond1<-t(return_matrix[1,])%*%(trans_matrix[1,])
exp_valuebond2<-t(return_matrix[2,])%*%(trans_matrix[1,])
exp_valuebond3<-t(return_matrix[3,])%*%(trans_matrix[1,])
exp_valuebond4<-t(return_matrix[4,])%*%(trans_matrix[1,])
exp_valuebond5<-t(return_matrix[5,])%*%(trans_matrix[3,])

(exp_value_combine<-c(exp_valuebond1,exp_valuebond2,exp_valuebond3,exp_valuebond4,exp_valuebond5))  

(correlations_low<-matrix(c(1,0.1,0.1,0.1,0.1,0.1,1,0.15,0.15,0.15,
                            0.1,0.15,1,0.2,0.2,0.1,0.15,0.20,1,0.25,0.1,0.15,0.2,0.25,1),5,5,byrow=TRUE))
lowx<-c(0.1,0.1,0.1,0.1,0.15,0.15,0.15,0.2,0.2,0.25)
highx<-lowx+0.7
low_corrn_cop<-normalCopula(lowx,dim=5,dispstr = "un") 
high_corrn_cop<-normalCopula(highx,dim=5,dispstr = "un")

set.seed(5555555);  sims<-1000000
simulatex<-rCopula(sims,low_corrn_cop)
head(simulatex,3)

bondratings<-c(1,1,1,1,3)
num_bonds<-5
next_rating<-matrix(0,sims,num_bonds);  value_low<-matrix(0,sims,num_bonds)

for(j in 1:num_bonds){
  for(i in 1:sims){
    z<-cum_transx[bondratings[j],] - simulatex[i,j]
    z[z < 0] <- NA
    next_rating[i,j]<-which.min(z)
  }
  value_low[,j]<-return_matrix[j,next_rating[,j]]
}

head(next_rating,3)
head(value_low,3)

round(apply(next_rating, 2, table)/sims, 2)

colMeans(value_low)
exp_value_combine

sim_portfolio_return<-rowMeans(value_low)
mean(sim_portfolio_return)
sd(sim_portfolio_return)
quantile(sim_portfolio_return,0.005)
mean(sim_portfolio_return)+qnorm(0.005)*sd(sim_portfolio_return)

max(sim_portfolio_return)
sim_portfolio_return[head(order(sim_portfolio_return))]

int_risk_adj<-rnorm(sims,1,0.2)
sim_portfolio_return_int_risk<-sim_portfolio_return*int_risk_adj
hist(sim_portfolio_return*100,breaks = 25,main="Basic credit risk model",xlab="Fund return %")
hist(sim_portfolio_return_int_risk*100,breaks = 25,main="Including an approximate interest rate adjustment",xlab="Fund return %")

mean(sim_portfolio_return_int_risk)
sd(sim_portfolio_return_int_risk)
quantile(sim_portfolio_return_int_risk,0.005)


# Exercise 3
highx<-lowx+.7
high_corrn_cop<-normalCopula(highx,dim=5,dispstr = "un")
correlations_high<-matrix(c(1,.8,.8,.8,.8,.8,1,.85,.85,.85,.8,.85,1,.9,.9,.8,.85,.90,1,.95,.8,.85,.9,.95,1),5,5,byrow=TRUE)
correlations_high

set.seed(301)
simulatex_high<-rCopula(sims,high_corrn_cop)
valueabc_high<-matrix(0,sims,num_bonds)
xxx<-matrix(0,sims,num_bonds)

for(j in 1:num_bonds){
  for(i in 1:sims){
    z<-cum_transx[bondratings[j],] - simulatex_high[i,j]
    z[z < 0] <- NA
    xxx[i,j]<-which.min(z)
  }
  valueabc_high[,j]<-return_matrix[j,xxx[,j]]
}


sim_portfolio_return_high<-rowMeans(valueabc_high)
sim_portfolio_return_int_risk_high<-sim_portfolio_return_high*int_risk_adj


mean(sim_portfolio_return_int_risk_high)
sd(sim_portfolio_return_int_risk_high)
quantile(sim_portfolio_return_int_risk_high,0.005)
hist(sim_portfolio_return_int_risk_high*100,breaks = 25,main="Including an approximate interest rate adjustment",xlab="Fund return %")














