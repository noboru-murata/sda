### 最尤法によるガンマ分布のパラメーターの区間推定
## ガンマ乱数から標本平均・標準偏差と平均の100(1-conf)%信頼区間の
## 上端・下端を計算する関数の作成
## 以下注意: ガンマ関数のパラメータalphaと区別して信頼係数はconfを使用
library(stats4) # 関数mleを利用するため
mle.gamma <- function(x, nu0=1, alpha0=1){ # 最尤推定で用いた定義を簡略化
  n <- length(x)
  ll <- function(nu, alpha) 
      suppressWarnings(-sum(dgamma(x, nu, alpha, log=TRUE)))
  est <- mle(minuslogl=ll, # 負の対数尤度関数
             start=list(nu=nu0, alpha=alpha0), # 初期値
             method="BFGS", nobs=n) 
  return(coef(est))
}
ci.gamma <- function(theta, n, conf=0.05){ # theta=(nu, alpha)
    ## nuの最尤推定量の漸近分散
    v1hat <- theta[1]/(theta[1]*trigamma(theta[1])-1)
    ## alphaの最尤推定量の漸近分散
    v2hat <- theta[2]^2*trigamma(theta[1])/
        (theta[1]*trigamma(theta[1])-1) 
    ui1 <- theta[1] + qnorm(1-conf/2)*sqrt(v1hat/n) # nuの上側信頼限界
    li1 <- theta[1] - qnorm(1-conf/2)*sqrt(v1hat/n) # nuの下側信頼限界
    ui2 <- theta[2] + qnorm(1-conf/2)*sqrt(v2hat/n) # alphaの上側信頼限界
    li2 <- theta[2] - qnorm(1-conf/2)*sqrt(v2hat/n) # alphaの下側信頼限界
    return(c(hat=theta[1], hat=theta[2], v=v1hat, v=v2hat,
             ui=ui1, li=li1, ui=ui2, li=li2))
}
myest <- function(x, conf=0.05){
    theta <- mle.gamma(x) # 最尤推定量
    return(ci.gamma(theta,length(x),conf))
}
## Monte-Carlo実験
set.seed(123) # 乱数のシード値の設定
nu <- 5
alpha <- 2
n <- 500   # データ数
mc <- 1000 # シミュレーション回数
result <- as.data.frame(t(
    replicate(mc, myest(rgamma(n, shape=nu, rate=alpha))) 
))
## 漸近正規性の確認
hist(sqrt(n)*(result$hat.nu-nu)/sqrt(result$v.nu), freq=FALSE, 
     col="lightblue", breaks=20, 
     xlab=expression(sqrt(n)*(hat(nu)-nu)/sqrt(v[nu])),
     main=expression(paste("Histogram of ",
                           sqrt(n)*(hat(nu)-nu)/sqrt(v[nu]))))
curve(dnorm, add=TRUE, col="red", lwd=2)
hist(sqrt(n)*(result$hat.alpha-alpha)/sqrt(result$v.alpha), freq=FALSE, 
     col="lightgreen", breaks=20, 
     xlab=expression(sqrt(n)*(hat(alpha)-alpha)/sqrt(v[alpha])),
     main=expression(paste("Histogram of ",
                           sqrt(n)*(hat(alpha)-alpha)/sqrt(v[alpha]))))
curve(dnorm, add=TRUE, col="red", lwd=2)
## 真のパラメーターが95%信頼区間に含まれている割合が約95%であることの確認
with(result, sum((nu<=ui.nu & nu>=li.nu)))/mc
with(result, sum((alpha<=ui.alpha & alpha>=li.alpha)))/mc
## はじめの10個の信頼区間の可視化
library(plotrix)
with(result, # 信頼区間と最尤推定値の図示
     plotCI(1:10, hat.nu[1:10], ui=ui.nu[1:10], li=li.nu[1:10],
            pch=4, axes=FALSE, xlab="", ylab=expression(nu), lwd=2)) 
axis(1, 1:10, 1:10) # x軸の追加
axis(2) # y軸の追加
abline(h=nu, col="red", lty="dashed", lwd=2) # 真のパラメータの図示
with(result, # 信頼区間と最尤推定値の図示
     plotCI(1:10, hat.alpha[1:10], ui=ui.alpha[1:10], li=li.alpha[1:10],
            pch=4, axes=FALSE, xlab="", ylab=expression(alpha), lwd=2)) 
axis(1, 1:10, 1:10) # x軸の追加
axis(2) # y軸の追加
abline(h=alpha, col="red", lty="dashed", lwd=2) # 真のパラメータの図示
## 実データへの適用
kikou <- read.csv("kikou2016.csv", fileEncoding="sjis")
x <- kikou$風速 # 風速のデータにガンマ分布をあてはめてみる
(theta <- mle.gamma(x)) # 最尤推定
ci <- ci.gamma(theta,length(x),conf=0.05)
c(ci["li.nu"], ci["ui.nu"])       # nuの95%信頼区間
c(ci["li.alpha"], ci["ui.alpha"]) # alphaの95%信頼区間
