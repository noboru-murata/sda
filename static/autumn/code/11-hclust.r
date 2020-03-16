### 階層的クラスタリング

### datasets::iris による例
## クラスラベルSpeciesを用いずに他の変数から的確な分類ができるか検証
x <- subset(iris, select = -Species) # 変数の抽出
## 階層的クラスタリング (ユークリッド距離，最長距離法)
dst <- dist(x) # ユークリッド距離(euclidean)が既定値
est <- hclust(dst) # 最長距離法(complete)が既定値
plot(est, labels=c("s","e","i")[iris$Species])
## 階層的クラスタリング (マンハッタン距離，最長距離法)
dst <- dist(x, method="manhattan") 
est <- hclust(dst)
plot(est, labels=c("s","e","i")[iris$Species])
## 階層的クラスタリング (ユークリッド距離，群平均法)
dst <- dist(x) 
est <- hclust(dst, method="average")
plot(est, labels=c("s","e","i")[iris$Species])
## クラスタリングの評価
clust <- cutree(est,3) # 3つに類別
table(iris$Species[clust==1]) # setosa
table(iris$Species[clust==2]) # versicolor
table(iris$Species[clust==3]) # virginica

### 総務省統計局の統計データによる例
## http://www.stat.go.jp/data/shihyou/naiyou.htm
## 社会生活統計指標－都道府県の指標－2017 社会生活統計指標 2017年2月17日公表
## http://www.e-stat.go.jp/SG1/estat/List.do?bid=000001083999&cycode=0
## 1. Ratio of forest area
##    森林面積割合 [2014; %] 
## 2. Gross agricultural product per agricultural worker
##    就業者１人当たり農業産出額(販売農家）[2014; 万円]
## 3. Percentage distribution by prefecture
##    全国総人口に占める人口割合 [2015; %]
## 4. Land productivity
##    土地生産性（耕地面積１ヘクタール当たり）[2014; 万円]
## 5. Annual sales of commercial goods
##    商業年間商品販売額［卸売業＋小売業］（事業所当たり）[2013; 百万円]
mydata <- read.csv(file="japan-living.csv",
                   fileEncoding="utf8",
                   row.names=1,
                   header=TRUE) 
## 階層的クラスタリングの実行:
dst <- dist(scale(mydata)) # 正規化してユークリッド距離を測る
est <- hclust(dst, method="average") # 群平均法
## est <- hclust(dst, method="ward.D2") # Ward法
plot(est) # デンドログラムの表示
## 結果の確認 (各クラスター内の県名を表示)
k <- 7 # 分割数を指定
clust <- cutree(est,k) # デンドログラムを分割
perf <- rownames(mydata) # 県名の取得
for(i in 1:k){
    cat("[ cluster",i,"]\n")
    print(perf[clust==i])
}
