;-----------------------------------------------------
; ショップ：カード屋
;-----------------------------------------------------

*Start

; 別の場所にジャンプするので、ジャンプバック先を別名保存する（バグの温床になりそうだなぁ）
[iscript]
	f.jbs_042 = f.jbs;
	f.jbt_042 = f.jbt;
[endscript]

（画面と顔窓切り替え：カード屋）[p]

*Choice
何を買おうかな？

[glink x="230" y="100" text="スタンのカード"       exp=" tf.buy_item_no = '101' " target="*Buy" color="my-anim2"]
[glink x="230" y="160" text="パイオニアのカード"   exp=" tf.buy_item_no = '102' " target="*Buy" color="my-anim2"]
[glink x="230" y="220" text="モダンのカード"       exp=" tf.buy_item_no = '103' " target="*Buy" color="my-anim2"]
[glink x="230" y="280" text="レガシーのカード"     exp=" tf.buy_item_no = '104' " target="*Buy" color="my-anim2"]
[glink x="230" y="340" text="ヴィンテージのカード" exp=" tf.buy_item_no = '105' " target="*Buy" color="my-anim2"]
[glink x="230" y="400" text="買うのをやめる" target="*Yametoku" color="my-anim2"]
[s]

*Buy
[emb exp="f.item[tf.buy_item_no].name"]は1個
[emb exp="f.item[tf.buy_item_no].ask_price"]＄です。[p]

[item_add_judge add_judge_item_no="&tf.buy_item_no"]
商品キャパシティ的には[emb exp="f.iaj_num"]個買えそうです。[p]

[iscript]
	tf.max_num_money = Math.floor( f.money / f.item[tf.buy_item_no].ask_price );
	f.input_max = String( Math.min(f.iaj_num , tf.max_num_money) );
	
	f.jbs = "001_main/042_shop_card.ks";
	f.jbt = "*BuyNum";

[endscript]

お金的には[emb exp="tf.max_num_money"]個買えそうです。[p]
トータルで見ると[emb exp="f.input_max"]個までですが、いくつ購入しますか？[p]

[jump storage="001_main\101_num_input.ks"]

*BuyNum

[emb exp="f.input"]個購入します。[p]

（購入処理がまだない）[p]

[jump target=*Choice]

*Yametoku
金が勿体ないしやめとくかァ～[p]
[jump target=*End]

*End
[jump storage="&f.jbs_042" target="&f.jbt_042"]
