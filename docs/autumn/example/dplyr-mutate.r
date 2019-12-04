### dplyr::mutate (新しい列を作成する)
mutate(airquality, TempC=(Temp-32)/1.8) %>%head(12) # 華氏を摂氏に変換
transmute(airquality,TempF=Temp,TempC=(Temp-32)/1.8) %>%head(12) # 保持しない
