### datasets::airquality を用いた描画例
## オゾン量のヒストグラムを描く 
ggplot(airquality, aes(Ozone)) +
    geom_histogram(bins=25, na.rm=TRUE) # ビンの数を指定
## オゾン量のヒストグラムを折れ線で描く 
ggplot(airquality, aes(Ozone)) +
    geom_freqpoly(binwidth=5, colour="blue", na.rm=TRUE) # ビンの幅を指定
### MASS::UScereal を用いた描画例
## 会社毎のカロリーを詰み上げてヒストグラムを描く
ggplot(UScereal, aes(calories)) +
    geom_histogram(binwidth=30, aes(fill=mfr))
## 会社別の頻度(..density..)を折れ線で描く
ggplot(UScereal, aes(calories, ..density.., colour=mfr)) +
    geom_freqpoly(binwidth=20)
