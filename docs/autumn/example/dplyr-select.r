### dplyr::select (列を選択する)
select(airquality, Temp, Wind, Ozone) %>%head(12) # 列記する場合
select(airquality, Ozone:Temp) %>%head(12)   # 最初と最後の列を指定する場合
select(airquality, -(Month:Day)) %>%head(12) # 削除する場合
select(airquality, TempInF=Temp) %>%head(12) # 名前を変更する場合
rename(airquality, TempInF=Temp) %>%head(12) # 指定箇所だけ名前を変更する場合
