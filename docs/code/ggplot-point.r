### datasets::airquality を用いた描画例
library(MASS) # パッケージの読み込み
library(tidyverse) # 読み込む順番にも注意が必要
## 日射量とオゾン量の関係を見るために散布図を描く
ggplot(airquality, aes(Solar.R, Ozone)) +
    geom_point(colour="red", size=2, # 色とサイズを指定
               na.rm=TRUE) + 
    labs(title="New York Air Quality Measurements") 
ggplot(airquality, aes(Solar.R, Ozone)) +
    geom_point(aes(colour=factor(Month)), # 月毎に色分け
               size=2, na.rm=TRUE)
### MASS::UScereal を用いた描画例
## 会社別に糖分，カロリー，脂肪分の関係性を見る
ggplot(UScereal, aes(sugars, calories)) +
    geom_point(aes(size=fat, # サイズと脂肪分を対応付け
                   colour=mfr)) # 色と会社を対応付け
## 糖分，カロリー，脂肪分，繊維質の関係性を見る
ggplot(UScereal, aes(sugars, calories)) +
    geom_point(aes(size=fat, 
                   colour=fibre)) # 色と繊維質を対応付け
