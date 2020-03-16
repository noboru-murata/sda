### dplyr::select (列を選択する)
select(airquality, Temp, Wind, Ozone) %>% 
    head(8) # 列記する場合
select(airquality, Ozone:Temp) %>%
    head(8) # 最初と最後の列を指定する場合
select(airquality, -(Month:Day)) %>%
    head(8) # 削除する場合
select(airquality, TempInF=Temp) %>%
    head(8) # 名前を変更する場合
rename(airquality, TempInF=Temp) %>%
    head(8) # 指定箇所だけ名前を変更する場合
