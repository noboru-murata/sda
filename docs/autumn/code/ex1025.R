###  第5回 演習 解答例

### datasets::LifeCycleSavings の例 
## データの素性を確認
?LifeCycleSavings # 各国の個人貯蓄のデータ
## 変数間の関係を図示(pairs plot)
pairs(LifeCycleSavings, panel=panel.smooth, # 大雑把な回帰曲線を添える
      main = "LifeCycleSavings data")
## 個人貯蓄を残りのデータ(年齢人口比と可処分所得)を用いて回帰
model1 <- sr ~ pop15 + pop75 + dpi + ddpi
est1 <- lm(model1, data=LifeCycleSavings, y=TRUE)
## 推定結果の評価
summary(est1)
## f-統計量: モデルの無効性は棄却される
## R^2値: 寄与率は30%程度で，あまり良好ではない
## t-統計量: pop15と可処分所得の成長率は有意

## 診断プロット
plot(est1)
## 残差に妙な偏りはなさそう (表示は残差の大きい3国)
## 残差の正規性は問題なさそう
## 標準化残差の絶対値は1の前後で偏りはなさそう
## テコ比が大きくて残差が大きいものは外れ値として注意

## 観測値と予測値の比較
with(est1,{ # ブロック化して複数の関数をまとめて実行
    plot(fitted.values,y,col="cyan",
         xlab="fitted",ylab="observed")
    text(fitted.values,y,labels=names(y))
    abline(coef=c(0,1),col="red",lwd=2)
})
## 回帰式は，日本などを過小評価，チリなどを過大評価している

## t-統計量で有意とみなせたデータのみで回帰
model2 <- sr ~ pop15 + ddpi
est2 <- lm(model2, data=LifeCycleSavings, y=TRUE)
summary(est2)
plot(est2)
with(est2,{ 
    plot(fitted.values,y,col="cyan",
         xlab="fitted",ylab="observed")
    text(fitted.values,y,labels=names(y))
    abline(coef=c(0,1),col="red",lwd=2)
})

## 外れ値を除去してみる
idx <- c(23,46,49) # Japan,Zambia,Libya
est3 <- lm(model2, data=LifeCycleSavings, subset=-idx,y=TRUE)
summary(est3)
plot(est3)
with(est3,{
    plot(fitted.values,y,col="cyan",
         xlab="fitted",ylab="observed")
    text(fitted.values,y,labels=names(y))
    abline(coef=c(0,1),col="red",lwd=2)
})

### Monte-Carloによる回帰係数の分布の確認
## 人工データの作成
## モデル: y = 1 - 2 * x1
set.seed(753)  # 乱数のシード値の設定
n <- 50        # データ数
x1 <- runif(n) # 説明変数x1の観測データ
x2 <- runif(n) # (不要な)説明変数x2の観測データ
mc <- 10000    # MC実験回数を設定
## 統計量の比較のための関数
tHist <- function(dat,var){
    plot(function(x)dt(x,df=n-3),
         xlim=range(c(dat,-4,4)),
         col="blue",main=paste0("t-stat (",var,")"))
    hist(dat,add=TRUE,freq=FALSE,col="lightblue")}
FHist <- function(dat){
    plot(function(x)df(x,df1=2,df2=n-3),
         xlim=range(c(dat,-4,4)),
         col="blue",main="F-stat")
    hist(dat,add=TRUE,freq=FALSE,col="lightblue")}
## 必要な変数を含むモデルでの実験
myData <- replicate(mc,{   # 実験ブロック (関数を定義してもよい)
    e <- rnorm(n, sd=0.3)  # 誤差項
    y <- 1 - 2 * x1 + e    # 目的変数の観測データ
    est <- lm(y ~ x1 + x2) # x1とx2のモデル
    c(summary(est)$coef[,3],summary(est)$fstat[1])
}) # 実験ブロックの最後の行が繰り返し保存される
## 実験結果の表示
tHist(myData[1,],"intercept") # 切片のt統計量の分布
tHist(myData[2,],"x1")        # x1(必要な変数)のt統計量の分布
tHist(myData[3,],"x2")        # x2(不要な変数)のt統計量の分布
FHist(myData[4,])             # F統計量の分布
