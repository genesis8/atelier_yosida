;------------------------------
; キャラの定義
;------------------------------

; [chara_new][chara_face]x4 あかねを定義しています。
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
[chara_new  name="youmu"  jname="ヨウム"  storage="chara/002_youmu/normal.png"  ]
[chara_face name="youmu"   face="angry"   storage="chara/002_youmu/angry.png"   ]
[chara_face name="youmu"   face="doki"    storage="chara/002_youmu/doki.png"    ]
[chara_face name="youmu"   face="happy"   storage="chara/002_youmu/happy.png"   ]
[chara_face name="youmu"   face="sad"     storage="chara/002_youmu/sad.png"     ]
[chara_face name="youmu"   face="ase"     storage="chara/002_youmu/ase.png"     ]
[chara_face name="youmu"   face="confuse" storage="chara/002_youmu/confuse.png" ]
[chara_face name="youmu"   face="doya"    storage="chara/002_youmu/doya.png"    ]
[chara_face name="youmu"   face="kobi"    storage="chara/002_youmu/kobi.png"    ]
[chara_face name="youmu"   face="noroi"   storage="chara/002_youmu/noroi.png"   ]
[chara_face name="youmu"   face="tere"    storage="chara/002_youmu/tere.png"    ]

; レイムを定義
[chara_new  name="reimu"  jname="レイム"  storage="chara/004_reimu/normal.png"  ]
[chara_face name="reimu"   face="angry"   storage="chara/004_reimu/angry.png"   ]
[chara_face name="reimu"   face="doki"    storage="chara/004_reimu/doki.png"    ]
[chara_face name="reimu"   face="happy"   storage="chara/004_reimu/happy.png"   ]
[chara_face name="reimu"   face="sad"     storage="chara/004_reimu/sad.png"     ]
[chara_face name="reimu"   face="confuse" storage="chara/004_reimu/confuse.png" ]
[chara_face name="reimu"   face="doya"    storage="chara/004_reimu/doya.png"    ]
[chara_face name="reimu"   face="noroi"   storage="chara/004_reimu/noroi.png"   ]
[chara_face name="reimu"   face="tere"    storage="chara/004_reimu/tere.png"    ]

; マリサを定義
[chara_new  name="marisa"  jname="マリサ"  storage="chara/005_marisa/normal.png"  ]
[chara_face name="marisa"   face="angry"   storage="chara/005_marisa/angry.png"   ]
[chara_face name="marisa"   face="doki"    storage="chara/005_marisa/doki.png"    ]
[chara_face name="marisa"   face="happy"   storage="chara/005_marisa/happy.png"   ]
[chara_face name="marisa"   face="sad"     storage="chara/005_marisa/sad.png"     ]
[chara_face name="marisa"   face="confuse" storage="chara/005_marisa/confuse.png" ]
[chara_face name="marisa"   face="doya"    storage="chara/005_marisa/doya.png"    ]
[chara_face name="marisa"   face="noroi"   storage="chara/005_marisa/noroi.png"   ]
[chara_face name="marisa"   face="tere"    storage="chara/005_marisa/tere.png"    ]

; ウシジマを定義
[chara_new  name="ushijima"  jname="ウシジマ" storage="chara/003_ushijima/normal.png"  ]

;------------------------------
; キャラを表示するマクロ
;------------------------------
[macro name="func_face_show"]
	[chara_show name="%name" layer="message0" face="%face" left="2" top="482" width="156" zindex="101" time="100"]
[endmacro]

[macro name="func_face_hide"]
	[chara_hide layer="message0" name="%name" time="100"]
[endmacro]

[macro name="func_face_mod"]
	[chara_mod layer="message0" name="%name" face="%face" time="100"]
[endmacro]

[return]