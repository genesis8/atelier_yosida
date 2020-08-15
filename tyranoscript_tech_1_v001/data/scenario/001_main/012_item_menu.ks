;-----------------------------------------------------
; アイテム固有メニュー
;-----------------------------------------------------

*Start

; 別の場所にジャンプするので、ジャンプバック先を別名保存する（バグの温床になりそうだなぁ）
[iscript]
	f.jbs_012 = f.jbs;
	f.jbt_012 = f.jbt;
[endscript]

*MainLoop

[emb exp="f.item[f.im_item_no].name"]をどうしようか？

[glink x="230" y="100" text="情報を見る"             target="*Info"    color="my-anim2"]
[glink x="230" y="160" text="廃棄する"               target="*Trash"   color="my-anim2"]
[glink x="230" y="220" text="加工する"               target="*Engine"  color="my-anim2"]
[glink x="230" y="280" text="自動仕入れの設定をする" target="*Jidou"   color="my-anim2"]
[glink x="230" y="340" text="使う"                   target="*Use"     color="my-anim2"]
[glink x="230" y="400" text="やっぱやめとく"         target="*Yametoku" color="my-anim2"]
[s]

*Yametoku
特に何もする必要ないか[p]
[jump target=*End]

*Info
＜情報を表示＞[p]
[jump target=*MainLoop]

*Trash
在庫を全部捨ててスロットから取り除くよ？

[glink x="230" y="100" text="そうする" target="*TrashYes"    color="my-anim2"]
[glink x="230" y="160" text="やめとく" target="*TrashNo"     color="my-anim2"]
[s]

*TrashYes
断捨離するぞい。[p]

[iscript]
	f.item[f.im_item_no].stock = 0;
	if (f.im_saleorshelf == "SALE")
	{
		f.sale_shelf[f.im_slot_num].item_no = 0;
	}
	
	if (f.im_saleorshelf == "WAREHOUSE")
	{
		f.warehouse[f.im_slot_num].item_no = 0;

	}
[endscript]
[jump target=*End]

*TrashNo
それを　すてるなんて　とんでもない！[p]
[jump target=*MainLoop]

*Engine
＜注意：販売数および加工可否の制限が必要＞[p]

; 加工先の製品を何個作れるか評価
[item_add_judge add_judge_item_no="&f.item[f.im_item_no].process_id"]

[iscript]
	// 加工難易度による必要個数の算出
	// かなり適当に、技術力÷200 だけ必要量が変わる
	tf.eg_num_consume1 = f.item[f.im_item_no].process_difficulty;
	tf.eg_num_consume2 = Math.max(1,(200 - f.technic)) / 200;
	tf.eg_num_consume3 = Math.ceil(tf.eg_num_consume1 * tf.eg_num_consume2);
	
	// 精神力消費の算出
	tf.age_mental_consume_per_unit = 10;
	
	// 加工個数限界を算出
	tf.eg_makemax_stock = Math.floor( f.item[f.im_item_no].stock / tf.eg_num_consume3 );
	tf.eg_makemax_mental = Math.ceil(f.mental / tf.age_mental_consume_per_unit);
	tf.eg_makemax_slot = f.iaj_num;
	
	tf.eg_makemax = Math.min(tf.eg_makemax_stock , tf.eg_makemax_mental , tf.eg_makemax_slot);
[endscript]

[emb exp="f.item[f.item[f.im_item_no].process_id].name"]を1個作るために
[emb exp="f.item[f.im_item_no].name"]が[emb exp="tf.eg_num_consume3"]個必要です。
最大で[emb exp="tf.eg_makemax"]まで加工可能だけど、何個作る？[p]

[iscript]
	f.input_max = String( tf.eg_makemax );
	f.jbs = "001_main/012_item_menu.ks";
	f.jbt = "*EngineNum";
[endscript]
[jump storage="001_main\101_num_input.ks"]

*EngineNum
; 0個が選択された時は買わない場合のメッセージを出す
[jump target="*EngineNum0" cond="f.input=='0'"]

[emb exp="f.input"]個加工します。[p]

[iscript]
	if (f.iaj_target == "SHELF")
	{
		// 加工先の商品を増やす
		f.sale_shelf[f.iaj_slot].item_no = f.item[f.im_item_no].process_id;
		f.item[f.item[f.im_item_no].process_id].stock += Number(f.input);
		// お金を減らす
		
		// 加工元の商品を減らす
		f.item[f.im_item_no].stock -= Number(f.input) * tf.eg_num_consume3;
	}
	
	if (f.iaj_target == "WAREHOUSE")
	{
		// 加工先の商品を増やす
		f.warehouse[f.iaj_slot].item_no = f.item[f.im_item_no].process_id;
		f.item[f.item[f.im_item_no].process_id].stock += Number(f.input);
		// お金を減らす
		
		// 加工元の商品を減らす
		f.item[f.im_item_no].stock -= Number(f.input) * tf.eg_num_consume3;
	}
	// 体力を減らす
	f.mental -= Number(f.input) * tf.age_mental_consume_per_unit;
[endscript]

[update_main_window]
加工したぞい。[p]
[jump target=*MainLoop]

*EngineNum0
やめといた[p]
[jump target=*MainLoop]

*Jidou
＜自動仕入れの数値を設定＞[p]
[jump target=*MainLoop]

*Use
＜使うときの処理＞[p]
[jump target=*MainLoop]

*End
[jump storage="&f.jbs_012" target="&f.jbt_012"]