;-----------------------------------------------------
; 基本ゲーム画面（1日分）
;-----------------------------------------------------

*Start

; 別の場所にジャンプするので、ジャンプバック先を別名保存する（バグの温床になりそうだなぁ）
[iscript]
	f.jbs_011 = f.jbs;
	f.jbt_011 = f.jbt;
[endscript]

*MainLoop

[update_main_window]

;---------------------------------------------
; メニュー用クリッカブルを作成
;---------------------------------------------
[clickable color="white" opacity="0"      x="&  5 + 130 * 0 " y="& 5" width="120" height="30" mouseopacity="50" target="*Shinkou"]
[clickable color="white" opacity="0"      x="&  5 + 130 * 1 " y="& 5" width="120" height="30" mouseopacity="50" target="*Koudou"]
[clickable color="white" opacity="0"      x="&  5 + 130 * 2 " y="& 5" width="120" height="30" mouseopacity="50" target="*Gaisyutu"]
[clickable color="white" opacity="0"      x="&  5 + 130 * 3 " y="& 5" width="120" height="30" mouseopacity="50" target="*Tokusyu"]
[clickable color="white" opacity="0"      x="&  5 + 130 * 4 " y="& 5" width="120" height="30" mouseopacity="50" target="*Jyouhou"]
[clickable color="white" opacity="0"      x="&  5 + 130 * 5 " y="& 5" width="120" height="30" mouseopacity="50" target="*Settei"]

;---------------------------------------------
; 売物棚用クリッカブルを作成
;---------------------------------------------
[macro name="m011_sale_shelf_clickable"]
	[iscript]
		if ( f.sale_shelf[mp.index]["able"] == false ) {
			tf.clickable=false;
		}else{
			tf.clickable=true;
		};
		tf.target="Click1stSale"+mp.index;
	[endscript]
	[clickable color="white" opacity="0"      x="  5" y="& mp.index * 50 + 85 " width="380" height="40" mouseopacity="50" target="&tf.target" cond="tf.clickable"]
[endmacro]

[m011_sale_shelf_clickable index=0]
[m011_sale_shelf_clickable index=1]
[m011_sale_shelf_clickable index=2]
[m011_sale_shelf_clickable index=3]
[m011_sale_shelf_clickable index=4]
[m011_sale_shelf_clickable index=5]
[m011_sale_shelf_clickable index=6]
[m011_sale_shelf_clickable index=7]

;---------------------------------------------
; 倉庫用クリッカブルを作成
;---------------------------------------------
[macro name="func_view_warehouse"]
	[iscript]
		tf.target="Click1stWare"+mp.index;
	[endscript]
	[clickable color="white" opacity="0"      x="&  5 + 390" y="& mp.index * 50 + 85 " width="380" height="40" mouseopacity="50" target="&tf.target"]
[endmacro]

[func_view_warehouse index=0]
[func_view_warehouse index=1]
[func_view_warehouse index=2]
[func_view_warehouse index=3]
[func_view_warehouse index=4]
[func_view_warehouse index=5]
[func_view_warehouse index=6]
[func_view_warehouse index=7]

;---------------------------------------------
; ジャンプバック地点を登録して選択待機
;---------------------------------------------
[iscript]
	f.jbs = "001_main/011_day_menu.ks";
	f.jbt = "*MainLoop";
[endscript]
何をしようかな？
[s]


;---------------------------------------------
; メニュー用クリッカブルの着地点
;---------------------------------------------
*Shinkou
[cm]	[jump storage="001_main\021_shinkou.ks"]
*Koudou
[cm]	[jump storage="001_main\022_koudou.ks"]
*Gaisyutu
[cm]	[jump storage="001_main\023_gaisyutu.ks"]
*Tokusyu
[cm]	[jump storage="001_main\024_tokusyu.ks"]
*Jyouhou
[cm]	[jump storage="001_main\025_jyouhou.ks"]
*Settei
[cm]	[jump storage="001_main\026_settei.ks"]


;---------------------------------------------
; 売物棚用クリッカブルの着地点
;---------------------------------------------
; アホなことをしている自覚はあるが、Jump先を別々にして変数を定義後、主流に戻るという手順を踏んでいる
*Click1stSale0
[cm]
[eval exp="tf.Click1stSale = 0"]
@jump target=*Click1stSale

*Click1stSale1
[cm]
[eval exp="tf.Click1stSale = 1"]
@jump target=*Click1stSale

*Click1stSale2
[cm]
[eval exp="tf.Click1stSale = 2"]
@jump target=*Click1stSale

*Click1stSale3
[cm]
[eval exp="tf.Click1stSale = 3"]
@jump target=*Click1stSale

*Click1stSale4
[cm]
[eval exp="tf.Click1stSale = 4"]
@jump target=*Click1stSale

*Click1stSale5
[cm]
[eval exp="tf.Click1stSale = 5"]
@jump target=*Click1stSale

*Click1stSale6
[cm]
[eval exp="tf.Click1stSale = 6"]
@jump target=*Click1stSale
*Click1stSale7
[cm]
[eval exp="tf.Click1stSale = 7"]
@jump target=*Click1stSale

*Click1stSale
クリックされたのは売物棚の[emb exp="tf.Click1stSale"]です。
どれと入れ替えますか？

;---------------------------------------------
; 売物棚と交換：倉庫用クリッカブルを作成
;---------------------------------------------
[macro name="func_Click1stSale2ndWare"]	
	[iscript]
		tf.target="Click1stSale2ndWare"+mp.index;
	[endscript]
	[clickable color="white" opacity="0"      x="&  5 + 390" y="& mp.index * 50 + 85 " width="380" height="40" mouseopacity="50" target="&tf.target"]
[endmacro]

[func_Click1stSale2ndWare index=0]
[func_Click1stSale2ndWare index=1]
[func_Click1stSale2ndWare index=2]
[func_Click1stSale2ndWare index=3]
[func_Click1stSale2ndWare index=4]
[func_Click1stSale2ndWare index=5]
[func_Click1stSale2ndWare index=6]
[func_Click1stSale2ndWare index=7]

;---------------------------------------------
; 売物棚と交換：売物棚用クリッカブルを作成
;---------------------------------------------

[macro name="func_Click1stSale2ndSale"]
	[iscript]
		if ( f.sale_shelf[mp.index]["able"] == false ) {
			tf.clickable=false;
		}else{
			tf.clickable=true;
		};
		tf.target="Click1stSale2ndSale"+mp.index;
	[endscript]
	[clickable color="white" opacity="0"      x="  5" y="& mp.index * 50 + 85 " width="380" height="40" mouseopacity="50" target="&tf.target" cond="tf.clickable"]
[endmacro]

[func_Click1stSale2ndSale index=0]
[func_Click1stSale2ndSale index=1]
[func_Click1stSale2ndSale index=2]
[func_Click1stSale2ndSale index=3]
[func_Click1stSale2ndSale index=4]
[func_Click1stSale2ndSale index=5]
[func_Click1stSale2ndSale index=6]
[func_Click1stSale2ndSale index=7]

[s]

;---------------------------------------------
; 売物棚と交換：倉庫用クリッカブルの着地点
;---------------------------------------------
*Click1stSale2ndWare0
[cm]
[eval exp="tf.Click1stSale2ndWare = 0"]
@jump target=*Click1stSale2ndWare

*Click1stSale2ndWare1
[cm]
[eval exp="tf.Click1stSale2ndWare = 1"]
@jump target=*Click1stSale2ndWare

*Click1stSale2ndWare2
[cm]
[eval exp="tf.Click1stSale2ndWare = 2"]
@jump target=*Click1stSale2ndWare

*Click1stSale2ndWare3
[cm]
[eval exp="tf.Click1stSale2ndWare = 3"]
@jump target=*Click1stSale2ndWare

*Click1stSale2ndWare4
[cm]
[eval exp="tf.Click1stSale2ndWare = 4"]
@jump target=*Click1stSale2ndWare

*Click1stSale2ndWare5
[cm]
[eval exp="tf.Click1stSale2ndWare = 5"]
@jump target=*Click1stSale2ndWare

*Click1stSale2ndWare6
[cm]
[eval exp="tf.Click1stSale2ndWare = 6"]
@jump target=*Click1stSale2ndWare
*Click1stSale2ndWare7
[cm]
[eval exp="tf.Click1stSale2ndWare = 7"]
@jump target=*Click1stSale2ndWare

*Click1stSale2ndWare
[emb exp="tf.Click1stSale2ndWare"]と入れ替えます。[p]

[iscript]
	tf.dummy = f.warehouse[tf.Click1stSale2ndWare].item_no;
	f.warehouse[tf.Click1stSale2ndWare].item_no = f.sale_shelf[tf.Click1stSale].item_no;
	f.sale_shelf[tf.Click1stSale].item_no = tf.dummy;
[endscript]

[jump target=*MainLoop]

;---------------------------------------------
; 売物棚と交換：売物棚クリッカブルの着地点
;---------------------------------------------
*Click1stSale2ndSale0
[cm]
[eval exp="tf.Click1stSale2ndSale = 0"]
@jump target=*Click1stSale2ndSale

*Click1stSale2ndSale1
[cm]
[eval exp="tf.Click1stSale2ndSale = 1"]
@jump target=*Click1stSale2ndSale

*Click1stSale2ndSale2
[cm]
[eval exp="tf.Click1stSale2ndSale = 2"]
@jump target=*Click1stSale2ndSale

*Click1stSale2ndSale3
[cm]
[eval exp="tf.Click1stSale2ndSale = 3"]
@jump target=*Click1stSale2ndSale

*Click1stSale2ndSale4
[cm]
[eval exp="tf.Click1stSale2ndSale = 4"]
@jump target=*Click1stSale2ndSale

*Click1stSale2ndSale5
[cm]
[eval exp="tf.Click1stSale2ndSale = 5"]
@jump target=*Click1stSale2ndSale

*Click1stSale2ndSale6
[cm]
[eval exp="tf.Click1stSale2ndSale = 6"]
@jump target=*Click1stSale2ndSale
*Click1stSale2ndSale7
[cm]
[eval exp="tf.Click1stSale2ndSale = 7"]
@jump target=*Click1stSale2ndSale

*Click1stSale2ndSale

[iscript]
	tf.dummy = f.sale_shelf[tf.Click1stSale2ndSale].item_no;
	f.sale_shelf[tf.Click1stSale2ndSale].item_no = f.sale_shelf[tf.Click1stSale].item_no;
	f.sale_shelf[tf.Click1stSale].item_no = tf.dummy;
	
	tf.item_menu_flg = false;
	if (tf.Click1stSale == tf.Click1stSale2ndSale)
	{
		tf.item_menu_flg = true;
		f.item_menu_target = tf.Click1stWare2ndWare;
	}
[endscript]

; 同じものが選ばれていた場合はアイテム固有メニューへ飛ぶ
[jump storage="001_main/012_item_menu.ks" cond="tf.item_menu_flg"]

; それ以外は通常の交換
[emb exp="tf.Click1stWare2ndWare"]と入れ替えます。[p]

[jump target=*MainLoop]


;---------------------------------------------
; 倉庫用クリッカブルの着地点
;---------------------------------------------
*Click1stWare0
[cm]
[eval exp="tf.Click1stWare = 0"]
@jump target=*Click1stWare

*Click1stWare1
[cm]
[eval exp="tf.Click1stWare = 1"]
@jump target=*Click1stWare

*Click1stWare2
[cm]
[eval exp="tf.Click1stWare = 2"]
@jump target=*Click1stWare

*Click1stWare3
[cm]
[eval exp="tf.Click1stWare = 3"]
@jump target=*Click1stWare

*Click1stWare4
[cm]
[eval exp="tf.Click1stWare = 4"]
@jump target=*Click1stWare

*Click1stWare5
[cm]
[eval exp="tf.Click1stWare = 5"]
@jump target=*Click1stWare

*Click1stWare6
[cm]
[eval exp="tf.Click1stWare = 6"]
@jump target=*Click1stWare

*Click1stWare7
[cm]
[eval exp="tf.Click1stWare = 7"]
@jump target=*Click1stWare

*Click1stWare

クリックされたのはの[emb exp="tf.Click1stWare"]です。
どれと入れ替えますか？

;-----------------------------------------------------------
; 売物棚との交換：倉庫用クリッカブルを作成
;-----------------------------------------------------------
[macro name="func_Click1stWare2ndSale"]	
	[iscript]
		if ( f.sale_shelf[mp.index]["able"] == false ) {
			tf.clickable =false;
		}else{
			tf.clickable=true;
		};
		tf.target="Click1stWare2ndSale"+mp.index;
	[endscript]
	[clickable color="white" opacity="0"      x="  5" y="& mp.index * 50 + 85 " width="380" height="40" mouseopacity="50" target="&tf.target" cond="tf.clickable"]
[endmacro]

[func_Click1stWare2ndSale index=0]
[func_Click1stWare2ndSale index=1]
[func_Click1stWare2ndSale index=2]
[func_Click1stWare2ndSale index=3]
[func_Click1stWare2ndSale index=4]
[func_Click1stWare2ndSale index=5]
[func_Click1stWare2ndSale index=6]
[func_Click1stWare2ndSale index=7]

;---------------------------------------------
; 売物棚と交換：倉庫用クリッカブルを作成
;---------------------------------------------
[macro name="func_Click1stWare2ndWare"]	
	[iscript]
		tf.target="Click1stWare2ndWare"+mp.index;
	[endscript]
	[clickable color="white" opacity="0"      x="&  5 + 390" y="& mp.index * 50 + 85 " width="380" height="40" mouseopacity="50" target="&tf.target"]
[endmacro]

[func_Click1stWare2ndWare index=0]
[func_Click1stWare2ndWare index=1]
[func_Click1stWare2ndWare index=2]
[func_Click1stWare2ndWare index=3]
[func_Click1stWare2ndWare index=4]
[func_Click1stWare2ndWare index=5]
[func_Click1stWare2ndWare index=6]
[func_Click1stWare2ndWare index=7]


[s]

;---------------------------------------------
; 倉庫と交換：売物棚クリッカブルの着地点
;---------------------------------------------
*Click1stWare2ndSale0
[cm]
[eval exp="tf.Click1stWare2ndSale = 0"]
@jump target=*Click1stWare2ndSale

*Click1stWare2ndSale1
[cm]
[eval exp="tf.Click1stWare2ndSale = 1"]
@jump target=*Click1stWare2ndSale

*Click1stWare2ndSale2
[cm]
[eval exp="tf.Click1stWare2ndSale = 2"]
@jump target=*Click1stWare2ndSale

*Click1stWare2ndSale3
[cm]
[eval exp="tf.Click1stWare2ndSale = 3"]
@jump target=*Click1stWare2ndSale

*Click1stWare2ndSale4
[cm]
[eval exp="tf.Click1stWare2ndSale = 4"]
@jump target=*Click1stWare2ndSale

*Click1stWare2ndSale5
[cm]
[eval exp="tf.Click1stWare2ndSale = 5"]
@jump target=*Click1stWare2ndSale

*Click1stWare2ndSale6
[cm]
[eval exp="tf.Click1stWare2ndSale = 6"]
@jump target=*Click1stWare2ndSale
*Click1stWare2ndSale7
[cm]
[eval exp="tf.Click1stWare2ndSale = 7"]
@jump target=*Click1stWare2ndSale

*Click1stWare2ndSale

[iscript]
	tf.dummy = f.warehouse[tf.Click1stWare].item_no;
	f.warehouse[tf.Click1stWare].item_no = f.sale_shelf[tf.Click1stWare2ndSale].item_no;
	f.sale_shelf[tf.Click1stWare2ndSale].item_no = tf.dummy;
[endscript]

[emb exp="tf.Click1stWare2ndSale"]と入れ替えます。[p]

[jump target=*MainLoop]

;---------------------------------------------
; 倉庫と交換：倉庫クリッカブルの着地点
;---------------------------------------------
*Click1stWare2ndWare0
[cm]
[eval exp="tf.Click1stWare2ndWare = 0"]
@jump target=*Click1stWare2ndWare

*Click1stWare2ndWare1
[cm]
[eval exp="tf.Click1stWare2ndWare = 1"]
@jump target=*Click1stWare2ndWare

*Click1stWare2ndWare2
[cm]
[eval exp="tf.Click1stWare2ndWare = 2"]
@jump target=*Click1stWare2ndWare

*Click1stWare2ndWare3
[cm]
[eval exp="tf.Click1stWare2ndWare = 3"]
@jump target=*Click1stWare2ndWare

*Click1stWare2ndWare4
[cm]
[eval exp="tf.Click1stWare2ndWare = 4"]
@jump target=*Click1stWare2ndWare

*Click1stWare2ndWare5
[cm]
[eval exp="tf.Click1stWare2ndWare = 5"]
@jump target=*Click1stWare2ndWare

*Click1stWare2ndWare6
[cm]
[eval exp="tf.Click1stWare2ndWare = 6"]
@jump target=*Click1stWare2ndWare
*Click1stWare2ndWare7
[cm]
[eval exp="tf.Click1stWare2ndWare = 7"]
@jump target=*Click1stWare2ndWare

*Click1stWare2ndWare

[iscript]
	tf.dummy = f.warehouse[tf.Click1stWare].item_no;
	f.warehouse[tf.Click1stWare].item_no = f.warehouse[tf.Click1stWare2ndWare].item_no;
	f.warehouse[tf.Click1stWare2ndWare].item_no = tf.dummy;
	
	tf.item_menu_flg = false;
	
	if (tf.Click1stWare == tf.Click1stWare2ndWare)
	{
		tf.item_menu_flg = true;
		f.item_menu_target = tf.Click1stWare2ndWare;
	}
[endscript]

; 同じものが選ばれていた場合はアイテム固有メニューへ飛ぶ
[jump storage="001_main/012_item_menu.ks" cond="tf.item_menu_flg"]

; それ以外は通常の交換
[emb exp="tf.Click1stWare2ndWare"]と入れ替えます。[p]

[jump target=*MainLoop]


*End
1日が終わりました。[p]

[jump storage="&f.jbs_011" target="&f.jbt_011"]
