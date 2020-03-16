### Monty Hole 問題
## クイズに答える試行
myTrial <- function(verbose=FALSE){
    prize <- sample(1:3,size=1)  # 賞品の置かれた扉
    choice <- sample(1:3,size=1) # 最初の選択
    if(prize==choice) { # 変えないのが正解
        win <- "stay"
        door <- sample(setdiff(1:3,prize),size=1)
    } else { # 変えるのが正解
        win <- "change"
        door <- setdiff(1:3,union(prize,choice))
    }
    if(verbose==TRUE){ # 賞品，選択，正しい扉を返す
        return(c(prize=prize,choice=choice,door=door))
    } else { # 勝ち負けの条件を返す
        return(win)
    }
}

## 試行を行ってみる
myTrial()
myTrial(verbose=TRUE)

## 絵にしてみる
mc <- 20
plot(c(0,0),type="n", # 空のキャンバスを作る
     xlim=c(0,mc),ylim=c(1,3),ann=FALSE,axes=FALSE)
title(xlab="index of trials")
axis(2,at=1:3,labels=1:3)
abline(h=1:3,col="grey") # 線を引く
for (i in 1:mc) {
    obs <- myTrial(verbose=TRUE)
    prize <- obs["prize"]
    choice <- obs["choice"]
    door <- obs["door"]
    points(i,door,pch=0,cex=3,col="green")
    points(i,prize,pch=1,cex=3,col="red")
    points(i,choice,pch=19,cex=3, # 正解を色で表示
           col=ifelse(prize==choice,"red","blue"))
}

## Monte-Carlo simulation
## set.seed(8888) # 実験を再現したい場合はシードを指定
mc <- 10000 # 回数を設定 
myData <- replicate(mc,myTrial()) 

## 簡単な集計
table(myData) # 頻度
table(myData)/mc # 確率(推定値)
