;-----------------------------------------------------
; ショップ：銀行
;-----------------------------------------------------

*Start

; 別の場所にジャンプするので、ジャンプバック先を別名保存する（バグの温床になりそうだなぁ）
[iscript]
	f.jbs_045 = f.jbs;
	f.jbt_045 = f.jbt;
[endscript]

私の借金力は[emb exp="f.debt"]です。[p]
いくら返済する？

[iscript]
	f.input_max = Math.min(f.money, f.debt);	
	f.jbs = "001_main/045_shop_ginkou.ks";
	f.jbt = "*BuyNum";
[endscript]

[jump storage="001_main\101_num_input.ks"]

*BuyNum
; 0個が選択された時は買わない場合のメッセージを出す
[jump target="*BuyNum0" cond="f.input=='0'"]

[iscript]
	f.debt -= f.input;
	f.money -= f.input;
[endscript]

[update_main_window]
残りの借金は[emb exp="f.debt"]$だよ。[p]

（借金額がゼロだったらエンディングイベントへ飛ぶ）[p]

[jump storage="&f.jbs_045" target="&f.jbt_045"]
