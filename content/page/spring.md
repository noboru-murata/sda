+++
title = "数理科学続論 I"
author = ["Noboru Murata"]
date = 2019-04-01T00:00:00+09:00
draft = false
weight = 1003
+++

前半はR言語の基本的な使い方を解説し，後半はR言語を利用した数値シミュレーションを行いながら，確率論や推測統計の基礎を学びます．

各回の講義資料は

-   [統計データ解析 I](https://noboru-murata.github.io/statistical-data-analysis1/)

にまとめました．

講義資料としては

-   Rの基礎編 [(PDF)](https://noboru-murata.github.io/sda/docs/note1.pdf) [(Rscript)](https://noboru-murata.github.io/sda/docs/script1.zip)
-   確率と統計編 [(PDF)](https://noboru-murata.github.io/sda/docs/note2.pdf) [(Rscript)](https://noboru-murata.github.io/sda/docs/script2.zip)

を主に使います．

[ガイダンス資料](https://noboru-murata.github.io/sda/spring/slide00.html)

[期末課題](https://noboru-murata.github.io/sda/spring/pdfs/report.pdf)


## スライド {#スライド}

1.  [Rの基本的な操作](https://noboru-murata.github.io/sda/spring/slide01.html)
    [[PDF]​](https://noboru-murata.github.io/sda/spring/pdfs/R%E3%81%AE%E5%9F%BA%E6%9C%AC%E7%9A%84%E3%81%AA%E6%93%8D%E4%BD%9C.pdf)
2.  [ベクトル・行列の演算と関数](https://noboru-murata.github.io/sda/spring/slide02.html)
    [[PDF]​](https://noboru-murata.github.io/sda/spring/pdfs/%E3%83%99%E3%82%AF%E3%83%88%E3%83%AB%E3%83%BB%E8%A1%8C%E5%88%97%E3%81%AE%E6%BC%94%E7%AE%97%E3%81%A8%E9%96%A2%E6%95%B0.pdf)
    [[解答例]​](https://noboru-murata.github.io/sda/spring/code/slide02.R)
    [[質問への回答]​](https://noboru-murata.github.io/sda/spring/code/qa02.R)
3.  [データの整理と集計](https://noboru-murata.github.io/sda/spring/slide03.html)
    [[PDF]​](https://noboru-murata.github.io/sda/spring/pdfs/slide03.pdf)
    [[解答例]​](https://noboru-murata.github.io/sda/spring/code/slide03.R)
    [[サンプルデータ(jpdata.zip)]​](https://noboru-murata.github.io/sda/spring/data/jpdata.zip)
4.  [データの視覚化](https://noboru-murata.github.io/sda/spring/slide04.html)
    [[PDF]​](https://noboru-murata.github.io/sda/spring/pdfs/slide04.pdf)
    [[解答例]​](https://noboru-murata.github.io/sda/spring/code/slide04.R)
    [[サンプルデータ(dataset4.zip)]​](https://noboru-murata.github.io/sda/spring/data/dataset4.zip)
    [[宿題と質問への回答]​](https://noboru-murata.github.io/sda/spring/code/qa04.R)
5.  [確率シミュレーション](https://noboru-murata.github.io/sda/spring/slide05.html)
    [[PDF]​](https://noboru-murata.github.io/sda/spring/pdfs/slide05.pdf)
    [[解答例]​](https://noboru-murata.github.io/sda/spring/code/slide05.R)
    -   [牧野淳一郎: 3.11以後の科学リテラシー, 科学, 岩波書店](https://www.iwanami.co.jp/kagaku/Kagaku%5F202005%5FMakino%5Fpreprint.pdf)
    -   [小田垣孝: 新型コロナウイルスの蔓延に関する一考察](http://www001.upp.so-net.ne.jp/rise/images/%E6%96%B0%E5%9E%8B%E3%82%B3%E3%83%AD%E3%83%8A%E4%B8%80%E8%80%83%E5%AF%9F.pdf)
    -   [感染症の確率シミュレーション](https://noboru-murata.github.io/sda/spring/pdfs/epidemic.pdf) [[R Script (一部)]​](https://noboru-murata.github.io/sda/spring/code/epidemic.zip)
6.  [極限定理](https://noboru-murata.github.io/sda/spring/slide06.html) (大数の法則・中心極限定理・少数の法則)
    [[PDF]​](https://noboru-murata.github.io/sda/spring/pdfs/slide06.pdf)
    [[解答例]​](https://noboru-murata.github.io/sda/spring/code/slide06.R)
7.  [確率分布](https://noboru-murata.github.io/sda/spring/slide07.html) (いろいろな離散分布と連続分布)
    [[PDF]​](https://noboru-murata.github.io/sda/spring/pdfs/slide07.pdf)
    [[解答例]​](https://noboru-murata.github.io/sda/spring/code/slide07.R)
8.  [記述統計量](https://noboru-murata.github.io/sda/spring/slide08.html) (基礎的な記述統計量とデータの集約)
    [[PDF]​](https://noboru-murata.github.io/sda/spring/pdfs/slide08.pdf)
    [[解答例]​](https://noboru-murata.github.io/sda/spring/code/slide08.R)
    [[データ収集の例]​](https://noboru-murata.github.io/sda/spring/code/ex08.R)
    [[サンプルデータ(prices.csv)]​](https://noboru-murata.github.io/sda/spring/data/prices.csv)
9.  [推定](https://noboru-murata.github.io/sda/spring/slide09.html) (確率分布を推定する)
    [[PDF]​](https://noboru-murata.github.io/sda/spring/pdfs/slide09.pdf)
    [[解答例]​](https://noboru-murata.github.io/sda/spring/code/slide09.R)
10. [検定](https://noboru-murata.github.io/sda/spring/slide10.html) (仮説の正当性をデータから検証する)
    [[PDF]​](https://noboru-murata.github.io/sda/spring/pdfs/slide10.pdf)
    [[解答例]​](https://noboru-murata.github.io/sda/spring/code/slide10.R)
11. [分散分析](https://noboru-murata.github.io/sda/spring/slide11.html) (複数のグループ間の違いを検証する)
    [[PDF]​](https://noboru-murata.github.io/sda/spring/pdfs/slide11.pdf)
    [[解答例]​](https://noboru-murata.github.io/sda/spring/code/slide11.R)
12. [回帰分析](https://noboru-murata.github.io/sda/spring/slide12.html) (変数間の関係を推測する)
    [[PDF]​](https://noboru-murata.github.io/sda/spring/pdfs/slide12.pdf)
    [[解答例]​](https://noboru-murata.github.io/sda/spring/code/slide12.R)