### datasets::airquality を用いた描画例
require(MASS) # パッケージの読み込み
require(tidyverse) # 読み込む順番にも注意が必要
## 日射量とオゾン量の関係を見ために散布図を描く
ggplot(airquality, aes(Solar.R, Ozone)) +
    geom_point(colour="red", size=2, na.rm=TRUE) + # 点の色とサイズを指定
    labs(title="New York Air Quality Measurements") # タイトルを追加
## 月毎に色分けする
ggplot(airquality, aes(Solar.R, Ozone)) +
    geom_point(aes(colour=factor(Month)), size=2, na.rm=TRUE)
### MASS::UScereal を用いた描画例
## 会社別に糖分，カロリー，脂肪分の関係性を見る
ggplot(UScereal, aes(sugars, calories)) +
    geom_point(aes(size=fat, colour=mfr)) # 脂肪分の違いを点のサイズで表示
## 糖分，カロリー，脂肪分，繊維質の関係性を見る
ggplot(UScereal, aes(sugars, calories)) +
    geom_point(aes(size=fat, colour=fibre)) # 繊維質の量を点の色で表示
