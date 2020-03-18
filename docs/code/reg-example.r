### 線形回帰分析(単回帰)の例
### - Brain and Body Weights for 28 Species

## データの読み込み ("MASS::Animals"を用いる)
library(MASS) # パッケージの読み込み
data(Animals)

## データの内容を確認
help(Animals)  # 内容の詳細を表示 
str(Animals)   # データの構造を表示
print(Animals) # データの表示

## データのプロット (normal plot)
plot(Animals,ann=FALSE) # タイトルやラベルを付けない(ann=FALSE)
title(main="Brain and Body Weights (normal plot)",
      xlab="body [kg]", ylab="brain [g]")
## データのプロット (log-log plot)
plot(Animals,log="xy",ann=FALSE)
title(main="Brain and Body Weights (log-log plot)",
      xlab="body [kg]", ylab="brain [g]")

## 回帰分析 (単回帰)
model <- lm(log(brain) ~ log(body), data=Animals)
summary(model) # 分析結果のまとめを表示

## 回帰式および信頼区間・予測区間の表示
plot(Animals,log="xy",ann=FALSE) 
## 区間推定
r.x <- with(Animals,range(log(body))) # x軸の範囲を取得
x <- seq(r.x[1],r.x[2],length=50)
y <- predict(model,newdata=data.frame(body=exp(x)),
             interval="confidence") 
yp <- predict(model,newdata=data.frame(body=exp(x)),
              interval="prediction")
## グラフ表示 (lty:スタイル，lwd:太さ，col:色)
matlines(exp(x),exp(y), # 信頼区間
         lty=c("solid","dashed","dashed"),lwd=2,
	 col=c("red","blue","blue")) 
matlines(exp(x),exp(yp[,c("lwr","upr")]), # 予測区間
         lty=c("dashed","dashed"),lwd=2,
	 col=c("orange","orange"))
title(main="Brain and Body Weights", # タイトル
      xlab="body [kg]", ylab="brain [g]")
legend("bottomright",inset=.05, # 凡例の作成
       legend=c("fitted values","conf intvl (95%)","pred intvl (95%)"),
       col=c("red","blue","orange"),lty=1,lwd=2)

## 診断プロット
plot(model)

## 外れ値を除いた回帰分析
idx <- c(6,16,26) # 外れ値のindex
model <- lm(log(brain) ~ log(body),data=Animals,subset=-idx)
summary(model)

## 回帰式および信頼区間・予測区間の表示
plot(Animals,log="xy",ann=FALSE,col="gray",pch=19)
points(Animals[idx,],col="pink",pch=19)

## 区間推定
r.x <- with(Animals,range(log(body)))
x <- seq(r.x[1],r.x[2],length=50)
y <- predict(model,newdata=data.frame(body=exp(x)),
             interval="confidence") 
yp <- predict(model,newdata=data.frame(body=exp(x)),
              interval="prediction")

## グラフ表示
matlines(exp(x),exp(y),
         lty=c("solid","dashed","dashed"),lwd=2,
	 col=c("red","blue","blue"))
matlines(exp(x),exp(yp[,c("lwr","upr")]),
         lty=c("dashed","dashed"),lwd=2,
	 col=c("orange","orange"))
title(main="Brain and Body Weights (without outliers)",
      xlab="body [kg]", ylab="brain [g]")
legend("bottomright",inset=.05,
       legend=c("fitted values","conf intvl (95%)","pred intvl (95%)"),
       col=c("red","blue","orange"),lty=1,lwd=2)
## 種の名前をグラフ上に表示
text(Animals,labels=rownames(Animals),cex=0.75)
