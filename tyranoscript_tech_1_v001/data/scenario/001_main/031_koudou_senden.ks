;-----------------------------------------------------
; 宣伝
;-----------------------------------------------------

*Start

; 別の場所にジャンプするので、ジャンプバック先を別名保存する（バグの温床になりそうだなぁ）
[iscript]
	f.jbs_031 = f.jbs;
	f.jbt_031 = f.jbt;
[endscript]

A0サイズの駅ばりポスターでお店の宣伝をするよ。一口500＄だけど、どのくらい依頼しようか？[p]

*Buy
[iscript]
	tf.max_num_money = Math.floor( f.money / 500 );
	f.input_max = String( tf.max_num_money );
	
	f.jbs = "001_main/031_koudou_senden.ks";
	f.jbt = "*BuyNum";
[endscript]

お金的には[emb exp="tf.max_num_money"]口まで依頼できそうです。[p]
いくつ購入しますか？[p]

[jump storage="001_main\101_num_input.ks"]

*BuyNum
; 0個が選択された時は買わない場合のメッセージを出す
[jump target="*BuyNum0" cond="f.input=='0'"]

[emb exp="f.input"]口依頼します。[p]

[iscript]
	// 名声値を増やす
	f.fame += Number(f.input);
	
	// お金を減らす
	f.money -= 500 * Number(f.input);
[endscript]

[update_main_window]
名声値が上がったぞい。[p]
[jump target=*End]

*BuyNum0
やめときますか。[p]
[jump target=*End]

*End
[jump storage="&f.jbs_031" target="&f.jbt_031"]
