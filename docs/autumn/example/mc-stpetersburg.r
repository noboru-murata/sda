### St Petersburg のパラドックス

## コイン投げの賭けの試行
myTrial <- function(verbose=FALSE){
    num <- 1 # コイン投げの回数 (次に投げるコインが何回目か)
    while(TRUE){ # 条件が満たされるまでループする
        if(runif(1)>0.5) break # 一様分布で模擬
        ## if(rbinom(1,size=1,prob=0.5)==1) break
        num <- num + 1 # 回数を増やす
    }
    bounty <- 2^num
    if(verbose==TRUE){
        return(c(num=num,bounty=bounty))
    } else {
        return(bounty)
    }
}

## 試行を行ってみる
myTrial()
myTrial(verbose=TRUE)

## Monte-Carlo simulation
## set.seed(8888) # 実験を再現したい場合はシードを指定する
myDF <- data.frame(mc=NULL,bounty=NULL)
for (mc in c(2^(8:15))) {
    myData <- replicate(mc,myTrial())
    cat("試行回数: ", mc, "\n")
    cat("平均値: ", mean(myData), "\n")
    myDF <- rbind(myDF,data.frame(mc=rep(mc,mc),bounty=myData))
}
boxplot(bounty ~ mc, data=myDF) # 回数ごとの箱ひげ図を表示
boxplot(bounty ~ mc, data=myDF,ylim=c(0,100),col="orange")
