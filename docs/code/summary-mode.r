### 最頻値の計算
## モードを計算するための関数の作成
myMode <- function(x){ # 注意:"mode"という関数は既にある
  return(names(which.max(table(x))))
}
## シミュレーションによる例
set.seed(123)
x <- rpois(1000, lambda = 5) # 強度5のPoisson乱数を1000個発生
myMode(x) # モードの計算
table(x)  # 度数分布表の確認
## モードは数値以外のデータ(質的データ)にも適用可能
##  東京都2017年の日別の風に関するデータ tokyo_wind.csv による例
##  気象庁のホームページより取得して整理したもの
##  http://www.data.jma.go.jp/gmd/risk/obsdl/index.php
##  東京都の2017年の各日の最多風向(16方位)と風速(m/s)を記録
wind <- read.csv("tokyo_wind.csv", fileEncoding="utf8")
head(wind)
myMode(wind$最多風向) # モードの計算
table(wind$最多風向)  # 度数分布表の確認
## modeest package を使うことも可能
##  modeest::mfv 離散データ
##  modeest::mlv 連続データ
