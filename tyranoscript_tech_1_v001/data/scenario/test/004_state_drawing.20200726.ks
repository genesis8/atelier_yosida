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

; 表示
; index で棚番号を渡す
; 画面デザイン的に2行は無理やなぁ…1行もキツイかも
[macro name="func_view_sale_shelf"]	
	[iscript]
		tf.image = 'color/col' + f.current_page_index + '.png';
		
		if ( f.sale_shelf[mp.index]["item_no"] == 0 ) {
			tf.text1 = "（空き）";
			;tf.text2 = "";
		}else{
			tf.text1 = f.item[f.sale_shelf[mp.index]["item_no"]]["name"] + "×" + f.item[f.sale_shelf[mp.index]["item_no"]]["stock"];
			;tf.text2 = "販売数:" + f.item[f.sale_shelf[mp.index]["item_no"]]["buy_count"] + "  自動仕入数:" + f.item[f.sale_shelf[mp.index]["item_no"]]["auto_purchase"];
		};


		if ( f.sale_shelf[mp.index]["able"] == false ) {
			tf.text1 = "------";
			//tf.text2 = "";
			tf.clickable =false;
		}else{
			tf.clickable=true;
		};
	
	[endscript]
	;[image layer="0" storage="&tf.image"      x="  5" y="& mp.index * 50 + 85 " width="350" height="40"]
	
	;[button graphic="11_glink_A.png" font_color="0x000000" text="&tf.text1" x="  5" y="& mp.index * 50 + 85 " width="350" height="40" size="22"]
	;[ptext layer="1" text="&tf.text1"         x=" 10" y="& mp.index * 50 + 90 " bold="bold"   size="22"]
	; これだとテキストがボタンの裏側に出てしまうなぁ…
	
	;[ptext layer="0" text="&tf.text2"         x=" 10" y="& mp.index * 50 + 120"               size="22"]
	;[clickable color="white" opacity="0"      x="  5" y="& mp.index * 50 + 85 " width="350" height="40" mouseopacity="50" storage="& mp.storage" target="%target" cond="tf.clickable"]

	; glinkだといまいち位置が適切に指定できないなぁ…
	; height を想定の半分くらいにする必要あるし…
	;[glink color="white" font_color="0x000000" text="&tf.text1" x="  5" y="& mp.index * 50 + 85 " width="350" height="20" size="22"]
	
	[glink text="test" graphic="11_glink_A.png" font_color="0xFFFFFF" text="&tf.text1" x="  5" y="& mp.index * 50 + 85 " width="350" height="40" size="22"]
	
[endmacro]



;-----------------------------------------------------------
*Part1
;-----------------------------------------------------------

[func_face_show name="youmu"]

[func_view_sale_shelf index=0]
[func_view_sale_shelf index=1]
[func_view_sale_shelf index=2]
[func_view_sale_shelf index=3]
[func_view_sale_shelf index=4]
[func_view_sale_shelf index=5]
[func_view_sale_shelf index=6]
[func_view_sale_shelf index=7]

; ゲームを停止させる
;    →これをやらないとホイールで進行できてしまう
[s]

[emb exp="tf.text1"][l][er]
[emb exp="tf.text2"][l][er]


;[emb exp="tf.text2"][l][er]

処理に成功しました[p]
[func_face_hide name="youmu"]

;-----------------------------------------------------------
*End
;-----------------------------------------------------------

; [jump] 目次画面にジャンプします。
[jump storage="select.ks"]