### 東京都の気象データによる例
require(MASS)
par(family="HiraginoSans-W4") # 日本語フォントの指定 (MacOSXの例)
x <- subset(subset=月%in%c(9,10), # 9月と10月を選択
            select=c(気温,湿度,月),
            x=read.csv(file="tokyo-weather.csv",header=TRUE))
plot(x$気温,x$湿度,pch=x$月,col=x$月,
     xlab="気温",ylab="湿度",
     main="9月と10月の判別 (訓練データ)")
idx <- seq(2,60,by = 2)
x.train <- x[idx,] # 訓練データ
x.test <- x[-idx,] # 試験データ
## 訓練データで判別関数を作成．等分散性を仮定
(myld <- lda(月 ~ 気温 + 湿度, data=x.train)) 
mypred<-predict(myld, newdata=x.test[,1:2]) # x.testを判別
table(true=x.test$月, pred=mypred$class)    # 真のクラスと予測されたクラスの比較
mypred$class # 9月/10月の予測を比較
x.test$月   # 主に月のかわりめに誤判別が起きている
## 結果の図示
plot(x$気温,x$湿度,pch=x$月,col=x$月,
     xlab="気温",ylab="湿度",
     main="9月と10月の判別 (試験データ)")
myline <- function(z) {
    a0<-as.vector(colMeans(z$means) %*% z$scaling)
    a<-c(a0/z$scaling[2],-z$scaling[1]/z$scaling[2])
    return(a)
}
abline(myline(myld),col="blue")
