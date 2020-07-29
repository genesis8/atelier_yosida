;-----------------------------------------------------
; ステータスを表示
;
; バックグラウンドに描画する
;-----------------------------------------------------

;-----------------------------------------------------------
; 倉庫にあるものを表示するマクロ
;-----------------------------------------------------------
; index で棚番号を渡す
[macro name="func_view_warehouse"]	
	[iscript]
		tf.image = 'color/col2.png';
		
		if ( f.warehouse[mp.index]["item_no"] == 0 ) {
			tf.text1 = "（空き）";
		}else{
			tf.text1 = f.item[f.warehouse[mp.index]["item_no"]]["name"] + "×" + f.item[f.warehouse[mp.index]["item_no"]]["stock"];
		};
	[endscript]
	
	[image layer="0" page="back" storage="&tf.image"      x="&  5 + 390" y="& mp.index * 50 + 85 " width="380" height="40"]
	[ptext layer="0" page="back" text="&tf.text1"         x="& 10 + 390" y="& mp.index * 50 + 90 " bold="bold"   size="22"]
[endmacro]

; ヘッダ
[image layer="0" page="back" storage="color/col2.png"      x="  395" y="45 " width="380" height="30"]
[ptext layer="0" page="back" text="--------------<倉庫>--------------"           x=" 400" y="45 " bold="bold"   size="22"]


;---------------------------------------------------
; 時間と日数
;---------------------------------------------------
[iscript]
	tf.image = 'color/col2.png';
	tf.text = f.day_count + '日目 ' + f.hour + ':' + f.minute;
[endscript]
[image layer="0" page="back" storage="&tf.image"      x="&  5 + 780" y="& 5 + 0" width="170" height="40"]
[ptext layer="0" page="back" text="&tf.text"          x="& 10 + 780" y="&10 + 0" bold="bold"   size="22"]

;---------------------------------------------------
; キャパシティ
;---------------------------------------------------
[iscript]
	tf.image = 'color/col2.png';
	tf.num_of_item  = f.item[f.sale_shelf[0].item_no].stock
					+ f.item[f.sale_shelf[1].item_no].stock
					+ f.item[f.sale_shelf[2].item_no].stock
					+ f.item[f.sale_shelf[3].item_no].stock
					+ f.item[f.sale_shelf[4].item_no].stock
					+ f.item[f.sale_shelf[5].item_no].stock
					+ f.item[f.sale_shelf[6].item_no].stock
					+ f.item[f.sale_shelf[7].item_no].stock
					+ f.item[f.warehouse[0].item_no].stock
					+ f.item[f.warehouse[1].item_no].stock
					+ f.item[f.warehouse[2].item_no].stock
					+ f.item[f.warehouse[3].item_no].stock
					+ f.item[f.warehouse[4].item_no].stock
					+ f.item[f.warehouse[5].item_no].stock
					+ f.item[f.warehouse[6].item_no].stock
					+ f.item[f.warehouse[7].item_no].stock;
	
	tf.text = "キャパ：" + tf.num_of_item + '／' + f.warehouse_max;
[endscript]
[image layer="0" page="back" storage="&tf.image"      x="&  5 + 780" y="& 5 + 50" width="170" height="20"]
[ptext layer="0" page="back" text="&tf.text"          x="& 10 + 780" y="& 5 + 50" bold="bold"   size="16"]

;---------------------------------------------------
; 精神力バー
;---------------------------------------------------
[iscript]
	tf.image = 'color/col2.png';
	tf.text = '精神力：' + f.mental + '／' + f.mental_max;
[endscript]
[image layer="0" page="back" storage="&tf.image"      x="&  5 + 780" y="& 5 + 80" width="170" height="20"]
[ptext layer="0" page="back" text="&tf.text"          x="& 10 + 780" y="& 5 + 80" bold="bold"   size="16"]

;---------------------------------------------------
;店の汚れ
;---------------------------------------------------
[iscript]
	tf.image = 'color/col2.png';
	tf.text = '汚れ：' + f.dirt + '／' + f.dirt_max;
[endscript]
[image layer="0" page="back" storage="&tf.image"      x="&  5 + 780" y="& 5 + 110" width="170" height="20"]
[ptext layer="0" page="back" text="&tf.text"          x="& 10 + 780" y="& 5 + 110" bold="bold"   size="16"]

;---------------------------------------------------
; 経験値
;---------------------------------------------------
[iscript]
	tf.image = 'color/col2.png';
	tf.text = '経験値：' + f.exp + '／100';
[endscript]
[image layer="0" page="back" storage="&tf.image"      x="&  5 + 780" y="& 5 + 140" width="170" height="20"]
[ptext layer="0" page="back" text="&tf.text"          x="& 10 + 780" y="& 5 + 140" bold="bold"   size="16"]

;---------------------------------------------------
; 人気
;---------------------------------------------------
[iscript]
	tf.image = 'color/col2.png';
	tf.text = '人気：' + f.popularity + '／100';
[endscript]
[image layer="0" page="back" storage="&tf.image"      x="&  5 + 780" y="& 5 + 170" width="170" height="20"]
[ptext layer="0" page="back" text="&tf.text"          x="& 10 + 780" y="& 5 + 170" bold="bold"   size="16"]

;---------------------------------------------------
; 資金額
;---------------------------------------------------
[iscript]
	tf.image = 'color/col2.png';
	tf.text = '資金：' + f.money + '＄';
[endscript]
[image layer="0" page="back" storage="&tf.image"      x="&  5 + 780" y="& 5 + 200" width="170" height="20"]
[ptext layer="0" page="back" text="&tf.text"          x="& 10 + 780" y="& 5 + 200" bold="bold"   size="16"]

;---------------------------------------------------
; 名声値
;---------------------------------------------------
[iscript]
	tf.image = 'color/col2.png';
	tf.text = '名声値：' + f.fame;
[endscript]
[image layer="0" page="back" storage="&tf.image"      x="&  5 + 780" y="& 5 + 230" width="170" height="20"]
[ptext layer="0" page="back" text="&tf.text"          x="& 10 + 780" y="& 5 + 230" bold="bold"   size="16"]

;---------------------------------------------------
; 技術力
;---------------------------------------------------
[iscript]
	tf.image = 'color/col2.png';
	tf.text = '技術力：' + f.technic;
[endscript]
[image layer="0" page="back" storage="&tf.image"      x="&  5 + 780" y="& 5 + 260" width="170" height="20"]
[ptext layer="0" page="back" text="&tf.text"          x="& 10 + 780" y="& 5 + 260" bold="bold"   size="16"]

[return]