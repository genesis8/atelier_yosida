; [set_default_view] 解説画面を作成する独自マクロです。(詳細は「macro.ks」をご参照ください)
[set_default_view]



; == 23_escape.ks ==========================================
;
; ティラノスクリプトの機能をフル活用して作ってみた脱出ゲームを紹介します。
;
; ★登場する主なタグ。
; [] … 
;
; ==========================================================



;-----------------------------------------------------------
*Start
;-----------------------------------------------------------

[akn/hap]
ティラノスクリプトのテクニックを総動員して、脱出ゲームのミニチュアを作ってみたよ。[p]
[akn/def]
時間がある人、興味のある人、ぜひ遊んでみてね。[p]
[mask time=500]
[wait time=500]
[destroy]
[mask_off time=0]


;-----------------------------------------------------------
*End
;-----------------------------------------------------------

; [jump] 目次画面にジャンプします。
[jump storage="escape/_start.ks"]