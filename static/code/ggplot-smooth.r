### datasets::airquality を用いた描画例
## 温度とオゾン量の関係を回帰曲線を描く
ggplot(airquality, aes(Temp, Ozone)) +
    geom_point(colour="red", size=2, na.rm=TRUE) +
    geom_smooth(na.rm=TRUE)
## 曲線の滑らかさを変える
ggplot(airquality, aes(Temp, Ozone)) +
    geom_point(colour="red", size=2, na.rm=TRUE) +
    geom_smooth(span=0.3, na.rm=TRUE) # 幅の狭い平滑化
### MASS::UScereal を用いた描画例
## 会社毎の糖分とカロリーの回帰直線を見る
ggplot(UScereal, aes(sugars, calories, colour=mfr)) +
    geom_point() +
    geom_smooth(method="lm", se=FALSE) # 信頼区間無し
## 信頼区間を付けて別々に表示する
ggplot(UScereal, aes(sugars, calories, colour=mfr)) +
    geom_point() +
    geom_smooth(method="lm") +
    facet_wrap(~ mfr) # 会社ごとに別のグラフを作成
