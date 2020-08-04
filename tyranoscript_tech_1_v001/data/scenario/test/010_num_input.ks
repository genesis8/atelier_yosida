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

*MainLoop

; 描画;
[freeimage layer="0" page="back"]
[call storage="003_show\003_sale_shelf.ks"]
[call storage="003_show\004_warehouse.ks"]
[call storage="003_show\002_menu.ks"]
[call storage="003_show\005_status.ks"]
; 描画結果を反映;
[trans layer="0" time="0"]

; メニュー用クリッカブルを生成
数字入力をテストします。[p]

[iscript]
	f.jbs = "test\\010_num_input.ks";
	f.jbt = "*End";
	f.input_max = "89006";
[endscript]

[jump storage="001_main\101_num_input.ks"]

;-----------------------------------------------------------
*End
;-----------------------------------------------------------
あなたが入力したのは「[emb exp="f.input"]」だね。[p]
処理に成功しました（010）[p]
[func_face_hide name="youmu"]

; [jump] 目次画面にジャンプします。
[jump storage="select.ks"]