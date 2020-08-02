;-----------------------------------------------------
; ショップ：カード屋
;-----------------------------------------------------

*Start

; 別の場所にジャンプするので、ジャンプバック先を別名保存する（バグの温床になりそうだなぁ）
[iscript]
	f.jbs_042 = f.jbs;
	f.jbt_042 = f.jbt;
[endscript]

*Choice
（画面と顔窓切り替え：カード屋）
[glink x="230" y="100" text="カード1" exp=" tf.num = '1' " target="*Buy" color="my-anim2"]
[glink x="230" y="160" text="カード2" exp=" tf.num = '2' " target="*Buy" color="my-anim2"]
[glink x="230" y="220" text="カード3" exp=" tf.num = '3' " target="*Buy" color="my-anim2"]
[glink x="230" y="280" text="カード4" exp=" tf.num = '4' " target="*Buy" color="my-anim2"]
[glink x="230" y="340" text="カード5" exp=" tf.num = '5' " target="*Buy" color="my-anim2"]
[glink x="230" y="400" text="買うのをやめる" target="*Yametoku" color="my-anim2"]
[s]

*Buy
カード[emb exp="tf.num"]の購入処理を行います[p]
[jump target=*End]

*Yametoku
金が勿体ないしやめとくかァ～[p]
[jump target=*End]

*End
[jump storage="&f.jbs_042" target="&f.jbt_042"]
