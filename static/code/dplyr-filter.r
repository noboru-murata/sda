### dplyr::filter (条件で絞り込む)
filter(airquality, Temp>80, Ozone>90) # 条件のand
filter(airquality, Day==5 | Day==10)  # 条件のor
### dplyr::slice (行番号で絞り込む)
slice(airquality,seq(2,16,by=2))
