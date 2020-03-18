### 順序に基づく統計量の計算
## 気候データによる例
kikou <- read.csv("kikou2016.csv", fileEncoding="sjis") 
x <- kikou$気温 
mean(x) # 平均
median(x) # メディアン
quantile(x) # 最小・最大値および四分位点 
quantile(x, 0.5) # メディアンと同じ
quantile(x, c(0.25, 0.75)) # 第1四分位点および第3四分位点
fivenum(x) # 五数要約 (quantile(x)と同様，表示が異なる)
summary(x) # 五数要約に平均を加えて集約
## 分位点の計算方式の違いのため, quantileの結果と多少異なることに注意
y <- c(x, 1000) # データに外れ値を加えてみる
mean(y) # mean(x)と大きく異なる (外れ値の影響を受けやすい)
median(y) # median(x)とあまり変わらない (外れ値に頑健)
## データフレームに対しても同様の計算が可能
summary(kikou[ ,-c(1, 2)]) # 五数要約と平均を計算
