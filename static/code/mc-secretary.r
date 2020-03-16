### 秘書問題
## 秘書の採用の試行
myTrial <- function(n,r,verbose=FALSE){ # nとrを指定
    applicants <- sample(1:n,size=n)
    ref <- applicants[1:(r-1)]
    test <- applicants[r:n]
    idx <- which(test < min(ref))
    if(length(idx)==0) {
        employed <- applicants[n]
    } else {
        employed <- test[idx[1]]
    }
    if(verbose==TRUE){ # 全順位も返す
        return(list(applicants=applicants,
                    employed=employed))
    } else { # 採用した者の順位のみ返す
        return(employed)
    }
}

## 試行を行ってみる
n <- 10
myTrial(n,2,verbose=TRUE)
myTrial(n,3,verbose=TRUE)
myTrial(n,4,verbose=TRUE)
myTrial(n,5,verbose=TRUE)
myTrial(n,6,verbose=TRUE)

## Monte-Carlo simulation
## set.seed(8888) # 実験を再現したい場合はシードを指定
mc <- 5000
n <- 25 # 候補者数を変えて実験
myDF <- data.frame(r=NULL,employed=NULL)
for (r in 2:(n-1)) {
    myData <- replicate(mc,myTrial(n,r))
    if(r %in% c(2,6,10,14,18,22)) { # いくつか表示
        cat("試行回数: ", r, "\n")
        print(table(myData))
    }
    myDF <- rbind(myDF,data.frame(r=rep(r,mc),
                                  employed=myData))
}
boxplot(employed ~ r, data=myDF, # rごとの箱ひげ図
        col="lightblue", main=paste("n =", n)) 
(myDF2 <- aggregate(myDF[,"employed"],
                    by=list(r=myDF$r),
                    FUN=function(x){mean(x==1)}))
plot(x ~ r, data=myDF2, # 1位を採用できる確率を表示
     type="s", col="blue", lwd=3,
     main=paste("n =", n), ylab="probability")

## 理論的に良いとされるrの値 (nが十分大きい場合)
n/exp(1) 
abline(v=n/exp(1), col="red", lwd=3)
