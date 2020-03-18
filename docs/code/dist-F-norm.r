### F分布の特徴付け: カイ二乗分布を利用して生成
set.seed(9012) # 乱数のシード値を指定
k1 <- 20
k2 <- 10
y1 <- rchisq(10000, df=k1) # 自由度20のカイ二乗分布
y2 <- rchisq(10000, df=k2) # 自由度10のカイ二乗分布
par(family="HiraginoSans-W4") # 日本語フォントの指定
hist((y1/k1)/(y2/k2), breaks=50, freq=FALSE, # 密度表示
     col="lightblue", border="white",
     main=bquote(paste(frac(Y[1]/k[1],Y[2]/k[2]),
                       " (",k[1]==.(k1),
                       ", ",k[2]==.(k2),")"))) 
curve(df(x, df1=k1, df2=k2), # 確率密度関数(理論)
      add=TRUE, col="red", lwd=2) 
legend("topright", inset=0.1,
       legend=c("観測値", "理論値"), 
       col=c("lightblue", "red"), lwd=3)
