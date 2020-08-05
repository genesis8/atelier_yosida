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

; マクロ登録
[call storage="005_macro\001_load_all.ks"]

[func_face_show name="youmu"]

*MainLoop

; 描画;
[update_main_window]
;[freeimage layer="0" page="back"]
;[call storage="003_show\003_sale_shelf.ks"]
;[call storage="003_show\004_warehouse.ks"]
;[call storage="003_show\002_menu.ks"]
;[call storage="003_show\005_status.ks"]
; 描画結果を反映;
;[trans layer="0" time="0"]

; メニュー用クリッカブルを生成
[clickable color="white" opacity="0"      x="&  5 + 130 * 0 " y="& 5" width="120" height="30" mouseopacity="50" target="*Shinkou"]
[clickable color="white" opacity="0"      x="&  5 + 130 * 1 " y="& 5" width="120" height="30" mouseopacity="50" target="*Koudou"]
[clickable color="white" opacity="0"      x="&  5 + 130 * 2 " y="& 5" width="120" height="30" mouseopacity="50" target="*Gaisyutu"]
[clickable color="white" opacity="0"      x="&  5 + 130 * 3 " y="& 5" width="120" height="30" mouseopacity="50" target="*Tokusyu"]
[clickable color="white" opacity="0"      x="&  5 + 130 * 4 " y="& 5" width="120" height="30" mouseopacity="50" target="*Jyouhou"]
[clickable color="white" opacity="0"      x="&  5 + 130 * 5 " y="& 5" width="120" height="30" mouseopacity="50" target="*Settei"]

何をしようかな？

; ジャンプバック地点を登録 
[iscript]
	f.jbs = "test\\008_menu_control.ks";
	f.jbt = "*End";
[endscript]

[s]


*Shinkou
[cm]	[jump storage="001_main\021_shinkou.ks"]	[jump target="*End"]
*Koudou
[cm]	[jump storage="001_main\022_koudou.ks"]		[jump target="*End"]
;[cm]	[jump storage="001_main\101_num_input.ks"]		[jump target="*End"]

*Gaisyutu
[cm]	[jump storage="001_main\023_gaisyutu.ks"]	[jump target="*End"]
*Tokusyu
[cm]	[jump storage="001_main\024_tokusyu.ks"]	[jump target="*End"]
*Jyouhou
[cm]	[jump storage="001_main\025_jyouhou.ks"]	[jump target="*End"]
*Settei
[cm]	[jump storage="001_main\026_settei.ks"]		[jump target="*End"]

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