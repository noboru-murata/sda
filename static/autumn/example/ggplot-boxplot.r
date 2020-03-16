### datasets::airquality を用いた描画例
## 月別のオゾン量の箱ひげ図を描く
ggplot(airquality, aes(factor(Month), Ozone)) +
    geom_boxplot(na.rm=TRUE) +
    labs("x"="Month") # x軸のラベルを変更
## データを付随させる
ggplot(airquality, aes(factor(Month), Ozone)) +
    geom_boxplot(na.rm=TRUE) +
    geom_jitter(width=0.2, na.rm=TRUE) + # データを重ならないように表示
    labs("x"="Month") 
### MASS::UScereal を用いた描画例
## 糖分とカロリーの関係性を見る
ggplot(UScereal, aes(sugars, calories)) +
    geom_boxplot(aes(group=cut_width(sugars,5)), colour="blue") +
    geom_point(colour="red", shape=4)
## 軸を入れ換えて箱ひげ図を描く
ggplot(UScereal, aes(calories, sugars)) + # xyを入れ換えておく
    geom_boxplot(aes(group=cut_width(calories,50)), colour="blue") +
    geom_point(colour="red", shape=4) +
    coord_flip() # 軸の入れ換え
