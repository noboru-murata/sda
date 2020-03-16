### 主成分分析の評価

### datasets::attitude による例
est <- # 主成分分析
    prcomp( ~ . - rating, # rating を除く(-)
           data=attitude) # データフレームを指定
summary(est) # 第3主成分までの累積寄与率が80%を超えている
plot(est)    # スクリープロット (各主成分の分散を棒グラフで表示)

### 総務省統計局の統計データによる例
mydata <- # データの読み込み
    read.csv(file="japan-living.csv", # ファイル名
             row.names=1, # 1列目を行名
             header=TRUE) # 1行目を列名
est <- # 主成分分析
    prcomp(mydata,      # データフレーム全体を用いる
           scale.=TRUE) # データを正規化
summary(est) # 第3主成分までの累積寄与率が80%を超えている
plot(est)    # スクリープロット
## 正規化しなかった場合と比較してみよう
