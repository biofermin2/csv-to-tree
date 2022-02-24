# 開発目的
日本の市町村など行政区域毎の緯度・経度情報についてより
正確性を期するために開発する。

その際、以下のサイトを利用する。

国土交通省　位置参照情報ダウンロードサービス

https://nlftp.mlit.go.jp/cgi-bin/isj/dls/_view_cities_wards.cgi

上記のサイトからダウンロードしたCSVファイルを元に
S式のツリーデータに加工。

各行政区域の平均値を小計してまとめられるようにした。

# 使用例サンプル

```common-lisp
;; ライブラリのロード
(ql:quickload :csv-to-tree)

;; 加工元データのパス定義
(defparameter data "~/path/location-info/17000-19.0a/17_2020.csv") ; => DATA

;; 編集コマンドの実行
;; (csv-to-tree <csv file> <columns>)
(csv-to-tree data 0 1 8 9)		; =>
("石川県" ("鳳珠郡能登町" 37.3145361309808d0 137.19081845035856d0)
	  ("鳳珠郡穴水町" 37.22946156338992d0 136.9062905227117d0)
	  ("羽咋郡志賀町" 37.09771566805149d0 136.73497640792402d0)
	  ("河北郡内灘町" 36.649151846584914d0 136.64404961122688d0)
	  ("河北郡津幡町" 36.671261715314124d0 136.73176568963567d0)
	  ("能美郡川北町" 36.47109329640724d0 136.5366428023953d0)
	  ("野々市市" 36.52848154297567d0 136.60338597123942d0)
	  ("能美市" 36.44381267653112d0 136.5026415996607d0)
	  ("白山市" 36.50347316338328d0 136.5624696541919d0)
	  ("かほく市" 36.72692602036003d0 136.71176623721988d0)
	  ("羽咋市" 36.89978850394859d0 136.77942330922974d0)
	  ("加賀市" 36.30414724410297d0 136.34951960962576d0)
	  ("珠洲市" 37.44015962974817d0 137.2839118024796d0)
	  ("輪島市" 37.390779005848024d0 136.8997992660822d0)
	  ("小松市" 36.39009578297415d0 136.45433140559624d0)
	  ("七尾市" 37.04433134369311d0 136.95670634999414d0)
	  ("金沢市" 36.5713557864904d0 136.64342752644552d0))
```

上記の例では元々２５万行以上あるCSVデータだが、
このように行政区域単位で扱い易いデータにまとめられた。

但し、この小計方法が平均値で計算されているため、
実際は区域外が指定されている可能性もあり。
そこらへんの解決は今後の課題としたい。

# インストール方法

```shel
$ ros install biofermin2/csv-to-tree
```


