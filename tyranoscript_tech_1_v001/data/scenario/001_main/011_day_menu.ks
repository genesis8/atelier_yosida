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
		tf.target="clicked_sale_shelf"+mp.index;
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
		tf.target="clicked_warehouse"+mp.index;
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
*clicked_sale_shelf0
[cm]
[eval exp="tf.clicked_sale_shelf = 0"]
@jump target=*clicked_sale_shelf

*clicked_sale_shelf1
[cm]
[eval exp="tf.clicked_sale_shelf = 1"]
@jump target=*clicked_sale_shelf

*clicked_sale_shelf2
[cm]
[eval exp="tf.clicked_sale_shelf = 2"]
@jump target=*clicked_sale_shelf

*clicked_sale_shelf3
[cm]
[eval exp="tf.clicked_sale_shelf = 3"]
@jump target=*clicked_sale_shelf

*clicked_sale_shelf4
[cm]
[eval exp="tf.clicked_sale_shelf = 4"]
@jump target=*clicked_sale_shelf

*clicked_sale_shelf5
[cm]
[eval exp="tf.clicked_sale_shelf = 5"]
@jump target=*clicked_sale_shelf

*clicked_sale_shelf6
[cm]
[eval exp="tf.clicked_sale_shelf = 6"]
@jump target=*clicked_sale_shelf
*clicked_sale_shelf7
[cm]
[eval exp="tf.clicked_sale_shelf = 7"]
@jump target=*clicked_sale_shelf

*clicked_sale_shelf
クリックされたのは売物棚の[emb exp="tf.clicked_sale_shelf"]です。
どれと入れ替えますか？

;---------------------------------------------
; 売物棚と交換：倉庫用クリッカブルを作成
;---------------------------------------------
[macro name="func_exc_warehouse"]	
	[iscript]
		tf.target="exc_warehouse"+mp.index;
	[endscript]
	[clickable color="white" opacity="0"      x="&  5 + 390" y="& mp.index * 50 + 85 " width="380" height="40" mouseopacity="50" target="&tf.target"]
[endmacro]

[func_exc_warehouse index=0]
[func_exc_warehouse index=1]
[func_exc_warehouse index=2]
[func_exc_warehouse index=3]
[func_exc_warehouse index=4]
[func_exc_warehouse index=5]
[func_exc_warehouse index=6]
[func_exc_warehouse index=7]
[s]

;---------------------------------------------
; 売物棚と交換：倉庫用クリッカブルの着地点
;---------------------------------------------
*exc_warehouse0
[cm]
[eval exp="tf.exc_warehouse = 0"]
@jump target=*exc_warehouse

*exc_warehouse1
[cm]
[eval exp="tf.exc_warehouse = 1"]
@jump target=*exc_warehouse

*exc_warehouse2
[cm]
[eval exp="tf.exc_warehouse = 2"]
@jump target=*exc_warehouse

*exc_warehouse3
[cm]
[eval exp="tf.exc_warehouse = 3"]
@jump target=*exc_warehouse

*exc_warehouse4
[cm]
[eval exp="tf.exc_warehouse = 4"]
@jump target=*exc_warehouse

*exc_warehouse5
[cm]
[eval exp="tf.exc_warehouse = 5"]
@jump target=*exc_warehouse

*exc_warehouse6
[cm]
[eval exp="tf.exc_warehouse = 6"]
@jump target=*exc_warehouse
*exc_warehouse7
[cm]
[eval exp="tf.exc_warehouse = 7"]
@jump target=*exc_warehouse

*exc_warehouse
[emb exp="tf.exc_warehouse"]と入れ替えます。[p]

[iscript]
	tf.dummy = f.warehouse[tf.exc_warehouse].item_no;
	f.warehouse[tf.exc_warehouse].item_no = f.sale_shelf[tf.clicked_sale_shelf].item_no;
	f.sale_shelf[tf.clicked_sale_shelf].item_no = tf.dummy;
[endscript]

[jump target=*MainLoop]

;---------------------------------------------
; 倉庫用クリッカブルの着地点
;---------------------------------------------
*clicked_warehouse0
[cm]
[eval exp="tf.clicked_warehouse = 0"]
@jump target=*clicked_warehouse

*clicked_warehouse1
[cm]
[eval exp="tf.clicked_warehouse = 1"]
@jump target=*clicked_warehouse

*clicked_warehouse2
[cm]
[eval exp="tf.clicked_warehouse = 2"]
@jump target=*clicked_warehouse

*clicked_warehouse3
[cm]
[eval exp="tf.clicked_warehouse = 3"]
@jump target=*clicked_warehouse

*clicked_warehouse4
[cm]
[eval exp="tf.clicked_warehouse = 4"]
@jump target=*clicked_warehouse

*clicked_warehouse5
[cm]
[eval exp="tf.clicked_warehouse = 5"]
@jump target=*clicked_warehouse

*clicked_warehouse6
[cm]
[eval exp="tf.clicked_warehouse = 6"]
@jump target=*clicked_warehouse

*clicked_warehouse7
[cm]
[eval exp="tf.clicked_warehouse = 7"]
@jump target=*clicked_warehouse

*clicked_warehouse

クリックされたのはの[emb exp="tf.clicked_warehouse"]です。
どれと入れ替えますか？

;-----------------------------------------------------------
; 売物棚との交換の選択肢を出すマクロ
;-----------------------------------------------------------
[macro name="func_exc_sale_shelf"]	
	[iscript]
		if ( f.sale_shelf[mp.index]["able"] == false ) {
			tf.clickable =false;
		}else{
			tf.clickable=true;
		};
		tf.target="exc_sale_shelf"+mp.index;
	[endscript]
	[clickable color="white" opacity="0"      x="  5" y="& mp.index * 50 + 85 " width="380" height="40" mouseopacity="50" target="&tf.target" cond="tf.clickable"]
[endmacro]

[func_exc_sale_shelf index=0]
[func_exc_sale_shelf index=1]
[func_exc_sale_shelf index=2]
[func_exc_sale_shelf index=3]
[func_exc_sale_shelf index=4]
[func_exc_sale_shelf index=5]
[func_exc_sale_shelf index=6]
[func_exc_sale_shelf index=7]
[s]


*exc_sale_shelf0
[cm]
[eval exp="tf.exc_sale_shelf = 0"]
@jump target=*exc_sale_shelf

*exc_sale_shelf1
[cm]
[eval exp="tf.exc_sale_shelf = 1"]
@jump target=*exc_sale_shelf

*exc_sale_shelf2
[cm]
[eval exp="tf.exc_sale_shelf = 2"]
@jump target=*exc_sale_shelf

*exc_sale_shelf3
[cm]
[eval exp="tf.exc_sale_shelf = 3"]
@jump target=*exc_sale_shelf

*exc_sale_shelf4
[cm]
[eval exp="tf.exc_sale_shelf = 4"]
@jump target=*exc_sale_shelf

*exc_sale_shelf5
[cm]
[eval exp="tf.exc_sale_shelf = 5"]
@jump target=*exc_sale_shelf

*exc_sale_shelf6
[cm]
[eval exp="tf.exc_sale_shelf = 6"]
@jump target=*exc_sale_shelf
*exc_sale_shelf7
[cm]
[eval exp="tf.exc_sale_shelf = 7"]
@jump target=*exc_sale_shelf

*exc_sale_shelf

[iscript]
	tf.dummy = f.warehouse[tf.clicked_warehouse].item_no;
	f.warehouse[tf.clicked_warehouse].item_no = f.sale_shelf[tf.exc_sale_shelf].item_no;
	f.sale_shelf[tf.exc_sale_shelf].item_no = tf.dummy;
[endscript]

[emb exp="tf.exc_sale_shelf"]と入れ替えます。[p]

[jump target=*MainLoop]

*End
1日が終わりました。[p]

[jump storage="&f.jbs_011" target="&f.jbt_011"]
