### 東京都の気候による例
mydata <- subset(subset = 月%in%7:9,
                 select = c(気温,降水量,日射量,風速,湿度,雲量),
                 x=read.csv("data/tokyo_weather.csv",
                            fileEncoding="utf8"))
## 気温を目的変数, それ以外を説明変数
est1 <- lm(気温 ~ ., data=mydata)
summary(est1)
## 気温を目的変数, 風速と湿度を説明変数から除く
est2 <- lm(気温 ~ . -風速 -湿度, data=mydata)
summary(est2)
## 気温を目的変数, さらに切片を除く
## 原点を通るため決定係数は一見高くなる場合があるので注意
est3 <- lm(気温 ~ . -風速 -湿度 -1, data=mydata)
summary(est3)

## 結果を図示
if(Sys.info()["sysname"]=="Darwin") { # MacOSの場合
    par(family="HiraginoSans-W4")}    # 日本語フォント
plot(mydata$気温, predict(est1),
     col="orange", pch=17,  # 三角 
     xlab="気温", ylab="予測値")
points(mydata$気温, predict(est2),
       col="green", pch=15) # 四角
points(mydata$気温, predict(est3),
       col="blue", pch=16)  # 丸
abline(0,1,col="gray",lwd=1)
legend("topleft",inset=.05, # 凡例の作成
       col=c("orange","green","blue"), pch=c(17,15,16), 
       legend=c("モデル1","モデル2","モデル3"))
