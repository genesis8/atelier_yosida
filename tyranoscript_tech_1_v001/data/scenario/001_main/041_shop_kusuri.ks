;-----------------------------------------------------
; ショップ：薬屋
;-----------------------------------------------------

*Start

; 別の場所にジャンプするので、ジャンプバック先を別名保存する（バグの温床になりそうだなぁ）
[iscript]
	f.jbs_041 = f.jbs;
	f.jbt_041 = f.jbt;
[endscript]

*Choice
（画面と顔窓切り替え：薬屋）

[glink x="230" y="100" text="薬1" exp=" tf.num = '1' " target="*Buy" color="my-anim2"]
[glink x="230" y="160" text="薬2" exp=" tf.num = '2' " target="*Buy" color="my-anim2"]
[glink x="230" y="220" text="薬3" exp=" tf.num = '3' " target="*Buy" color="my-anim2"]
[glink x="230" y="280" text="薬4" exp=" tf.num = '4' " target="*Buy" color="my-anim2"]
[glink x="230" y="340" text="薬5" exp=" tf.num = '5' " target="*Buy" color="my-anim2"]
[glink x="230" y="400" text="買うのをやめる" target="*Yametoku" color="my-anim2"]
[s]

*Buy
薬[emb exp="tf.num"]の購入処理を行います[p]
[jump target=*End]

*Yametoku
金が勿体ないしやめとくかァ～[p]
[jump target=*End]

*End
[jump storage="&f.jbs_041" target="&f.jbt_041"]
