
; == select.ks =============================================

; タイトル画面を作成するシナリオファイルです。

; 技術的にやや高度なことをしています。
; ノベルゲーム作りにはほとんど関係ない技術ですので、
; いちおうコメントは記しておきますが、無理して読解に挑む必要はないです。

; ==========================================================






; ----------------------------------------------------------
*Start
; ----------------------------------------------------------


; [layopt]
; メッセージレイヤーは消します。
[layopt layer="message0" visible="false"]
[layopt layer="message1" visible="false"]
[layopt layer="0" visible="true"]
[layopt layer="1" visible="true"]
[layopt layer="2" visible="true"]

; [hidemenubutton] メニューボタンを隠します。
[hidemenubutton]

; [deffont][resetfont] フォントのデフォルト設定を行います。
[deffont size="40" face="ロゴたいぷゴシック,メイリオ,sans-serif" color="0xffffff" edge="0x000000"]
[resetfont]

; [eval]
; 二つのゲーム変数、
;
;     f.current_page_index … 現在のページ番号は何か？（数値。1, 2, 3, …）
;     f.current_page_label … 現在のページのラベル名は何か？（文字列。'*Sub_Page1', '*Sub_Page2', …）
;
; を、それぞれ[eval]によって定義します。
; ここで、cond="f.current_page_index == undefined"に注目してください！
; これは、｢f.current_page_indexがなんにも定義されていなかったらこのタグを実行してね｣という合図です。
; もし一度でもここのシナリオを通ってf.current_page_indexに1が代入される処理が実行されていれば、
; もう次回以降このタグの処理が行われることはない、ということになります。
; こうすることによって、前回のページ番号の引継ぎができます。
[eval exp="f.current_page_index = 2" cond="f.current_page_index == undefined"]
[eval exp="f.current_page_label = '*Sub_Page' + f.current_page_index" ]

; [mask]
; マスクをかけて画面再構築の準備をします。
[mask graphic="mask_logo.png" time="800" effect="fadeInUp"]

; [destroy]
; これは独自マクロです(→macro.ks)。
; ゲーム画面を破壊してまっさらな状態にします。
[destroy]

; [bg]
; 背景を表示します。
; [bg]のstorageには通常｢bgimage｣フォルダに入っているファイルを
; 指定しますが、｢../fgimage/｣のように記述することで、
; ｢fgimage｣など他のフォルダにあるファイルも指定できます。
; ここでは白1ドットのPNG画像を読み込み、それをゲーム画面いっぱいに引き伸ばすことで、
; 結果として背景が真っ白になります。
[bg time="0" storage="../fgimage/color/white.png"]

; [wait]
; マスク画像（アイキャッチ画像）を見せたいので、ちょっと待ちます。
; あまり長いとストレスになりますので、ちょっとだけ。
[wait time="600"]

; [button]
; ｢前ページへ｣｢次ページへ｣ボタンを表示します。
; このボタンは常に表示したいので、fix="true"としています。
; (fix="true"とした場合、ジャンプ先はサブルーチンとしてコールされ、コールスタックが溜まります。)
; ここで、x座標に着目してください。-400, 960です。
; この時点では画面内に映っていないのです！
; あとから[anim]を使って画面内に表示させます。
[button name="prev" graphic="title_button/prev.png" x="-400" y="575" fix="true" target="*Sub_Prev"]
[button name="next" graphic="title_button/next.png" x=" 960" y="575" fix="true" target="*Sub_Next"]

; [call]
; 選択肢表示サブルーチンを呼びます。
[call target="& f.current_page_label"]

; [mask_off]
; ここまでで、ゲーム画面の構築が終わりました。
; かけていたマスクを外します。
[mask_off time="400"]

; ゲームを停止させます。
; 原則として、選択肢を表示した後はゲームを停止させなければいけません。
[s]



; ----------------------------------------------------------
*Sub_Page1
; ----------------------------------------------------------

; 選択肢表示サブルーチン１ページ目。

; [index_reset]
; これは独自マクロです(→macro.ks)。
; リストアイテム番号(一時変数)をリセットします。
[index_reset]

; [list_item]
; これは独自マクロです(→macro.ks)。
; リストアイテムを表示していきます。
[list_item2 text1="x1…連想配列の実験           " text2="セーブはされるのか？    " storage="test/001_dict_test.ks     "]
[list_item2 text1="x2…メッセージウィンドウ改造 " text2="パクリ構成にしよう      " storage="test/002_text_windows.ks  "]
[list_item2 text1="x3…オープニングイベント     " text2="～茶番～                " storage="test/003_opening_event.ks "]
[list_item2 text1="x4…状態の表示と選択         " text2="クリックされたボタン取得" storage="test/004_state_drawing.ks "]
[list_item2 text1="x5…状態の表示と入れ替え     " text2="中々面倒                " storage="test/005_state_drawing_exchange.ks"]
[list_item text1="06…文字オブジェクトを出す  " text2="[ptext]                 " storage="06_ptext.ks     " shiryou="no"]

; [anim]
; ｢前ページへ｣ボタンは画面〈外〉に、｢次ページへ｣ボタンは画面〈内〉に。
[anim name="prev" left="-400" time="0"]
[anim name="next" left=" 660" time="0"]
;;; これなんだ？
;;;       →prev,next はあらかじめ名前が指定されたボタン
;;;       →これを動かしている、left="-400" だと画面外に配置されるので表示されない

; [button]
; あいさつ画面にいくボタンを出します。
; これはfixボタンではありませんので、[cm]で消えます。
[button graphic="title_button/title.png" x="-100" y="575" target="*BackTitle"]

; [return]
; このラベルはサブルーチンとして呼ばれるので[return]が必須です。
[return]
;;; このRETURNめっちゃ違和感ある
;;; 定義自体じゃなくて使われ方でRETURNが必要かどうかが変わるってすごい微妙な気がする
;;; うーんタグの終了宣言で必ず必要って覚えればいいか？

; ----------------------------------------------------------
*Sub_Page2
; ----------------------------------------------------------

; 選択肢表示サブルーチン２ページ目。

[index_reset]
[list_item2 text1="x7…来客処理" text2="[----]                                           " storage="test/007_raikyaku.ks"]
[list_item2 text1="x8…メニュー操作" text2="ボタンとか色々使うよ                       " storage="test/008_menu_control.ks"]
[list_item2 text1="x9…アイテム追加可否判定  " text2="item_add_judge" storage="test/009_item_add_judge.ks"]
[list_item2 text1="xA…数字入力  " text2="[button&ensp;fix=true]                            " storage="test\010_num_input.ks "]
[list_item text1="11…文字ボタンオブジェクトを出す  " text2="[glink][loadcss]                                  " storage="11_glink.ks     " shiryou="no"]
[list_item text1="12…オブジェクトを動かす！        " text2="[anim][kanim][chara_move][quake][keyframe]他      " storage="12_anim.ks      " shiryou="no"]
[anim name="prev" left="-100" time="0" effect="easeOutBack"]
[anim name="next" left=" 660" time="0" effect="easeOutBack"]
[return]



; ----------------------------------------------------------
*Sub_Page3
; ----------------------------------------------------------

; 選択肢表示サブルーチン３ページ目。

[index_reset]
[list_item text1="13…クリッカブルマップを出す      " text2="[clickable]             " storage="13_clickable.ks" shiryou="no"]
[list_item text1="14…選択肢の見せ方いろいろ！　    " text2="[link][glink][button]   " storage="14_select.ks"    shiryou="no"]
[list_item text1="15…プレイヤーに入力してもらう①  " text2="[edit][commit]          " storage="15_input_1.ks"   shiryou="no"]
[list_item text1="16…プレイヤーに入力してもらう②  " text2="[button][iscript]       " storage="16_input_2.ks"   shiryou="no"]
[list_item text1="17…ウィンドウをカスタマイズする①" text2="[position][button]      " storage="17_window_1.ks"  shiryou="no"]
[list_item text1="18…ウィンドウをカスタマイズする②" text2="[layopt][current]       " storage="18_window_2.ks"  shiryou="no"]
[anim name="prev" left="-100" time="0" effect="easeOutBack"]
[anim name="next" left=" 660" time="0" effect="easeOutBack"]
[return]



; ----------------------------------------------------------
*Sub_Page4
; ----------------------------------------------------------

; 選択肢表示サブルーチン４ページ目。

[index_reset]
[list_item text1="19…変数の話①&ensp;変数とはなにか               " text2="[eval][iscript]                " storage="19_variable_1.ks" shiryou="yes"]
[list_item text1="20…変数の話②&ensp;フラグや好感度でシナリオ分岐 " text2="[eval][iscript][if]            " storage="20_variable_2.ks" shiryou="no"]
[list_item text1="21…サブルーチンとマクロの話                     " text2="[call][return][macro][endmacro]" storage="21_macro.ks"      shiryou="yes"]
[list_item text1="22…フォントの話                                 " text2="[loadcss][font][deffont]       " storage="22_font.ks"       shiryou="no"]
[list_item text1="23…脱出ゲーム                                   "                                         storage="23_escape.ks"     shiryou="no"]
[anim name="prev" left="-100" time="0" effect="easeOutBack"]
[anim name="next" left=" 960" time="0" effect="easeOutBack"]
[return]
;;; nextのX座標が960になり、Xの最大表示領域は810なので画面外に出て見えなくなる


; ----------------------------------------------------------
*Sub_Page5
; ----------------------------------------------------------

; 選択肢表示サブルーチン５ページ目。

[index_reset]
[anim name="prev" left="-100" time="0" effect="easeOutBack"]
[anim name="next" left=" 960" time="0" effect="easeOutBack"]
[return]



; ----------------------------------------------------------
*Sub_Next
; ----------------------------------------------------------

; 次ページに向かうサブルーチンです。

; [ignore]～[endignore]
; [ignore]タグは、exp属性の中身(条件)をチェックして、
; 条件を満たしているならば[endignore]までの記述を無視する、という機能を持ったタグです。
;
; もし現在のページ番号が4以上なら、[ignore]～[endignore]の記述、
; すなわち次ページに向かう処理をまるっと無視します。
;
; これ以上ページはないのに次に進もうとしたらバグりますから、
; [ignore]で対策をしているということですね。
[ignore exp="f.current_page_index >= 4"]

; [eval]
; 現在のページ番号を１増加させ、現在のページラベルを更新します。
[eval exp="f.current_page_index += 1"]
[eval exp="f.current_page_label = '*Sub_Page' + f.current_page_index"]

; [cm]
; フリーレイヤーを解放します。
; (このタグで、クリッカブルボタンや非fixなグラフィカルボタンなどが消えます。)
[cm]

; [freeimage]
; レイヤー０を開放します。
; (このタグで、リストアイテムを形作っていた画像・文字がすべて消えます。)
[freeimage layer="0"]

; [call]
; 次のページの目次表示サブルーチンをコールします。
[call target="&f.current_page_label"]

; [endignore]
; 無視する場合はここまで無視。
[endignore]

; [return]
; このラベルはfixボタンによって呼ばれています。
; つまりサブルーチンとしてコールされているので、[return]必須です。
[return]



; ----------------------------------------------------------
*Sub_Prev
; ----------------------------------------------------------

; 前ページに向かうサブルーチンです。

[ignore exp="f.current_page_index <= 1"]
[eval exp="f.current_page_index--"]
[eval exp="f.current_page_label = '*Sub_Page' + f.current_page_index"]
[cm]
[freeimage layer="0"]
[call target="&f.current_page_label"]
[endignore]
[return]



; ----------------------------------------------------------
*BackTitle
; ----------------------------------------------------------

[dialog type="confirm" text="初起動時に表示されたあいさつを見ますか？" target="*BackTitleYes" target_cancel="*BackTitleNo" label_ok="はい" label_cancel="いいえ"]
[s]

; ------------------------------------------------------
*BackTitleNo
; ------------------------------------------------------

[cm]
[freeimage layer="0"]
[call target="*Sub_Page1"]
[s]

; ------------------------------------------------------
*BackTitleYes
; ------------------------------------------------------

[eval exp=" sf.title_moumita = 0 "]
[mask time="700"]
[destroy]
[mask_off time="0"]
[jump storage="title.ks"]