;-----------------------------------------------------
; 売物棚を表示
;
; バックグラウンドに描画する
;-----------------------------------------------------

;-----------------------------------------------------------
; 売物棚にあるものを表示するマクロ
;-----------------------------------------------------------
; index で棚番号を渡す
[macro name="func_view_hozon_bako"]	
	[iscript]
		tf.image = 'color/col1.png';
		
		if ( mp.index == 7 )
		{
			tf.text1 = "【やっぱやめとく】";
		}
		else if ( f.storage_box[mp.index]["item_no"] == 0 ) {
			tf.text1 = "（空き）";
		}else{
			tf.text1 = f.item[f.storage_box[mp.index]["item_no"]]["name"] + "×" + f.storage_box[mp.index].stock;
		};
		
		
		
	[endscript]
	[image layer="0" page="back" storage="&tf.image"      x="  5" y="& mp.index * 50 + 85 " width="380" height="40"]
	[ptext layer="0" page="back" text="&tf.text1"         x=" 10" y="& mp.index * 50 + 90 " bold="bold"   size="22"]
[endmacro]

; ヘッダ
[image layer="0" page="back" storage="color/col1.png"      x="  5" y="45 " width="380" height="30"]
[ptext layer="0" page="back" text="------------<保存箱>------------"           x=" 10" y="45 " bold="bold"   size="22"]

; 中身
[func_view_hozon_bako index=0]
[func_view_hozon_bako index=1]
[func_view_hozon_bako index=2]
[func_view_hozon_bako index=3]
[func_view_hozon_bako index=4]
[func_view_hozon_bako index=5]
[func_view_hozon_bako index=6]
[func_view_hozon_bako index=7]

[return]