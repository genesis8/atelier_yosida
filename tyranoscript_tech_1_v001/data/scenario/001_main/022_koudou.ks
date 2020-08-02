;-----------------------------------------------------
; 行動コマンド
;-----------------------------------------------------

*Start
そして僕にできるコト

[glink x="230" y="100" text="お店の掃除をする  " target="*Souji"    color="my-anim2"]
[glink x="230" y="160" text="お店のチラシを配る" target="*Chirashi" color="my-anim2"]
[glink x="230" y="220" text="パチ屋に行く      " target="*Pachi"    color="my-anim2"]
[glink x="230" y="280" text="やっぱやめとく    " target="*Yametoku" color="my-anim2"]
[s]

*Souji
よろしい、ならば清掃だ。[p]
[jump target=*End]

*Chirashi
営業活動も大事だよね[p]
[jump target=*End]

*Pachi
このコマンドはまだ実装されてないよ[p]
[jump target=*End]

*Yametoku
他のことしますか…[p]
[jump target=*End]

*End

[jump storage="&f.jbs" target="&f.jbt"]