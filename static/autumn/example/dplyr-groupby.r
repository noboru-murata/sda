### dplyr::group_by (指定した変数でグループ化する)
air_month <- group_by(airquality, Month) # 月ごとにグループ化
summarize(air_month,
          count   = n(), # 各月の日数を求める
          mean    = mean(Ozone, na.rm=TRUE),
          min     = min(Ozone, na.rm=TRUE),
          median  = median(Ozone, na.rm=TRUE),
          max     = max(Ozone, na.rm=TRUE)) 
## 同じことは演算子%>%を用いることで簡略化できる
airquality %>%
    group_by(Month) %>%
    summarize(
          count   = n(), 
          mean    = mean(Ozone, na.rm=TRUE),
          min     = min(Ozone, na.rm=TRUE),
          median  = median(Ozone, na.rm=TRUE),
          max     = max(Ozone, na.rm=TRUE)) 
