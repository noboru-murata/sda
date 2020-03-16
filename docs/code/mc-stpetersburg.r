### St Petersburg のパラドックス
## コイン投げの賭けの試行
myTrial <- function(verbose=FALSE){
    num <- 0 # コイン投げの回数
    while(TRUE){ # 条件が満たされるまでループする
        num <- num + 1 # 回数を増やす
        if(runif(1)>0.5) break # 表が出たら終了
        ## 一様分布で値が0.5を越えらた表として模擬
        ## 以下の二項分布でも同じ
        ## if(rbinom(1,size=1,prob=0.5)==1) break
    }
    bounty <- 2^num # 賞金を計算
    if(verbose==TRUE){ # 何回投げたかも返す
        return(c(num=num,bounty=bounty))
    } else { # 賞金だけ返す
        return(bounty)
    }
}

## 試行を行ってみる
myTrial()
myTrial(verbose=TRUE)

## Monte-Carlo simulation
## set.seed(8888) # 実験を再現したい場合はシードを指定
myDF <- data.frame(mc=NULL,bounty=NULL)
for (mc in c(2^(8:15))) {
    myData <- replicate(mc,myTrial())
    cat("試行回数: ", mc, "\n")
    cat("賞金の平均値: ", mean(myData), "\n")
    myDF <- rbind(myDF,data.frame(mc=rep(mc,mc),
                                  bounty=myData))
}
boxplot(bounty ~ mc, data=myDF) # 回数ごとの箱ひげ図
boxplot(bounty ~ mc, data=myDF, 
        ylim=c(0,100),col="orange") # y軸を制限
