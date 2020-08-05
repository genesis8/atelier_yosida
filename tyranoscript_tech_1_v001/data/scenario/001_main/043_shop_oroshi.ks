;-----------------------------------------------------
; ショップ：卸売り
;-----------------------------------------------------

*Start

; 別の場所にジャンプするので、ジャンプバック先を別名保存する（バグの温床になりそうだなぁ）
[iscript]
	f.jbs_043 = f.jbs;
	f.jbt_043 = f.jbt;
[endscript]

（画面と顔窓切り替え：卸売所）[p]

*Choice
何を買おうかな？

[glink x="230" y="100" text="デアゴスティーニ"       exp=" tf.buy_item_no = '150' " target="*Buy" color="my-anim2"]
[glink x="230" y="160" text="白黒ドラマDVD"          exp=" tf.buy_item_no = '152' " target="*Buy" color="my-anim2"]
[glink x="230" y="220" text="小学生向け歴史マンガ"   exp=" tf.buy_item_no = '154' " target="*Buy" color="my-anim2"]
[glink x="230" y="280" text="江戸時代のイラスト作品" exp=" tf.buy_item_no = '156' " target="*Buy" color="my-anim2"]
[glink x="230" y="340" text="京都のイラスト集" exp=" tf.buy_item_no = '158' " target="*Buy" color="my-anim2"]
[glink x="230" y="400" text="買うのをやめる" target="*Yametoku" color="my-anim2"]
[s]

*Buy
[emb exp="f.item[tf.buy_item_no].name"]は1個
[emb exp="f.item[tf.buy_item_no].ask_price"]＄です。[p]

[item_add_judge add_judge_item_no="&tf.buy_item_no"]

; 商品キャパシティが足りないので買えないケース
[jump target="*BuyCapa0" cond="f.iaj_num==0"]

; スロットに空きがないから買えないケース
[jump target="*BuySlot0" cond="f.iaj_slot==-1"]

商品キャパシティ的には[emb exp="f.iaj_num"]個買えそうです。[p]

[iscript]
	tf.max_num_money = Math.floor( f.money / f.item[tf.buy_item_no].ask_price );
	f.input_max = String( Math.min(f.iaj_num , tf.max_num_money) );
	
	f.jbs = "001_main/043_shop_oroshi.ks";
	f.jbt = "*BuyNum";

[endscript]

お金的には[emb exp="tf.max_num_money"]個買えそうです。[p]
トータルで見ると[emb exp="f.input_max"]個までですが、いくつ購入しますか？[p]

[jump storage="001_main\101_num_input.ks"]

*BuyNum
; 0個が選択された時は買わない場合のメッセージを出す
[jump target="*BuyNum0" cond="f.input=='0'"]

[emb exp="f.input"]個購入します。[p]


[iscript]
	if (f.iaj_target == "SHELF")
	{
		// 商品を増やす
		f.sale_shelf[f.iaj_slot].item_no = tf.buy_item_no;
		f.item[tf.buy_item_no].stock += Number(f.input);
		// お金を減らす
		f.money -= f.item[tf.buy_item_no].ask_price * f.input;
	}
	
	if (f.iaj_target == "WAREHOUSE")
	{
		// 商品を増やす
		f.warehouse[f.iaj_slot].item_no = tf.buy_item_no;
		f.item[tf.buy_item_no].stock += Number(f.input);
		// お金を減らす
		f.money -= f.item[tf.buy_item_no].ask_price * f.input;
	}
[endscript]

[update_main_window]
購入したぞい。[p]

[jump target=*Choice]

*BuyNum0
やめときますか。[p]
[jump target=*Choice]

*BuyCapa0
商品キャパシティがいっぱいで買えない…。[p]
[jump target=*Choice]

*BuySlot0
売物棚と倉庫のスロットに空きがないから買えない…[p]
[jump target=*Choice]

*Yametoku
金が勿体ないしやめとくかァ～[p]
[jump target=*End]

*End
[jump storage="&f.jbs_043" target="&f.jbt_043"]
