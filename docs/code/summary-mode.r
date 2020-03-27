### 最頻値の計算
## モードを計算する関数の作成
myMode <- function(x){ # 注意:"mode"という関数は既にある
  return(names(which.max(table(x))))
}
## シミュレーションによる例
set.seed(123456) # 乱数のシード値を指定
x <- rpois(1000, lambda = 5) # 強度5のPoisson乱数
myMode(x) # モードの計算
table(x)  # 度数分布表の確認
## モードは数値以外のデータ(質的データ)にも適用可能
##  気象データの風に関するデータを例として使用
myData <- subset(read.csv("data/tokyo_weather.csv",
                          fileEncoding="utf8"), 
                 select=c(風速,最多風向))
head(myData)
myMode(myData$最多風向) # モードの計算
table(myData$最多風向)  # 度数分布表の確認
## modeest package を使うことも可能
##  modeest::mfv 離散データ
##  modeest::mlv 連続データ
