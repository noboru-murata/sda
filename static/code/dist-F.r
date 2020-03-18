### F分布
set.seed(1) # 乱数の初期値を指定
rf(10, df1=4, df2=7) # 自由度4,7のF分布に従う乱数を10個発生
## 統計的性質の確認
nu1 <- 7
nu2 <- 12
x <- rf(10000, df1=nu1, df2=nu2) # 自由度4,7のF乱数を10000個生成
mean(x) # nu2/(nu2-2)=1.2に近い(大数の法則)
par(family="HiraginoSans-W4") # 日本語フォントの指定
hist(x, freq=FALSE, breaks=50, col="gray", border="white", 
     main=paste0("F分布(自由度", nu1, ",", nu2, ")")) # ヒストグラム(密度表示)
curve(df(x, df1=nu1, df2=nu2), add=TRUE, 
      col="red", lwd=2) # 理論上の確率密度関数
legend(7, 0.6, legend=c("観測値", "理論値"), 
       col=c("gray", "red"), lwd=3) # 凡例を作成
