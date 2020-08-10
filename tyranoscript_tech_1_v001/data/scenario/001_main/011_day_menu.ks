;-----------------------------------------------------
; 基本ゲーム画面（1日分）
;-----------------------------------------------------

*Start

; 別の場所にジャンプするので、ジャンプバック先を別名保存する（バグの温床になりそうだなぁ）
[iscript]
	f.jbs_011 = f.jbs;
	f.jbt_011 = f.jbt;
[endscript]

*MainLoop

[update_main_window]
[clickable color="white" opacity="0"      x="&  5 + 130 * 0 " y="& 5" width="120" height="30" mouseopacity="50" target="*Shinkou"]
[clickable color="white" opacity="0"      x="&  5 + 130 * 1 " y="& 5" width="120" height="30" mouseopacity="50" target="*Koudou"]
[clickable color="white" opacity="0"      x="&  5 + 130 * 2 " y="& 5" width="120" height="30" mouseopacity="50" target="*Gaisyutu"]
[clickable color="white" opacity="0"      x="&  5 + 130 * 3 " y="& 5" width="120" height="30" mouseopacity="50" target="*Tokusyu"]
[clickable color="white" opacity="0"      x="&  5 + 130 * 4 " y="& 5" width="120" height="30" mouseopacity="50" target="*Jyouhou"]
[clickable color="white" opacity="0"      x="&  5 + 130 * 5 " y="& 5" width="120" height="30" mouseopacity="50" target="*Settei"]

何をしようかな？

; ジャンプバック地点を登録 
[iscript]
	f.jbs = "001_main/011_day_menu.ks";
	f.jbt = "*MainLoop";
[endscript]

[s]

*Shinkou
[cm]	[jump storage="001_main\021_shinkou.ks"]
*Koudou
[cm]	[jump storage="001_main\022_koudou.ks"]
*Gaisyutu
[cm]	[jump storage="001_main\023_gaisyutu.ks"]
*Tokusyu
[cm]	[jump storage="001_main\024_tokusyu.ks"]
*Jyouhou
[cm]	[jump storage="001_main\025_jyouhou.ks"]
*Settei
[cm]	[jump storage="001_main\026_settei.ks"]


*End
1日が終わりました。[p]

[jump storage="&f.jbs_11" target="&f.jbt_11"]