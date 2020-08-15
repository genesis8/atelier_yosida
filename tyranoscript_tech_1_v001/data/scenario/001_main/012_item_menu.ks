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
[glink x="230" y="160" text="廃棄する"               target="*Trash" color="my-anim2"]
[glink x="230" y="220" text="加工する"               target="*Engine"    color="my-anim2"]
[glink x="230" y="280" text="自動仕入れの設定をする" target="*Jidou" color="my-anim2"]
[glink x="230" y="340" text="使う"                   target="*Use" color="my-anim2"]
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
＜加工処理＞[p]
[jump target=*MainLoop]

*Jidou
＜自動仕入れの数値を設定＞[p]
[jump target=*MainLoop]

*Use
＜使うときの処理＞[p]
[jump target=*MainLoop]

*End
[jump storage="&f.jbs_012" target="&f.jbt_012"]