### dplyr::distinct (異なる値を取り出す)
distinct(airquality, Month) # どの月が対象か調べる
distinct(airquality, Ozone, Temp) %>%
    head(8) # OzoneとTempの異なる組み合わせ
### dplyr::count (異なる値がいくつあるか数える)
count(airquality, Month) # 各月のデータ数を調べる
