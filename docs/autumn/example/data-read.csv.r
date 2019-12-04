### 関数read.csvの使い方
(newdata <- read.csv(file="mydata.csv",row.names=1)) # csvファイルの読み込み
dim(newdata) # 大きさを確認

### 東京都の2016年の気候データによる例 (kikou2016.csv)
###  気象庁のホームページより取得
###  http://www.data.jma.go.jp/gmd/risk/obsdl/index.php
###  東京都の2016年の各日の
###     平均気温(℃)・降水量(mm)・全天日射量(MJ/u)・平均風速(m/s)
kikou <- read.csv("kikou2016.csv",
                  fileEncoding="sjis") # 文字コードがShift-JISのため
head(kikou)     # データの最初の6行を表示
dim(kikou)      # 大きさを確認
colnames(kikou) # 列名を確認
