### dplyr::distinct (異なる値を取り出す)
distinct(airquality, Month)                   # どの月を対象としているか調べる
distinct(airquality, Ozone, Temp) %>%head(12) # OzoneとTempの異なる組み合わせ
### dplyr::count (異なる値がいくつあるか数える)
count(airquality, Month)                      # 各月のデータ数を調べる
