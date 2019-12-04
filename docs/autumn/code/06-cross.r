### 交互作用・非線形変換の例
### MASS::Boston による例 (ボストン近郊の家の価格のデータ)
require(MASS) # MASSパッケージのロード
?Boston # データの内容を確認

### 様々な交互作用モデル
## 変数medvがボストン近郊の506の地域での家の価格の中央値を表す
## medvをrm(平均部屋数)で回帰
est1 <- lm(medv ~ rm, data=Boston)
summary(est1) # 部屋が多いほど価格は上昇
## rmとdis(ボストンのオフィス街への距離)の交差項を追加
est2 <- lm(medv ~ rm + rm:dis, data=Boston)  
summary(est2) # 距離が遠いほど部屋数が価格に与える影響は上昇
## rm,disおよびrmとdisの交差項を説明変数とする
est3 <- lm(medv ~ rm * dis, data=Boston)  
summary(est3) # 上述の効果に加え, 距離が遠いほど価格は下落
## rm,dis,crim(犯罪率)とそれらの交差項をすべて説明変数とする
est4 <- lm(medv ~ (rm + dis + crim)^2, data=Boston)  
summary(est4) 
## crimの係数が正のため, 一見犯罪率が高い地域ほど家賃が高く見えるが,
## crimと他変数の交差項が負のため他の変数の大きさ次第

### 説明変数の非線形変換
summary(lm(medv ~ dis, data=Boston))
est5 <- lm(medv ~ log(dis), data=Boston) # disの対数で回帰
summary(est5) # 決定係数が(多少)増加
est6 <- lm(medv ~ dis + I(dis^2), data=Boston) # disの2次式で回帰
summary(est6) # 距離が遠くなるにつれて, 距離の価格への影響は弱まる
