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
[macro name="func_face_show"]
	[chara_show name="%name" layer="message0" left="2" top="482" width="156" zindex="101"]
[endmacro]

[macro name="func_face_hide"]
	[chara_hide layer="message0" name="%name" time="0"]
[endmacro]

[macro name="func_face_mod"]
	[chara_hide layer="message0" name="%name" time="0"]
[endmacro]

;-----------------------------------------------------------
*Part1
;-----------------------------------------------------------

[func_face_show name="youmu"]

うーん…ない…[p]
おかしいなぁ…確かここに挟んでおいたはずなんだけど…[p]
ない…いくら探しても出てこない…私の「へそくり」…[p]
ヨシダさんに内緒でコツコツ貯めた「へそくり」…[p]
一体どこにいったんだろう？[p]
…この家はお世辞にも泥棒に入られるような家じゃないし…[p]
これはつまり…やっぱりその…[p]
身内の犯行…？（名推理）[p]
…問い詰めてみるか…怖いけど…[p]
（ドンドン！ドンドン！）[p]
ヨシダさん！ヨシダさん！入りますよ！[p]

[func_face_hide name="youmu"]


[func_face_show name="yoshida"]

ん～…なんだよ、ヨウムちゃん。いま天鳳やってるから後でいい？[p]

[func_face_hide name="yoshida"]


[func_face_show name="youmu"]

今聞きたいんです！[p]
ヨシダさん、まさかとは思いますが私の「へそくり」取っていきませんでしたか？[p]

[func_face_hide name="youmu"]


[func_face_show name="yoshida"]

えー、いつの話？[p]
だいぶ前にありがたく使わせてもらったよ…？[p]

[func_face_hide name="yoshida"]


[func_face_show name="youmu"]

…！なに勝手に人のお金、使っているんですかーっ！！[p]

[func_face_hide name="youmu"]


[func_face_show name="yoshida"]

僕の物は僕の物、ヨウムちゃんの物も僕の物…あ、それロン。[p]
タンヤオ一盃口ドラ2。[p]

[func_face_hide name="yoshida"]


[func_face_show name="youmu"]

くぅ～…使われたくないからこそ「へそくり」として隠していたのに…[p]

[func_face_hide name="youmu"]

（ドンドン！）[p]
すみませ～ん。早朝から失礼いたします。[p]


[func_face_show name="youmu"]

む…お客さんか…NHKの集金だったら追い返そう。[p]
（ガチャ）[p]
[func_face_hide name="youmu"]


[func_face_show name="ushijima"]

おはようございます。[p]
カウカウファイナンスの者ですが…[p]

[func_face_hide name="ushijima"]


[func_face_show name="youmu"]

…？サラ金が、うちに何か？[p]

[func_face_hide name="youmu"]


[func_face_show name="ushijima"]

はい。[p]
こちらにヨシダ様はおられますよね？[p]
そのヨシダ様に当社からお金をお借りいただいたのですが、[p]
実はその返済期間を過ぎても、まだ返済の方が滞っておりまして…[p]
それで伺ったのですが…[p]

[func_face_hide name="ushijima"]


[func_face_show name="youmu"]
…！？ちょ…ちょっと待って下さい。[p]
借金のことなんて知りませんよ！？[p]
[func_face_hide name="youmu"]


[func_face_show name="ushijima"]
はぁ…しかし、これがその証拠と言いますか…借用書になります。[p]
[func_face_hide name="ushijima"]

[func_face_show name="youmu"]
…！じゅ…じゅ…10万＄！？[p]
[func_face_hide name="youmu"]


[func_face_show name="ushijima"]
二か月ほど前に300＄ほど返済はしていただいたのですが、[p]
それっきりでして・・・[p]
[func_face_hide name="ushijima"]

[func_face_show name="youmu"]
…300＄…私の「へそくり」と同じ額じゃ…[p]
[func_face_hide name="youmu"]

[func_face_show name="ushijima"]
そういうわけですので…[p]
なるべく早いうちに返済を済ましてください。お願いします。[p]
[func_face_hide name="ushijima"]

[func_face_show name="youmu"]
は・・・はぁ・・・色々ご迷惑おかけしました・・・[p]
……[p]
ヨシダさんーっ！[p]
[func_face_hide name="youmu"]

[func_face_show name="yoshida"]
あ～うるさい…頭に響く…きちぃ…[p]
[func_face_hide name="yoshida"]

[func_face_show name="youmu"]
呑気にネトゲで遊んでる場合じゃないですよ！[p]
なんですか！この借金10万＄って！[p]
[func_face_hide name="youmu"]

[func_face_show name="yoshida"]
麻雀は実質仕事だよ。[p]
[func_face_hide name="yoshida"]

[func_face_show name="youmu"]
さっきサラ金の人が来てたんですよ！[p]
[func_face_hide name="youmu"]

[func_face_show name="yoshida"]
あれはサラ金じゃなくて闇金だから安心してよ。[p]
[func_face_hide name="yoshida"]

[func_face_show name="youmu"]
サラ金の方がまだマシなのでは…？[p]
[func_face_hide name="youmu"]

[func_face_show name="yoshida"]
あ～うるさいうるさい…[p]
[func_face_hide name="yoshida"]

[func_face_show name="youmu"]
どうせ、またこの借金は私に支払わせる気でしょう！？[p]
[func_face_hide name="youmu"]

[func_face_show name="yoshida"]
俺に借金を返済する能力があるとでも？[p]
[func_face_hide name="yoshida"]

[func_face_show name="youmu"]
（このオッサン開き直りやがった・・・！）[p]
[func_face_hide name="youmu"]

[func_face_show name="yoshida"]
今日はいつになくご機嫌斜めだなぁ・・・[p]
10万＄ぐらいでガタガタ言わないでよ…[p]
もぅ…[p]
[func_face_hide name="yoshida"]

[func_face_show name="youmu"]
10万＄の貯金を作るのに、どれだけ働かなければいけないか…[p]
ヨシダさんも身を持って体験してください…！[p]
[func_face_hide name="youmu"]


[func_face_show name="yoshida"]
えぇ…（困惑）[p]
[func_face_hide name="yoshida"]


[func_face_show name="youmu"]
ヨシダさんが働かないなら、今日がヨシダさんの命日になりますよ？[p]
[func_face_hide name="youmu"]


[func_face_show name="yoshida"]
む…その座った目…どうやら本気みたいだね…[p]
いわゆる反抗期ってやつか…[p]
[func_face_hide name="yoshida"]

[func_face_show name="youmu"]
…働いてください。ヨシダさん…（切実）[p]
[func_face_hide name="youmu"]

[func_face_show name="yoshida"]
はぁ…しょうがないなぁ…[p]
今回ばかりはヨウムちゃんの気迫に押されたよ…[p]
[func_face_hide name="yoshida"]

[func_face_show name="youmu"]
それじゃぁ…！[p]
[func_face_hide name="youmu"]

[func_face_show name="yoshida"]
せっかくいい土地に家を持っているんだから、お店を開こう。[p]
家にある、商品になりそうなものを持ってきてくれる？[p]
[func_face_hide name="yoshida"]

[func_face_show name="youmu"]
…わかりました！[p]
……
XXXとYYYを10個ずつ仕入れましたよ。[p]
[func_face_hide name="youmu"]

[func_face_show name="yoshida"]
ご苦労様。それじゃあ、ヨウムちゃん。[p]
ゲームの簡単な遊び方を教えてくれる？[p]
[func_face_hide name="yoshida"]

[func_face_show name="youmu"]
基本的に、仕入れた商品をひたすら売るのみです。[p]
画面左上にある「進行」を押し、時間を進めて仕入れた商品を売り、[p]
また商品を仕入れる…の繰り返しですね。[p]
ステータスの説明もしておきますね。[p]
まず、下の4本のバーについて説明します。[p]
これは上から順にお店の汚れ、お店の人気、経験値、ヨシダさんの精神力となっています。まぁ…遊んでいけば分かるでしょう…[p]
役割は割愛しますね。[p]
それと、その右上にある「倉庫〇／〇」と書かれたものが倉庫の空き具合です。[p]
倉庫に最大で30個の商品を格納できることを示しています。
それから、商品によっては使用することのできる商品もあります。[p]
商品名をクリックすることで商品の情報を調べるだけでなく、[p]
その商品を使用することも可能です。[p]
[func_face_hide name="youmu"]

[func_face_show name="yoshida"]
ふーん。なんかややこしいけど…そのうち慣れるよね。[p]
[func_face_hide name="yoshida"]

[func_face_show name="youmu"]
そう願いたいところです…[p]
[func_face_hide name="youmu"]

[func_face_show name="yoshida"]
はいはい。それじゃ、そろそろ始めようか。[p]
[func_face_hide name="yoshida"]

[func_face_show name="youmu"]
はい。それと、商品はさきほど仕入れましたが、[p]
これらは利益の少ない商品ばかりです。[p]
市場を利用したり、XXXXたちを頼って、質の高い商品を集めるよう、努力してください。[p]
[func_face_hide name="youmu"]

[func_face_show name="yoshida"]
OK牧場。[p]
[func_face_hide name="yoshida"]

;[chara_hide layer="message0" name="yoshida" time="0"]
;[chara_hide layer="message0" name="youmu" time="0"]
;;; [注意] ここで登場しているキャラすべてを chara_hideしないと処理が進まないので注意！

[free       layer="message0" name="chara_name"]

;-----------------------------------------------------------
*End
;-----------------------------------------------------------

; [jump] 目次画面にジャンプします。
[jump storage="select.ks"]