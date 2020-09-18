### 主成分分析の評価

### datasets::attitude による例
est <- prcomp( ~ . - rating, data=attitude) 
summary(est) # 第3主成分までの累積寄与率が80%を超える
plot(est)    # スクリープロット(各主成分の分散の棒グラフ)

### 総務省統計局の統計データによる例
## データの読み込み
mydata <- read.csv(file="data/japan-living.csv",
                   row.names=1, header=TRUE)
est <- prcomp(mydata, scale.=TRUE) # データを正規化
summary(est) # 第3主成分までの累積寄与率が80%を超える
plot(est)    # スクリープロット
