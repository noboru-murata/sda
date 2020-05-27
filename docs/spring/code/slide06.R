### 第6回 演習問題解答例

### 例題1
### 平均と分散の計算

p <- rep(c(1/9,2/9),3) # 確率の値 (1/9 と 2/9 を交互に3回繰り返す)
x <- 1:6 # サイコロの目の値
(mu <- sum(x*p)) # 平均値の計算
(var <- sum((x-mu)^2*p)) # 分散の計算
sqrt(var) # 標準偏差

### 練習1
### 大数の法則
set.seed(121212) # 乱数のシード値の指定
## 試行(離散分布の標本平均の計算)を定義する
myMean <- function(n,p) # 標本平均を計算する関数
    mean(sample(omega, size=n, prob=p, replace=TRUE))
omega <- 1:6 # 以下サイコロの場合で実験

## 基本の実験
p <- rep(1:2, 3) # 出現確率の比(奇数1:偶数2)
mu <- weighted.mean(omega, p) # 理論上の平均
mc <- 1000 # Monte-Carlo実験の繰り返し回数
n <- 10 # 標本数
xbars <- replicate(mc, myMean(n,p)) 
hist(xbars, breaks=20,
     col="azure", border="lightblue",
     xlim=c(1,6), ylim=c(0,200), # 描画範囲を指定
     xlab=expression(bar(X)[n]), 
     main=paste0("n=",n)) # 回数をタイトルに表示
abline(v=mu, col="red", lwd=2, lty="dotted") # 理論値
abline(h=0, col="grey", lwd=2, lty="solid")

## 乱数のシードによる違いを比較
n <- 100 # 標本数
for(i in c(12,34,56,78,90)){ # シード値を指定
    set.seed(i)
    xbars <- replicate(mc, myMean(n,p)) # mc回繰り返し
    hist(xbars, breaks=20,
	 col="azure", border="lightblue",
	 xlim=c(1,6), ylim=c(0,200), 
	 xlab=expression(bar(X)[n]), 
	 main=paste0("n=",n)) 
    abline(v=mu, col="red", lwd=2, lty="dotted")
    abline(h=0, col="grey", lwd=2, lty="solid")
}

## 出現確率の違いを比較
n <- 100 # 標本数
for(i in 1:5){ # pをランダムに設定して実験
    p <- runif(length(omega)) # 一様乱数で出現確率を設定
    mu <- weighted.mean(omega, p) # 理論上の平均
    xbars <- replicate(mc, myMean(n,p)) # mc回繰り返し
    hist(xbars, breaks=20,
	 col="azure", border="lightblue",
	 xlim=c(1,6), ylim=c(0,200), 
	 xlab=expression(bar(X)[n]), 
	 main=paste0("n=",n)) 
    abline(v=mu, col="red", lwd=2, lty="dotted")
    abline(h=0, col="grey", lwd=2, lty="solid")
}

## サンプル数の違いを比較
p <- rep(1:2, 3) # 出現確率は元の設定
mu <- weighted.mean(omega, p) # 理論上の平均
for(n in c(10,100,1000)){ # サンプル数を変えて実験
    xbars <- replicate(mc, myMean(n,p)) # mc回繰り返し
    hist(xbars, breaks=20,
	 col="azure", border="lightblue",
	 xlim=c(1,6), ylim=c(0,200),
	 xlab=expression(bar(X)[n]), 
	 main=paste0("n=",n)) 
    abline(v=mu, col="red", lwd=2, lty="dotted")
    abline(h=0, col="grey", lwd=2, lty="solid")
}

### 中心極限定理
set.seed(232323)    # 乱数のシード値の指定
## 試行(離散分布の標本平均の計算)を定義する
myMean <- function(n,p) # 標本平均を計算する関数
    mean(sample(omega, size=n, prob=p, replace=TRUE))
omega <- 1:6 # 以下サイコロの場合で実験
mc <- 10000 # Monte-Carlo実験の繰り返し回数

## 出現確率の違いを比較
n <- 1000 # 標本数
for(i in 1:5){ # pをランダムに設定して実験
    p <- runif(length(omega)) # 一様乱数で出現確率を設定
    mu <- weighted.mean(omega, p) # 理論上の平均
    sigma <- sqrt( # 理論上の標準偏差(分散の平方根)
        weighted.mean(omega^2,p)-mu^2)
    xbars <- replicate(mc, myMean(n,p)) 
    hist(sqrt(n)*(xbars - mu)/sigma, breaks=30,
         freq=FALSE, 
         xlim=c(-3, 3), ylim=c(0,0.55),  
         col="orange", border="orchid",
         xlab=expression(sqrt(n)*(bar(X)[n]-mu)/sigma),
         main=paste0("n=",n))
    curve(dnorm, add=TRUE, col="red", lwd=2) 
}

## サンプル数の違いを比較
p <- rep(1:2, 3) # 出現確率の比(奇数1:偶数2) (9で割らなくても大丈夫)
(mu <- weighted.mean(omega, p)) # 理論上の平均
(sigma <- sqrt( # 理論上の標準偏差(分散の平方根)
     weighted.mean(omega^2,p)-mu^2)) 
for(n in c(1,10,100,1000)){ # サンプル数を変えて実験
    xbars <- replicate(mc, myMean(n,p)) # mc回繰り返し
    hist(sqrt(n)*(xbars - mu)/sigma, breaks=30,
         freq=FALSE, # 密度で表示
         xlim=c(-3, 3), ylim=c(0,0.55),  
         col="orange", border="orchid",
         xlab=expression(sqrt(n)*(bar(X)[n]-mu)/sigma),
         main=paste0("n=",n))
    curve(dnorm, add=TRUE, col="red", lwd=2) # 理論曲線
}

### 少数の法則
set.seed(343434) # 乱数のシード値の指定

## 基本の実験
n <- 5000    # 1日の総生産量
p <- 0.002   # 不良品の発生確率
N <- 5*50*2  # 観測日数(週5日x50週間x2年操業に対応)
x <- rbinom(N,n,p) # 不良品数
## x <- replicate(N, rbinom(1,n,p)) # これでも同じ
(myData <- table(x)) # 不良品数の度数分布表を作成
## それぞれの不良品数が生じた日数の割合のグラフを作成
par(family = "HiraginoSans-W4") # 日本語フォントの指定
plot(myData/N, type="h", col="royalblue", lwd=6, 
     xlab="不良品数", ylab="発生割合")
lines(min(x):max(x)+0.4, dpois(min(x):max(x),n*p),
      type="h", col="red", lwd=6) # 理論上の割合
legend("topright", inset=1/20, # 右上に配置
       legend=c("観測値", "理論値"), 
       col=c("royalblue", "red"), lwd=4) # 凡例

## nの違いを比較
p <- 0.002
for(n in c(500,1000,5000,10000)){
  x <- rbinom(N,n,p) # 不良品数
  myData <- table(x)/N # 集計
  par(family = "HiraginoSans-W4") 
  plot(myData, type="h", col="royalblue", lwd=6, 
       xlab="不良品数", ylab="発生割合",
       main=paste("n =",n,"p =",p))
  lines(min(x):max(x)+0.4, dpois(min(x):max(x),n*p),
      type="h", col="red", lwd=6) 
}

## pの違いを比較
n <- 5000
for(p in c(0.001,0.002,0.005,0.01)){
  x <- rbinom(N,n,p) # 不良品数
  myData <- table(x)/N # 集計
  par(family = "HiraginoSans-W4") 
  plot(myData, type="h", col="royalblue", lwd=6, 
       xlab="不良品数", ylab="発生割合",
       main=paste("n =",n,"p =",p))
  lines(min(x):max(x)+0.4, dpois(min(x):max(x),n*p),
      type="h", col="red", lwd=6) 
}
