### クラスタ分析の評価の例

### 総務省統計局の統計データによる例
## データの読み込み
mydata <- read.csv(file="japan-living.csv",
                   fileEncoding="utf8",
                   row.names=1,
                   header=TRUE) 
## cluster package の関数を利用する
require(cluster)
## 距離計算 (cluster package の距離を利用)
dst <- daisy(mydata,stand=TRUE) # ユークリッド距離，標準化
## その他の距離の計算方法の例
## dst <- daisy(mydata) # ユークリッド距離，標準化なし 
## dst <- daisy(mydata,method="manhattan",stand=TRUE) # マンハッタン
## dst <- daisy(mydata,method="gower") # 数値でない変数用

## 階層的クラスタリング
hclst <- agnes(dst) # 分割的方法を用いるdianaという関数もある
plot(hclst, which.plot=2, cex=0.8, # dendrogram
     main="Dendrogram of mydata")
plot(hclst, which.plot=1, # banner plot
     main="Dendrogram of mydata")

## 非階層的クラスタリング (クラスタ数を指定する)
nhclst <- pam(dst,k=3) # claraという関数もある
## nhclst <- clara(mydata,k=3) # claraは大規模なデータフレームを対象
## summary(nhclst) # 結果の詳細が表示される
plot(nhclst, which.plot=1, # scatter plot
     main="Clustering mydata")
plot(nhclst, which.plot=2, # silhouette plot
     main="Clustering mydata")

## さまざまなクラスタ数で平均シルエット係数を確認
summary(pam(dst,k=3))$silinfo$avg.width
summary(pam(dst,k=4))$silinfo$avg.width
summary(pam(dst,k=5))$silinfo$avg.width
summary(pam(dst,k=6))$silinfo$avg.width
## k=4が良さそう
nhclst <- pam(dst,k=4)
plot(nhclst, which.plot=1, labels=2)
plot(nhclst, which.plot=2)
