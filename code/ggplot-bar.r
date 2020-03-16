### datasets::airquality を用いた描画例
## 月別の計測日数を棒グラフとして表示
ggplot(airquality, aes(Month)) +
    geom_bar()
## 月別のオゾン量の合計を表示
ggplot(airquality, aes(Month)) +
    geom_bar(aes(weight=Ozone))
## 月別にオゾン量を集計
myData <- airquality %>%
    group_by(Month) %>%
    summarize(
        mean    = mean(Ozone, na.rm=TRUE),
        min     = min(Ozone, na.rm=TRUE),
        max     = max(Ozone, na.rm=TRUE)) 
## 月別のオゾン量の平均を表示
ggplot(myData, aes(Month, mean)) +
    geom_bar(stat="identity", fill="blue") +
    geom_linerange(aes(ymin=min,ymax=max)) # 値域も表示
## オゾン量の高低のラベルを付加
myData <- airquality %>%
    mutate(Level=ifelse(Ozone>60,"high",
                 ifelse(Ozone<20,"low","mid"))) %>%
    filter(!is.na(Level)) # 計算できなかったものを除く
## 月別のオゾン量の高低の割合を表示
ggplot(myData, aes(Month)) +
    geom_bar(aes(fill = Level), position = "dodge")
