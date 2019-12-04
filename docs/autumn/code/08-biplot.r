### 主成分分析の視覚化

### 総務省統計局の統計データによる例
mydata <- # データの読み込み
    read.csv(file="japan-living.csv", # ファイル名
             row.names=1, # 1列目を行名
             header=TRUE) # 1行目を列名
est <- # 主成分分析の実行
    prcomp(mydata,
           scale.=TRUE) # データを正規化      
biplot(est,cex=c(0.6, 0.7), # バイプロット(第1 vs 第2主成分)
       scale=0) # パラメタを0に設定
## 第1主成分方向の正の向きには大都市をもつ県が集中
## 人口割合, 商品販売額および森林面積割合は１人当たり農業産出額とほぼ直交しており,
## 両者に関連はあまりないといえそう
## 第2主成分方向の正の向きには１人当たり農業産出額の上位県が集中
gross <- # １人当たり農業産出額に行名を付けて取出
    setNames(mydata$Gross.agricultural.product,
             row.names(mydata))
head(sort(gross,decreasing=TRUE)) # 降順に並べてみる
biplot(est,choices=c(2,3), # バイプロット(第2 vs 第3主成分)
       cex=c(0.6, 0.7),    # 文字の大きさを調整
       scale=0)
## 第3主成分方向の負の向きには土地生産性の上位県が集中
land <- # 土地生産性に行名を付けて取出
    setNames(mydata$Land.productivity,
             row.names(mydata))
head(sort(land,decreasing=TRUE))
## 北海道の土地生産性は低い
head(sort(land))
