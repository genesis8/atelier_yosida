;-----------------------------------------------------
; 設定コマンド
;-----------------------------------------------------

*START
テスト：オープニングイベント[p]

[call storage="011_event/001_opening.ks"]

*END

[jump storage="&f.jbs" target="&f.jbt"]