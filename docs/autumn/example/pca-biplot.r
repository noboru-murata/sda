### 主成分分析の視覚化

### 総務省統計局の統計データによる例
## データの読み込み
mydata <- read.csv(file="data/japan-living.csv", row.names=1, header=TRUE)
est <- prcomp(mydata, scale=TRUE)      # 主成分分析の実行
biplot(est,cex=c(0.6, 0.7), scale=0) # バイプロット(第1 vs 第2主成分)
## 第1主成分方向の正の向きには大都市をもつ県が集中
## 人口割合, 商品販売額および森林面積割合は１人当たり農業産出額とほぼ直交しており,
## 両者に関連はあまりないといえそう
## 第2主成分方向の正の向きには１人当たり農業産出額の上位県が集中
gross <- setNames(mydata$Gross.agricultural.product, row.names(mydata))
head(sort(gross,decreasing=TRUE))
biplot(est,choices=c(2,3),cex=c(0.6, 0.7), scale=0) # バイプロット(第2 vs 第3主成分)
## 第3主成分方向の負の向きには土地生産性の上位県が集中
land <- setNames(mydata$Land.productivity, row.names(mydata))
head(sort(land,decreasing=TRUE))
## 北海道の土地生産性は低い
head(sort(land))

## パッケージggfortifyによるバイプロット
## install.packages("ggfortify") # 必要であればインストール
require(ggfortify) # パッケージのロード
autoplot(est, shape=FALSE, label=TRUE, loadings=TRUE, 
         loadings.label=TRUE,label.size=3, scale=0, 
         loadings.label.size=4) # バイプロット(第1 vs 第2主成分)
autoplot(est, shape=FALSE, label=TRUE, loadings=TRUE, 
         loadings.label=TRUE,label.size=3, scale=0, 
         loadings.label.size=4, x=2, y=3) # バイプロット(第2 vs 第3主成分)
