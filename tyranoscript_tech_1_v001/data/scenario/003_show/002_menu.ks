;-----------------------------------------------------
; メニューを表示
;-----------------------------------------------------

;-----------------------------------------------------
; 倉庫の中身を表示
;
; バックグラウンドに描画する
;-----------------------------------------------------

;-----------------------------------------------------------
; 倉庫にあるものを表示するマクロ
;-----------------------------------------------------------
; index で棚番号を渡す
[macro name="tmp_show_menu"]	
	[iscript]
		tf.image = 'color/col3.png';
	[endscript]
	
	[image layer="0" page="back" storage="&tf.image"      x="&  5 + 130 * mp.index" y="& 5 " width="120" height="30"]
	[ptext layer="0" page="back" text="%moji"         x="& 10 + 130 * mp.index" y="& 5 " bold="bold"   size="22"]
[endmacro]

[tmp_show_menu index=0 moji="進行"]
[tmp_show_menu index=1 moji="行動"]
[tmp_show_menu index=2 moji="外出"]
[tmp_show_menu index=3 moji="特殊"]
[tmp_show_menu index=4 moji="情報"]
[tmp_show_menu index=5 moji="設定"]

[return]