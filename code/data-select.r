### ベクトルの要素の指定
x <- c(4, 1, 2, 9, 8, 3, 6)
x[c(5,2)]     # 5番目と2番目の要素をこの順で抽出
x[-c(2,3,7)]  # 2,3,7番目以外の要素を表示
(idx <- x>3)  # 3より大きい要素はTRUE, 3以下はFALSE
which(idx)    # TRUEに対応する要素の番号を表示
x[idx]        # 3より大きい要素(TRUE)をすべて表示
x[x>3]        # 上と同じ
x[which(idx)] # 上と同じ
x[-c(2,3,7)]  # 2,3,7番目以外の要素を表示
x[c(2,5)] <- c(0,1) # 2番目と5番目の要素を0と1に置換
x
names(x) <- letters[1:length(x)]
## xの要素にアルファベットを順に名前をつける
x # 名前と内容を確認
x[c("b","e")] # 2番目と5番目の要素
### データフレームの要素の指定
### データ例 datasets::airquality (help(airquality))
### データにNA(欠損)があるので注意
dim(airquality)   # 大きさを確認
names(airquality) # 列名を表示
head(airquality)  # 最初の6行を表示
str(airquality)   # オブジェクトの構造を表示
airquality$Ozone>100 # Ozoneが100を超えるかどうか
which(airquality$Ozone>100)
## Ozoneが100を超える行の番号を抽出
which(airquality$Ozone>100 & airquality$Wind<=5)
## 複数の条件の AND
which(with(airquality, Ozone>100 & Wind<=5)) # 同上
which(with(airquality, Ozone>100 | Wind<=5)) # OR
airquality[which(airquality$Ozone>100), ] # 行の抽出
## airquality[airquality$Ozone>100, ] # NAのため不可
airquality[which(airquality$Ozone>100),
           c("Month","Day")] # 特定の列のみ表示
