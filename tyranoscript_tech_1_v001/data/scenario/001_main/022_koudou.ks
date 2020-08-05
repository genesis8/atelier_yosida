;-----------------------------------------------------
; 行動コマンド
;-----------------------------------------------------

*Start

; 別の場所にジャンプするので、ジャンプバック先を別名保存する（バグの温床になりそうだなぁ）
[iscript]
	f.jbs_022 = f.jbs;
	f.jbt_022 = f.jbt;
[endscript]

*Choice
そして僕にできるコト
[glink x="230" y="100" text="お店の掃除をする  " target="*Souji"    color="my-anim2"]
[glink x="230" y="160" text="お店の宣伝をする"   target="*Senden" color="my-anim2"]
[glink x="230" y="220" text="パチ屋に行く      " target="*Pachi"    color="my-anim2"]
[glink x="230" y="280" text="やっぱやめとく    " target="*Yametoku" color="my-anim2"]
[s]

*Souji
[jump target="*SoujiSudeniClean" cond="f.dirt==0"]
よろしい、ならば清掃だ。[p]
[call storage="004_update/002_cleanup.ks"]
[update_main_window]
[jump target=*Choice]

*SoujiSudeniClean
既にこれ以上ないくらいにキレイだよ。[p]
[jump target=*Choice]

*Senden
[iscript]
	f.jbs="001_main/022_koudou.ks"
	f.jbt="*Choice";
[endscript]

[jump storage="001_main/031_koudou_senden.ks"]
[jump target=*Choice]

*Pachi
このコマンドはまだ実装されてないよ[p]
[jump target=*Choice]

*Yametoku
他のことしますか…[p]
[jump target=*End]

*End

[jump storage="&f.jbs_022" target="&f.jbt_022"]