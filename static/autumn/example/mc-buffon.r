### Buffonの針

## 針を投げる試行
myTrial <- function(d,l,verbose=FALSE){ # dとlを指定する
    x <- runif(1,min=-d/2,max=d/2)
    theta <- runif(1,min=0,max=2*pi)
    cross <- FALSE # 交わったかどうかを示す変数
    if((x+l*cos(theta)/2)*(x-l*cos(theta)/2)<0){
        cross <- TRUE # 交わった場合に書き換え
    }
    if(verbose==TRUE){
        return(c(x=x,theta=theta,cross=as.numeric(cross)))
    } else {
        return(cross)
    }
}

## 試行を行ってみる
d <- 10
l <- 5
myTrial(d,l,verbose=TRUE)
myTrial(d,l,verbose=TRUE)

## 絵にしてみる
plot(c(0,0),type="n", # 空のキャンバスを作る
     xlim=c(-d,d),asp=1,ann=FALSE,axes=FALSE)
abline(v=c(-10,0,10),col="blue") # 線を引く
for (i in 1:10) {
    obs <- myTrial(d,l,verbose=TRUE)
    x <- obs["x"]
    theta <- obs["theta"]
    y <- runif(1,min=-d/2,max=d/2) # y座標は適当にばらまく
    x1 <- x-l/2*cos(theta)
    x2 <- x+l/2*cos(theta)
    y1 <- y-l/2*sin(theta)
    y2 <- y+l/2*sin(theta)
    lines(c(x1,x2),c(y1,y2), 
          col=ifelse(x1*x2<0,"red","green"),
          lty = "solid", lwd = 2)
}

## Monte-Carlo simulation
## set.seed(8888) # 実験を再現したい場合はシードを指定する
mc <- 10000 # 回数を設定 
myData <- replicate(mc,myTrial(d,l)) 

## 簡単な集計
table(myData) # 頻度 (TRUEが針の交わった回数)
table(myData)/mc # 確率(推定値)
print((2*l)/(pi*d)) # 針の交わる確率 (理論値)
