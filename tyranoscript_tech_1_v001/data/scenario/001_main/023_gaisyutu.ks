;-----------------------------------------------------
; 外出コマンド
;-----------------------------------------------------

*Start

; 別の場所にジャンプするので、ジャンプバック先を別名保存する（バグの温床になりそうだなぁ）
[iscript]
	f.jbs_023 = f.jbs;
	f.jbt_023 = f.jbt;
[endscript]

*Choice
どこに買い出しに行こうかな？

[glink x="230" y="100" text="薬屋へ買い出しに行く" target="*Kusuri"    color="my-anim2"]
[glink x="230" y="160" text="カード屋へ買い出しに行く" target="*Card" color="my-anim2"]
[glink x="230" y="220" text="書店卸売所へ行く" target="*Oroshi" color="my-anim2"]
[glink x="230" y="280" text="今村建築設計事務所へ行く" target="**Kenchiku" color="my-anim2"]
[glink x="230" y="340" text="カウカウファイナンスへ行く" target="Ginkou" color="my-anim2"]
[glink x="230" y="400" text="やっぱやめとく    " target="*Yametoku" color="my-anim2"]
[s]

*Kusuri
薬屋へ行くかァ～[p]
;ジャンプバック先
[iscript]
	f.jbs = "001_main\\023_gaisyutu.ks";
	f.jbt = "*Choice";
[endscript]
[jump storage="001_main\041_shop_kusuri.ks"]
;[jump target=*End]

*Card
カード屋へ行くかァ～[p]
;ジャンプバック先
[iscript]
	f.jbs = "001_main\\023_gaisyutu.ks";
	f.jbt = "*Choice";
[endscript]
[jump storage="001_main\042_shop_card.ks"]

*Oroshi
卸へ行くかァ～[p]
;ジャンプバック先
[iscript]
	f.jbs = "001_main\\023_gaisyutu.ks";
	f.jbt = "*Choice";
[endscript]
[jump storage="001_main\043_shop_oroshi.ks"]

*Kenchiku
改装の依頼をしに行くよ。[p]
;ジャンプバック先
[iscript]
	f.jbs = "001_main\\023_gaisyutu.ks";
	f.jbt = "*Choice";
[endscript]
[jump storage="001_main\044_shop_kenchiku.ks"]

*Ginkou
年貢の納め時だな、ヨシダー。[p]
;ジャンプバック先
[iscript]
	f.jbs = "001_main\\023_gaisyutu.ks";
	f.jbt = "*Choice";
[endscript]
[jump storage="001_main/045_shop_ginkou.ks"]

*Yametoku
外出は自粛しとこう。[p]
[jump target=*End]

*End
[jump storage="&f.jbs_023" target="&f.jbt_023"]
