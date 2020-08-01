;--------------------------------------------------
; 最小限の初期化を実行（よくわかってない）
;--------------------------------------------------
; [mask]～[mask_off]　マスクしている間に、画面の破壊と再構築を行います。
[mask color="white" time="400"]

; [destroy] 独自マクロ。画面にあるもの、画面にある効果、すべてを破壊します。
[destroy]

; [bg][chara_show][wait] 解説画面用の背景、キャラを表示してから、ちょっと待機します。
[bg         time="  0" storage="room.jpg"]
[wait       time="100"]
[mask_off time="400"]

;-----------------------------------------------------------
*Start
;-----------------------------------------------------------

;------------------------------
;独自ウィンドウの設定
;------------------------------
[clearfix]
[free  name="chara_name_area"  layer="message0"]
[deffont size="32" face="ロゴたいぷゴシック,メイリオ,sans-serif" color="0xffffff" edge="0x000000"]
[resetfont]

[position layer="message0" left="  0" top="480" width="960" height="160" frame="001_text_frame/test_frame1.png" margint="1" marginl="175" marginr="9" marginb="4" opacity="210"]

[iscript]
	// 行間をゼロに
	tyrano.plugin.kag.config.defaultLineSpacing = '0';
[endscript]


;------------------------------
; キャラを表示するマクロ
;------------------------------
[call storage="002_firstdef\002_chara.ks"]

;-----------------------------------------------------------
*Part1
;-----------------------------------------------------------

; ダミーデータ投入;
[call storage="900_dummy\001_dummyitem.ks"]
[call storage="900_dummy\002_dummystatus.ks"]

[func_face_show name="youmu"]

*MAINROOP

; 描画;
[freeimage layer="0" page="back"]
[call storage="003_show\003_sale_shelf.ks"]
[call storage="003_show\004_warehouse.ks"]
[call storage="003_show\002_menu.ks"]
[call storage="003_show\005_status.ks"]
; 描画結果を反映;
[trans layer="0" time="0"]

何をしようかな？
[glink x="230" y="100" text="お店の掃除をする  " target="*End" color="my-anim2"]
[glink x="230" y="160" text="お店のチラシを配る" target="*End" color="my-anim2"]
[glink x="230" y="220" text="パチ屋に行く      " target="*End" color="my-anim2"]
[glink x="230" y="280" text="やっぱやめとく    " target="*End" color="my-anim2"]
[s]


;-----------------------------------------------------------
*End
;-----------------------------------------------------------

処理に成功しました[p]
[func_face_hide name="youmu"]

; [jump] 目次画面にジャンプします。
[jump storage="select.ks"]





;-----------------------------------------------------------
*Part8
;-----------------------------------------------------------

……などなど。[p][akn/hap]
ちょっと難しいテクニックかもしれないけど……ボタンの可能性は無限大なのだよ!![p]