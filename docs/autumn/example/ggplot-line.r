### datasets::airquality を用いた描画例
## オゾン量を時系列としてグラフを描く
mydat <- airquality %>%
    ## 時間の情報を整理して列を作成
    mutate(Date=as.Date(paste(Month,Day,"73",sep="/"),"%m/%d/%y")) %>%
    select(Date, Ozone:Temp)
ggplot(mydat, aes(x=Date)) +
    geom_line(aes(y=Ozone), colour="red") +
    geom_line(aes(y=Temp), colour="blue") # 表示したいデータを選択
## 複数の系列を描画
require(tidyverse)
mydat <- airquality %>% 
    mutate(Date=as.Date(paste(Month,Day,"73",sep="/"),"%m/%d/%y")) %>%
    select(Ozone:Temp,Date) %>%
    gather(Measure, Observation, Ozone:Temp)
## 
ggplot(mydat, aes(Date, Observation)) +
    geom_line(aes(colour=Measure)) # 計測データ毎に色を変えて表示
## 別のfacetに表示
ggplot(mydat, aes(Date, Observation)) +
    geom_line(colour="blue") +
    ## 計測データ毎に別のグラフ(facet)で表示
    facet_grid(Measure ~ ., scales="free_y") # y座標を適宜スケーリング
### datasets::co2 を用いた描画例
## ts class のデータを変換して描画
mydat <- data.frame(CO2=as.vector(co2),Date=as.vector(time(co2)))
ggplot(mydat, aes(Date,CO2)) +
    geom_line(colour="red")
