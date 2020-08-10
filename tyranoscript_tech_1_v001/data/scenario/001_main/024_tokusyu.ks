;-----------------------------------------------------
; 特殊コマンド
;-----------------------------------------------------

*Start

; 別の場所にジャンプするので、ジャンプバック先を別名保存する（バグの温床になりそうだなぁ）
[iscript]
	f.jbs_024 = f.jbs;
	f.jbt_024 = f.jbt;
[endscript]

*Choice
特殊コマンドを実行します
[glink x="230" y="100" text="レイムちゃんに探索を依頼する" target="*Reimu"    color="my-anim2"]
[glink x="230" y="160" text="ヨウムちゃんの行動を指定する" target="*Youmu" color="my-anim2"]
[glink x="230" y="220" text="保存箱から商品を取り出す    " target="*Hozonbako"    color="my-anim2"]
[glink x="230" y="280" text="やっぱやめとく              " target="*Yametoku" color="my-anim2"]
[s]

*Reimu
まだ実装されていない
[jump target=*Choice]

*Youmu
まだ実装されていない
[jump target=*Choice]

*Hozonbako
; 描画;
[freeimage layer="0" page="back"]
[call storage="003_show\006_hozon_bako.ks"]
[call storage="003_show\004_warehouse.ks"]
[call storage="003_show\002_menu.ks"]
[call storage="003_show\005_status.ks"]
; 描画結果を反映;
[trans layer="0" time="0"]

保存箱から取り出したいものを選んでね

[macro name="func_clickable_storage"]
	[iscript]
		tf.target="Clicked"+mp.index;
		tf.clickable = false;
		if (f.storage_box[mp.index]["item_no"] != 0 ) tf.clickable = true;
		if (mp.index == 7 ) tf.clickable = true;
	[endscript]	
	[clickable color="white" opacity="0"      x="  5" y="& mp.index * 50 + 85 " width="380" height="40" mouseopacity="50" target="&tf.target" cond="tf.clickable"]
[endmacro]

[func_clickable_storage index=0]
[func_clickable_storage index=1]
[func_clickable_storage index=2]
[func_clickable_storage index=3]
[func_clickable_storage index=4]
[func_clickable_storage index=5]
[func_clickable_storage index=6]
[func_clickable_storage index=7]
[s]

*Clicked0
[cm]
[eval exp="tf.clicked = 0"]
[jump target="*ClickedNum"]

*Clicked1
[cm]
[eval exp="tf.clicked = 1"]
[jump target="*ClickedNum"]

*Clicked2
[cm]
[eval exp="tf.clicked = 2"]
[jump target="*ClickedNum"]

*Clicked3
[cm]
[eval exp="tf.clicked = 3"]
[jump target="*ClickedNum"]

*Clicked4
[cm]
[eval exp="tf.clicked = 4"]
[jump target="*ClickedNum"]

*Clicked5
[cm]
[eval exp="tf.clicked = 5"]
[jump target="*ClickedNum"]

*Clicked6
[cm]
[eval exp="tf.clicked = 6"]
[jump target="*ClickedNum"]

*Clicked7
[cm]
[eval exp="tf.clicked = 7"]
[jump target="*ClickedYametoku"]

*ClickedNum
[emb exp="tf.clicked"]を取り出す処理を行います[p]

; 追加判定
[item_add_judge add_judge_item_no="&f.storage_box[tf.clicked].item_no"]

; 商品キャパシティが足りないので買えないケース
[jump target="*BuyCapa0" cond="f.iaj_num<f.storage_box[tf.clicked].stock"]
; スロットに空きがないから買えないケース
[jump target="*BuySlot0" cond="f.iaj_slot==-1"]

[iscript]
	tf.item_numer = f.storage_box[tf.clicked].item_no;
	tf.plus_stock = f.storage_box[tf.clicked].stock;
	if (f.iaj_target == "SHELF")
	{
		// 商品を増やす
		f.sale_shelf[f.iaj_slot].item_no = tf.item_numer;
		f.item[tf.item_numer].stock += tf.plus_stock;
	}
	
	if (f.iaj_target == "WAREHOUSE")
	{
		// 商品を増やす
		f.warehouse[f.iaj_slot].item_no = tf.item_numer;
		f.item[tf.item_numer].stock += tf.plus_stock;
	}
	f.storage_box[tf.clicked].stock = 0;
	f.storage_box[tf.clicked].item_no = 0;
[endscript]

[jump target="*Hozonbako"]

*BuyCapa0
[emb exp="f.iaj_num"]:[emb exp="f.storage_box[tf.clicked].item_no"]:
商品キャパシティが足りなくてで買えない…（[emb exp="f.storage_box[tf.clicked].stock"]個必要）。[p]
[jump target="*Hozonbako"]

*BuySlot0
売物棚と倉庫のスロットに空きがないから買えない…[p]
[jump target="*Hozonbako"]

*ClickedYametoku
取り出すのをやめたぞい[p]
[jump target=*Choice]

*Yametoku
やっぱやめとくか[p]
[jump target=*End]

*End

[jump storage="&f.jbs_024" target="&f.jbt_024"]