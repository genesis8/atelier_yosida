[set_default_view]
[akn/def]

;-----------------------------------------------------------
*Start
;-----------------------------------------------------------

; 結論
; ①連想配列はセーブされる
; ② typeof x === "undefined" を使った最初のみ初期化は可能

[iscript]
	
		f.ikiri1={
			message1:"麻雀勝つために大事なのはどう打つかじゃなくて誰と打つかなんだよなぁ",
			message2:"スルーが強すぎる？意味がわからん下手すぎるの間違いやろ",
			message3:"こいつ日本語苦手なのでは？？？(名推理)",
			message4:"事故ったからスリーブ変えるとか言わないで欲しいな 馬鹿が増える",
			message5:"よっわーｗこいつは出たレア全部使うとかゆう縛りプレイでもしてるの？",
			message6:"装備品はいっぱい入れすぎると事故のもとだから気を付けような！先生との約束だ！",
			count:0
		};
	if (typeof f.count === "undefined"){
		f.count = 0;
	}
[endscript]

[emb exp="f.ikiri1.message1"]
[l][er]
[emb exp="f.ikiri1.message2"]
[l][er]
[emb exp="f.ikiri1.message3"]
[l][er]
[emb exp="f.ikiri1.message4"]
[l][er]
[emb exp="f.ikiri1.message5"]
[l][er]

[akn/hap]

[emb exp=f.ikiri1.message6][l][er]

[iscript]
	f.count = f.count + 1;
[endscript]
イキッた回数は[emb exp="f.count"]回だよ[l][er]
;;; セーブされることは分かったが、これが毎回「1回だよ」になってしまうな？
;;; 変数がどこかでdestroyされている？


;-----------------------------------------------------------
*End
;-----------------------------------------------------------

; [jump] 目次画面にジャンプします。
[jump storage="select.ks"]