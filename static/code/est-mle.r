### ガンマ分布の最尤推定
library(stats4) # 関数mleを利用するため
## 観測データから最尤推定量を計算する関数の作成
## x: 観測データ, nu0: nuの初期値, alpha0: alphaの初期値
## 数値的最適化のためには尤度関数を最初に評価する初期値が必要
mle.gamma <- function(x, nu0=1, alpha0=1, verbose=FALSE){ 
  n <- length(x)
  # 負の対数尤度関数を定義 (最小化を考えるため)
  # suppressWarningsで定義域外で評価された際の警告を表示させない
  ll <- function(nu, alpha) 
    suppressWarnings(-sum(dgamma(x, nu, alpha, log=TRUE)))
  # 最尤推定
  est <- mle(minuslogl=ll, # 負の対数尤度関数
             start=list(nu=nu0, alpha=alpha0), # 初期値
             method="BFGS", nobs=n) # 最適化方法は選択可能
  if(verbose) { 
      return(est) # verbose=TRUEならmleの結果を全て返す
  } else {
      return(coef(est)) # 推定値のみ返す
  }
}
## シミュレーションによる一致性の検証
set.seed(123) # 乱数のシード値の指定
nu <- 5
alpha <- 2
n <- 100 # データ数
x <- rgamma(n, shape=nu, rate=alpha) 
mle.gamma(x)
## 複数回行なった場合のヒストグラムの描画
mc <- 1000 # 各実験の繰り返し回数
for(n in c(10, 100, 1000)){ # データ数を変えて実験
    ## Monte-Carlo実験
    theta <- data.frame(t( # 推定値のdata.frame
        replicate(mc, mle.gamma(rgamma(n, nu, alpha)))
    ))
    ## 結果をヒストグラムで表示
    hist(theta$nu, breaks=20, col="lightblue", border="lightblue",
         xlim=c(0, 20), main=paste0("n=",n), xlab=expression(nu))
    abline(h=0, lwd=2, lty="dotted")
    abline(v=nu, col="red", lwd=2, lty="dotted")
    hist(theta$alpha, breaks=20, col="lightgreen", border="lightgreen",
         xlim=c(0, 10), main=paste0("n=",n), xlab=expression(alpha))
    abline(h=0, lwd=2, lty="dotted")
    abline(v=alpha, col="red", lwd=2, lty="dotted")
}
## 実データへの適用
kikou <- read.csv("kikou2016.csv", fileEncoding="sjis")
x <- kikou$風速 # 風速のデータにガンマ分布をあてはめてみる
par(family="HiraginoSans-W4") # 日本語フォントの指定
hist(x, freq=FALSE, breaks=20, col="gray", # ヒストグラム(確率値)の描画
     main="風速のヒストグラム", xlab="風速 [m/s]", ylab="確率") 
(theta <- mle.gamma(x)) # 最尤推定
curve(dgamma(x, theta[1], theta[2]), # あてはめたガンマ分布の密度関数
      add=TRUE, col="red", lwd=2) 
