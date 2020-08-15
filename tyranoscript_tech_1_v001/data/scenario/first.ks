
; == first.ks ==============================================

; ゲームを起動したとき、一番最初に読み込まれるシナリオファイルです。
; このシナリオファイルは、プラグインの読み込みやマクロの定義などの
;《ゲーム全体で必要な初期設定》を行うために使います。
; 初期設定が終わったら、[jump]タグでタイトル画面などに移行しましょう。
; (なお、このシナリオファイルのファイル名を変えてはいけません。)
;
; ==========================================================


; [title] タイトルバーに表示されるテキストを変更します。
[title name="ティラノスクリプト｜サンプルテクニック集１"]

; [call]x3 設定用サブルーチンを3つ呼びます。
[call target="*Sub_Layer"    ]
[call target="*Sub_Plugin"   ]
[call storage="002_firstdef\002_chara.ks"]
;[call target="*Sub_Character"]

; [jump] title.ksへ。
[jump storage="title.ks"]

[s]







;　～以下設定用のラベル～



; ----------------------------------------------------------
*Sub_Layer
; ----------------------------------------------------------

; レイヤーの表示非表示などを設定するサブルーチンラベルです。
; [call] でここに飛んできます。
; そして [return] に達した時点で、[call] の位置に戻ります。

; [hidemenubutton] メニューボタンを隠します。
[hidemenubutton]

; [layopt] メッセージレイヤー0番を非表示にします。
[layopt layer="message0" visible="false"]

; [layopt] 通常レイヤー0番･1番･2番を表示してあげます。
; 初期状態では非表示なので注意。
[layopt layer="0" visible="true"]
[layopt layer="1" visible="true"]
[layopt layer="2" visible="true"]

; [return] 帰ります。
[return]



; ----------------------------------------------------------
*Sub_Plugin
; ----------------------------------------------------------

; プラグインの読み込みなどを行うサブルーチンラベルです。

; [call] サブルーチンを呼びます。
[call storage="macro.ks"]

; [loadcss] cssファイルを読み込みます。独自フォントを使用するためのものです。
[loadcss file="data/others/font/font.css"]
[loadcss file="data/others/glink/glink.css"]

; [return] 帰ります。
[return]



; ----------------------------------------------------------
*Sub_Character
; ----------------------------------------------------------

; キャラクターの定義を行うサブルーチンラベルです。

[call storage="002_firstdef/002_chara.ks"]

/*
[chara_new  name="akane"  jname="あかね" storage="chara/akane/normal.png"  ]
[chara_face name="akane"   face="angry"  storage="chara/akane/angry.png"   ]
[chara_face name="akane"   face="doki"   storage="chara/akane/doki.png"    ]
[chara_face name="akane"   face="happy"  storage="chara/akane/happy.png"   ]
[chara_face name="akane"   face="sad"    storage="chara/akane/sad.png"     ]

; ヨシダを定義
[chara_new  name="yoshida"  jname="ヨシダ" storage="chara/001_yoshida/normal.png"  ]
[chara_face name="yoshida"   face="angry"  storage="chara/001_yoshida/angry.png"   ]
[chara_face name="yoshida"   face="doki"   storage="chara/001_yoshida/doki.png"    ]
[chara_face name="yoshida"   face="happy"  storage="chara/001_yoshida/happy.png"   ]
[chara_face name="yoshida"   face="sad"    storage="chara/001_yoshida/sad.png"     ]

; ヨウムを定義
[chara_new  name="youmu"  jname="ヨウム" storage="chara/002_youmu/normal.png"  ]
[chara_face name="youmu"   face="angry"  storage="chara/002_youmu/angry.png"   ]
[chara_face name="youmu"   face="doki"   storage="chara/002_youmu/doki.png"    ]
[chara_face name="youmu"   face="happy"  storage="chara/002_youmu/happy.png"   ]
[chara_face name="youmu"   face="sad"    storage="chara/002_youmu/sad.png"     ]

; ウシジマを定義
[chara_new  name="ushijima"  jname="ウシジマ" storage="chara/003_ushijima/normal.png"  ]
*/

; [return] 帰ります。
[return]