### データの集計
sum(1:100) # 1から100までの整数の総和

### 気候データによる例
kikou <- read.csv("kikou2016.csv", fileEncoding = "sjis")
kion <- kikou$気温 # 気温を取り出す
mean(kion) # 平均気温の計算
max(kion)  # 最大値
min(kion)  # 最小値
