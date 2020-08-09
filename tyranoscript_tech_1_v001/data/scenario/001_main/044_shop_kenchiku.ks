;-----------------------------------------------------
; ショップ：卸売り
;-----------------------------------------------------

*Start

; 別の場所にジャンプするので、ジャンプバック先を別名保存する（バグの温床になりそうだなぁ）
[iscript]
	f.jbs_044 = f.jbs;
	f.jbt_044 = f.jbt;
[endscript]

（画面と顔窓切り替え：建築事務所）[p]

*Choice
何を依頼しようかな？

[glink x="230" y="100" text="売物棚を追加する"         target="*Shelf" color="my-anim2"]
[glink x="230" y="160" text="商品キャパシティを増やす" target="*Capacity" color="my-anim2"]
/*
[glink x="230" y="220" text="小学生向け歴史マンガ"   exp=" tf.buy_item_no = '154' " target="*Buy" color="my-anim2"]
[glink x="230" y="280" text="江戸時代のイラスト作品" exp=" tf.buy_item_no = '156' " target="*Buy" color="my-anim2"]
[glink x="230" y="340" text="京都のイラスト集" exp=" tf.buy_item_no = '158' " target="*Buy" color="my-anim2"]
*/
[glink x="230" y="400" text="買うのをやめる" target="*Yametoku" color="my-anim2"]
[s]

*Shelf
; まずターゲットと値段を判定する
[iscript]
	tf.tgt = -1;
	tf.cost = -1;
	
	for(tf.i = 2 ; tf.i <= 7 ; tf.i++ )
	{
		if(f.sale_shelf[tf.i].able == false)
		{
			tf.tgt = tf.i;
			tf.cost = ( tf.i - 2 ) * 3000;
			break;
		}
	}
[endscript]

[jump target="*Shelfed" cond="tf.tgt==-1"]
[jump target="*ShelfPoor" cond="f.money<tf.cost"]

売物棚を増やすには[emb exp="tf.cost"]＄必要だよ。

[glink x="230" y="100" text="依頼する" target="*ShelfYes" color="my-anim2"]
[glink x="230" y="160" text="やめとく" target="*ShelfNo"  color="my-anim2"]
[s]

[jump target=*Choice]

*Shelfed
すでに最大まで拡張済みだよ。
[jump target=*Choice]

*ShelfPoor
[emb exp="tf.cost"]＄必要だけど、お金が足りない…[p]
[jump target=*Choice]

*ShelfNo
今回はやめときますか。[p]
[jump target=*Choice]

*ShelfYes
[iscript]
	f.money -= tf.cost;
	f.sale_shelf[tf.tgt].able = true;
[endscript]
[update_main_window]
売物棚を拡張をしたよ。[p]
[jump target=*Choice]


*Capacity

[jump target="*CapacityPoor" cond="f.money<1000"]
商品キャパシティを10増やすのに1000＄必要だよ。

[glink x="230" y="100" text="依頼する" target="*CapacityYes" color="my-anim2"]
[glink x="230" y="160" text="やめとく" target="*CapacityNo"  color="my-anim2"]
[s]

*CapacityPoor
1000＄必要だけど、お金が足りない…[p]
[jump target=*Choice]

*CapacityNo
今回はやめときますか。[p]
[jump target=*Choice]

*CapacityYes
[iscript]
	f.money -= 1000;
	f.warehouse_max += 10;
[endscript]
[update_main_window]
商品キャパシティをを10拡張をしたよ。[p]
[jump target=*Choice]


/*
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
	
	f.jbs = "001_main/044_shop_oroshi.ks";
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
*/

*Yametoku
金が勿体ないしやめとくかァ～[p]
[jump target=*End]

*End
[jump storage="&f.jbs_044" target="&f.jbt_044"]
