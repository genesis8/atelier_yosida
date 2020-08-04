;アイテム追加可否判定マクロ

*Start

;-----------------------------------------------------

; 仕様が少々複雑である。return用の変数は以下の4つ
; [input]
;   mp.add_judge_item_no    … 追加したいアイテムのID
; [output]
;    f.iaj_target … 追加するのは倉庫か売物棚か。"SHELF","WAREHOUSE" のどちらか。
;    f.iaj_method … 既存アイテムへの個数追加か新規アイテムとしての登録か。"ADD","NEW"のどちらか。
;    f.iaj_slot   … スロット番号。-1 なら追加不可、可能なら 0から7の値のどれか。
;    f.iaj_num    … 倉庫キャパシティから見た、最大追加可能個数。なお、これが0であってもf.iaj_slotは-1とはしない。
;-----------------------------------------------------
[macro name="item_add_judge"]
[iscript]
	f.iaj_target = "TEKITOU";
	f.iaj_method = "TEKITOU";
	f.iaj_slot = -1;
	
	// 保有アイテム数をカウント
	tf.hoyu_item_amount = 0;
	for (tf.i = 0 ; tf.i < 8 ; tf.i++)
	{
		tf.hoyu_item_amount += f.item[f.sale_shelf[tf.i].item_no].stock;
		tf.hoyu_item_amount += f.item[f.warehouse[tf.i].item_no].stock;
	}
	f.iaj_num = f.warehouse_max - tf.hoyu_item_amount;
	
	// 追加対象と手法の判定、まずADDできるかを判断する
	for (tf.i = 0 ; tf.i < 8 ; tf.i++)
	{
		if (mp.add_judge_item_no == f.sale_shelf[tf.i].item_no)
		{
			f.iaj_target = "SHELF";
			f.iaj_method = "ADD";
			f.iaj_slot = tf.i;
			break;
		}
		if (mp.add_judge_item_no == f.warehouse[tf.i].item_no)
		{
			f.iaj_target = "WAREHOUSE";
			f.iaj_method = "ADD";
			f.iaj_slot = tf.i;
			break;
		}
	}
	
	// ADDできなかった場合に限りNEWできるか判定
	if ( f.iaj_slot == -1)
	{
		for (tf.i = 0 ; tf.i < 8 ; tf.i++)
		{
			if ( f.sale_shelf[tf.i].able && ( f.sale_shelf[tf.i].item_no == 0 ) )
			{
				f.iaj_target = "SHELF";
				f.iaj_method = "NEW";
				f.iaj_slot = tf.i;
				break;
			}
		}
		
		for (tf.i = 0 ; tf.i < 8 ; tf.i++)
		{
			if ( f.warehouse[tf.i].item_no == 0 )
			{
				f.iaj_target = "WAREHOUSE";
				f.iaj_method = "NEW";
				f.iaj_slot = tf.i;
				break;
			}
		}
	}
	[endscript]
[endmacro]

[return]

