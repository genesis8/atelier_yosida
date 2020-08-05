;-----------------------------------------------------
; 進行コマンド
;-----------------------------------------------------

*Start
進行を実行します[p]

*RaikyakuLoop
; 時間を進める
[call storage="004_update\001_tick.ks" target=*MINUTE10]

;来客処理
[call storage="004_update\010_raikyaku.ks"]
[update_main_window]

; 18時になったら終了
[jump target=*RaikyakuLoop cond="f.hour<18"]

*End
営業終了時間になりました。[p]

[jump storage="&f.jbs" target="&f.jbt"]