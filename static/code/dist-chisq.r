### χ2分布
set.seed(20) # 乱数の初期値を指定
rchisq(10, df=1) # 自由度1のカイ二乗分布に従う乱数を10個発生
## 統計的性質の確認
k <- 4 # 自由度
x <- rchisq(10000, df=k) # 自由度4のカイ二乗乱数を10000個発生
mean(x) # k=4に近い(大数の法則)
par(family="HiraginoSans-W4") # 日本語フォントの指定
hist(x, freq=FALSE, breaks=50, col="gray", border="white", 
     main=bquote(paste(chi^2, "分布(自由度", .(k), ")"))) # ヒストグラム(密度表示)
curve(dchisq(x, k), add=TRUE, col="red", lwd=3) # 理論上の確率密度関数
legend(15, 0.16, legend=c("観測値", "理論値"), 
       col=c("gray", "red"), lwd=3) # 凡例を作成
