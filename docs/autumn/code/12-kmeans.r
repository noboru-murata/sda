### 非階層的クラスタリング

### datasets::iris に対するk-平均法
## クラスラベルSpeciesを他の変数から正確に予測できるか検証
x <- subset(iris, select = -Species) # 変数の抽出
## k-平均法の実行
set.seed(123)
est <- kmeans(x, centers=3, nstart=20) # k=3, 初期値は20通り試す
## 結果の確認
table(iris$Species[est$cluster==1]) # setosa
table(iris$Species[est$cluster==2]) # virginica
table(iris$Species[est$cluster==3]) # versicolor
## クラスタリングの状況を散布図上で図示
plot(x,col=rainbow(3)[est$cluster])
## k-平均法の実行: データを標準化した場合
set.seed(123)
est <- kmeans(scale(x), centers=3, nstart=20)
## 結果の確認
table(iris$Species[est$cluster==1]) # setosa
table(iris$Species[est$cluster==2]) # virginica
table(iris$Species[est$cluster==3]) # versicolor
## 標準化しない方が良好な結果が得られている

## k-平均法の実行: k=2としてみた場合
set.seed(123)
est <- kmeans(x, centers=2, nstart=20) 
## 結果の確認
table(iris$Species[est$cluster==1]) # setosa
table(iris$Species[est$cluster==2]) # virginica, versicolor

### 総務省統計局の統計データによる例
mydata <- read.csv(file="japan-living.csv",
                   fileEncoding="utf8",
                   row.names=1,
                   header=TRUE) 
## k-平均法の実行: 
k <- 7 # 分割数を指定
set.seed(123)
est <- kmeans(scale(mydata), centers=k, nstart=20)
## 結果の確認 (各クラスター内の県名を表示)
perf <- rownames(mydata) # 県名の取得
for(i in 1:k){
    cat("[ cluster",i,"]\n")
    print(perf[est$cluster==i])
}
## クラスタリングの状況を散布図上で図示
plot(mydata,col=rainbow(k)[est$cluster]) # pairs plot
plot(prcomp(mydata)$x,type="n") # PCAを利用して表示
text(prcomp(mydata)$x,labels=perf,
     cex=.8,col=rainbow(k)[est$cluster])
