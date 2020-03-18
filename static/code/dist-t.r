### t分布
set.seed(3)
rt(10, df=1) # 自由度1のt分布に従う乱数を10個発生
### 0から大きく離れた値が現れている(裾が重い)
mean(rt(10000, df=1)) # 自由度1のt分布は平均をもたないため, 大数の法則が成立しない
## 統計的性質の確認
nu <- 4
x <- rt(10000, df=nu) # 自由度4のt乱数を10000個発生
mean(x) # 0に近い(大数の法則)
par(family="HiraginoSans-W4") # 日本語フォントの指定
hist(x, freq=FALSE, breaks=50, col="gray", border="white", 
     main=paste0("t分布(自由度", nu, ")")) # ヒストグラム(密度表示)
curve(dt(x, df=nu), add=TRUE, 
      col="red", lwd=2) # 理論上の確率密度関数
legend(5, 0.3, legend=c("観測値", "理論値"), 
       col=c("gray", "red"), lwd=3) # 凡例を作成
### 0から大きく離れた値が現れている(裾が重い)
