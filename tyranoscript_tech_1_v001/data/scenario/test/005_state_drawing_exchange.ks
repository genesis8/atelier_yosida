;--------------------------------------------------
; 最小限の初期化を実行（よくわかってない）
;--------------------------------------------------
; [mask]～[mask_off]　マスクしている間に、画面の破壊と再構築を行います。
[mask color="white" time="400"]

; [destroy] 独自マクロ。画面にあるもの、画面にある効果、すべてを破壊します。
[destroy]

; [bg][chara_show][wait] 解説画面用の背景、キャラを表示してから、ちょっと待機します。
[bg         time="  0" storage="room.jpg"]
[wait       time="100"]
[mask_off time="400"]

;-----------------------------------------------------------
*Start
;-----------------------------------------------------------

;------------------------------
;独自ウィンドウの設定
;------------------------------

[clearfix]
[free  name="chara_name_area"  layer="message0"]
[deffont size="32" face="ロゴたいぷゴシック,メイリオ,sans-serif" color="0xffffff" edge="0x000000"]
[resetfont]

[position layer="message0" left="  0" top="480" width="960" height="160" frame="001_text_frame/test_frame1.png" margint="1" marginl="175" marginr="9" marginb="4" opacity="210"]

[iscript]
	// 行間をゼロに
	tyrano.plugin.kag.config.defaultLineSpacing = '0';
[endscript]


;------------------------------
; キャラを表示するマクロ
;------------------------------
[macro name="func_face_show"]
	[chara_show name="%name" layer="message0" left="2" top="482" width="156" zindex="101"]
[endmacro]

[macro name="func_face_hide"]
	[chara_hide layer="message0" name="%name" time="0"]
[endmacro]

[macro name="func_face_mod"]
	[chara_hide layer="message0" name="%name" time="0"]
[endmacro]

;-----------------------------------------------------------
; 状態の定義
;-----------------------------------------------------------
[iscript]

	f.hour			= 8;
	f.minute		= 30;
	f.day_count		=4;
	f.mental		=90;
	f.mental_max	=100;
	f.dirt			=30;
	f.dirt_max		=100;
	f.exp			=25;
	f.popularity	=13;
	f.money			=4649;
	f.fame			=9;
	f.technic		=13;
	f.warehouse_max	=30;
	f.item = {};
	
	f.item[1]= {
		name:"レガシーの構築済みデッキ",
		ask_price:2,
		buy_price:3,
		buy_count:4,
		stock:5,
		auto_purchase:6,
		demand_index:7,
		process_difficulty:8,
		description:"商品1の説明"
	};
	f.item[2]= {
		name:"商品2",
		ask_price:2,
		buy_price:3,
		buy_count:4,
		stock:5,
		auto_purchase:6,
		demand_index:7,
		process_difficulty:8,
		description:"商品2の説明"
	};
	f.item[3]= {
		name:"商品3",
		ask_price:2,
		buy_price:3,
		buy_count:4,
		stock:5,
		auto_purchase:6,
		demand_index:7,
		process_difficulty:8,
		description:"商品3の説明"
	};
	f.item[4]= {
		name:"商品4",
		ask_price:2,
		buy_price:3,
		buy_count:4,
		stock:5,
		auto_purchase:6,
		demand_index:7,
		process_difficulty:8,
		description:"商品4の説明"
	};

	f.sale_shelf = [
		{able:true	,item_no:1},
		{able:true	,item_no:2},
		{able:true	,item_no:0},
		{able:false	,item_no:0},
		{able:false	,item_no:0},
		{able:false	,item_no:0},
		{able:false	,item_no:0},
		{able:false	,item_no:0}
	];
	
	f.warehouse = [
		{item_no:3},
		{item_no:4},
		{item_no:0},
		{item_no:0},
		{item_no:0},
		{item_no:0},
		{item_no:0},
		{item_no:0}
	];
	
	f.storage_box = [
		{item_no:1,	stock:10},
		{item_no:2,	stock:10},
		{item_no:3,	stock:30},
		{item_no:4,	stock:30}
	];

[endscript]

;-----------------------------------------------------------
; 売物棚にあるものを表示するマクロ
;-----------------------------------------------------------
; index で棚番号を渡す
[macro name="func_view_sale_shelf"]	
	[iscript]
		tf.image = 'color/col1.png';
		
		if ( f.sale_shelf[mp.index]["item_no"] == 0 ) {
			tf.text1 = "（空き）";
		}else{
			tf.text1 = f.item[f.sale_shelf[mp.index]["item_no"]]["name"] + "×" + f.item[f.sale_shelf[mp.index]["item_no"]]["stock"];
		};
		
		
		if ( f.sale_shelf[mp.index]["able"] == false ) {
			tf.text1 = "------";
			tf.clickable =false;
		}else{
			tf.clickable=true;
		};
	tf.target="clicked_sale_shelf"+mp.index;
	[endscript]
	
	[image layer="0" page="back" storage="&tf.image"      x="  5" y="& mp.index * 50 + 85 " width="380" height="40"]
	[ptext layer="0" page="back" text="&tf.text1"         x=" 10" y="& mp.index * 50 + 90 " bold="bold"   size="22"]
	[clickable color="white" opacity="0"      x="  5" y="& mp.index * 50 + 85 " width="380" height="40" mouseopacity="50" target="&tf.target" cond="tf.clickable"]
[endmacro]

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
		
	tf.target="clicked_warehouse"+mp.index;
	[endscript]
	
	[image layer="0" page="back" storage="&tf.image"      x="&  5 + 390" y="& mp.index * 50 + 85 " width="380" height="40"]
	[ptext layer="0" page="back" text="&tf.text1"         x="& 10 + 390" y="& mp.index * 50 + 90 " bold="bold"   size="22"]
	[clickable color="white" opacity="0"      x="&  5 + 390" y="& mp.index * 50 + 85 " width="380" height="40" mouseopacity="50" target="&tf.target"]
	
[endmacro]


;-----------------------------------------------------------
*Part1
;-----------------------------------------------------------

[func_face_show name="youmu"]

; [freeimage layer="1"]
; ptextは個別に消せないことが判明…
; 再描画ごとにパッパと鬱陶しい明滅が出てしまう…
; これは解決しないと尾を引くタイプのアレだなぁ…
;   →前傾レイヤーの表と裏の概念使えばOK
;   →①裏を消す ②裏に描画 ③表裏をチェンジ で画面のちらつきが無くなる

[freeimage layer="0" page="back"]

[func_view_sale_shelf index=0]
[func_view_sale_shelf index=1]
[func_view_sale_shelf index=2]
[func_view_sale_shelf index=3]
[func_view_sale_shelf index=4]
[func_view_sale_shelf index=5]
[func_view_sale_shelf index=6]
[func_view_sale_shelf index=7]

[func_view_warehouse index=0]
[func_view_warehouse index=1]
[func_view_warehouse index=2]
[func_view_warehouse index=3]
[func_view_warehouse index=4]
[func_view_warehouse index=5]
[func_view_warehouse index=6]
[func_view_warehouse index=7]

[trans layer="0" time="0"]

; ゲームを停止させる
;    →これをやらないとホイールで進行できてしまう
[s]

;-----------------------------------------------------------
; 売物棚アイテムのクリック処理
;-----------------------------------------------------------
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

;-----------------------------------------------------------
*clicked_sale_shelf
;-----------------------------------------------------------

クリックされたのは売物棚の[emb exp="tf.clicked_sale_shelf"]です。
どれと入れ替えますか？

;-----------------------------------------------------------
; 倉庫との交換の選択肢を出すマクロ
;-----------------------------------------------------------
; index で棚番号を渡す
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

;-----------------------------------------------------------
*exc_warehouse
;-----------------------------------------------------------


[emb exp="tf.exc_warehouse"]と入れ替えます。[p]

[iscript]
	tf.dummy = f.warehouse[tf.exc_warehouse].item_no;
	f.warehouse[tf.exc_warehouse].item_no = f.sale_shelf[tf.clicked_sale_shelf].item_no;
	f.sale_shelf[tf.clicked_sale_shelf].item_no = tf.dummy;
[endscript]

@jump target=*Part1

;-----------------------------------------------------------
; 倉庫アイテムのクリック処理
;-----------------------------------------------------------
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

;-----------------------------------------------------------
*clicked_warehouse
;-----------------------------------------------------------

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

;-----------------------------------------------------------
*exc_sale_shelf
;-----------------------------------------------------------

[iscript]
	tf.dummy = f.warehouse[tf.clicked_warehouse].item_no;
	f.warehouse[tf.clicked_warehouse].item_no = f.sale_shelf[tf.exc_sale_shelf].item_no;
	f.sale_shelf[tf.exc_sale_shelf].item_no = tf.dummy;
[endscript]

[emb exp="tf.exc_sale_shelf"]と入れ替えます。[p]

@jump target=*Part1


処理に成功しました[p]

[func_face_hide name="youmu"]

;-----------------------------------------------------------
*End
;-----------------------------------------------------------

; [jump] 目次画面にジャンプします。
[jump storage="select.ks"]