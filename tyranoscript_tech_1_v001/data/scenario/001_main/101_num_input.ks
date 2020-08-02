;-----------------------------------------------------------
*Start
;-----------------------------------------------------------

実際に、数字だけを入力できるソフトウェアキーボードを作ってみました。[l]

;-----------------------------------------------------------
*Part1
;-----------------------------------------------------------

[image layer="1" x="  0" y=" 0" width="960" height="640" storage="color/black.png" name="black"]
[image layer="1" x="375" y="90" width="215" height=" 55" storage="color/white.png" ]
[ptext layer="1" x="375" y="90" name="ptext" overwrite="true" text="" color="0x666666" size="42" width="215" align="right"]

; [anim] 黒背景を透かします。
[anim name="black" opacity="100" time="0"]

; [eval] ゲーム変数 f.input に '' を入れています。
[eval exp=" f.input = '' "]

[button graphic="../fgimage/num/1.png"    x="366" y="160" exp=" tf.num = '1' " name="fix_phone" fix="true" target="*Sub_Input"]
[button graphic="../fgimage/num/2.png"    x="444" y="160" exp=" tf.num = '2' " name="fix_phone" fix="true" target="*Sub_Input"]
[button graphic="../fgimage/num/3.png"    x="522" y="160" exp=" tf.num = '3' " name="fix_phone" fix="true" target="*Sub_Input"]
[button graphic="../fgimage/num/4.png"    x="366" y="238" exp=" tf.num = '4' " name="fix_phone" fix="true" target="*Sub_Input"]
[button graphic="../fgimage/num/5.png"    x="444" y="238" exp=" tf.num = '5' " name="fix_phone" fix="true" target="*Sub_Input"]
[button graphic="../fgimage/num/6.png"    x="522" y="238" exp=" tf.num = '6' " name="fix_phone" fix="true" target="*Sub_Input"]
[button graphic="../fgimage/num/7.png"    x="366" y="316" exp=" tf.num = '7' " name="fix_phone" fix="true" target="*Sub_Input"]
[button graphic="../fgimage/num/8.png"    x="444" y="316" exp=" tf.num = '8' " name="fix_phone" fix="true" target="*Sub_Input"]
[button graphic="../fgimage/num/9.png"    x="522" y="316" exp=" tf.num = '9' " name="fix_phone" fix="true" target="*Sub_Input"]
[button graphic="../fgimage/num/0.png"    x="444" y="394" exp=" tf.num = '0' " name="fix_phone" fix="true" target="*Sub_Input"]
[button graphic="../fgimage/num/back.png" x="366" y="394"                      name="fix_phone" fix="true" target="*Sub_Back" ]
[button graphic="../fgimage/num/ok.png"   x="522" y="394"                      name="fix_phone"            target="*OK"       ]

[s]

; ------------------------------------------------------
*Sub_Input

[iscript]
if (f.input.length < 8) {
f.input = f.input + tf.num
}
[endscript]
[ptext layer="0" x="0" y="0" name="ptext" overwrite="true" text="&f.input"]
[return]

; ------------------------------------------------------
*Sub_Back
[iscript]
f.input = f.input.substr(0, f.input.length - 1)
[endscript]
[ptext layer="0" x="0" y="0" name="ptext" overwrite="true" text="&f.input"]
[return]

; ------------------------------------------------------
*OK

[cm]
[freeimage layer="1"]
[clearfix name="fix_phone"]

あなたが入力したのは「[emb exp="f.input"]」だね。[p]

;-----------------------------------------------------------
*Part2
;-----------------------------------------------------------

;-----------------------------------------------------------
*End
;-----------------------------------------------------------

; [jump] 目次画面にジャンプします。
[jump storage="select.ks"]