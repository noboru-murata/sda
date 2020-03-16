### 関数read.csvの使い方
(newdata <- read.csv(file="myData.csv", # 読み込み
                     row.names=1)) # 1列目を行の名前
dim(newdata) # 大きさを確認

### 東京都の気候データによる例 (tokyo_weather.csv)
## 気象庁のホームページより取得
## https://www.data.jma.go.jp/gmd/risk/obsdl/
## 地点・東京における平均気温(℃)・降水量(mm)など
myData <- read.csv("data/tokyo_weather.csv",
                   fileEncoding="utf8") # 文字コード
head(myData)     # データの最初の6行を表示
dim(myData)      # 大きさを確認
colnames(myData) # 列名を確認
