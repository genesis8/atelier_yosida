;-----------------------------------------------------
; ダミーアイテムを定義する
;-----------------------------------------------------

[iscript]
	f.item = {};
	// 0番itemはダミー
	f.item[0]= {name:"表示されてたらバグ",stock:0};
	f.item[1]= {name:"1_低級_200_40_1"	,ask_price:150	,sell_price:200	,sell_count:4	,stock:5	,auto_purchase:0	,grade:"L"	,demand_index:40	,process_difficulty:1	,	description:"説明"};
	f.item[2]= {name:"2_低級_100_80_2"	,ask_price:50	,sell_price:100	,sell_count:4	,stock:5	,auto_purchase:0	,grade:"L"	,demand_index:80	,process_difficulty:1	,	description:"説明"};
	f.item[3]= {name:"3_中級_200_40_1"	,ask_price:150	,sell_price:200	,sell_count:4	,stock:5	,auto_purchase:0	,grade:"M"	,demand_index:40	,process_difficulty:1	,	description:"説明"};
	f.item[4]= {name:"4_中級_100_80_2"	,ask_price:50	,sell_price:100	,sell_count:4	,stock:5	,auto_purchase:0	,grade:"M"	,demand_index:80	,process_difficulty:1	,	description:"説明"};
	f.item[5]= {name:"5_高級_200_40_1"	,ask_price:150	,sell_price:200	,sell_count:4	,stock:5	,auto_purchase:0	,grade:"H"	,demand_index:40	,process_difficulty:1	,	description:"説明"};
	f.item[6]= {name:"6_高級_100_80_2"	,ask_price:50	,sell_price:100	,sell_count:4	,stock:5	,auto_purchase:0	,grade:"H"	,demand_index:80	,process_difficulty:1	,	description:"説明"};
	
	f.item[101]={	name:"スタンのシングルカード",	ask_price:6,	sell_price:8,	sell_count:0,	stock:0,	auto_purchase:0,	grade:"L",	demand_index:80,	process_id:106,	process_difficulty:60,	description:"スタン落ちしたら活躍は厳しそう。"	};
	f.item[102]={	name:"パイオニアのシングルカード",	ask_price:10,	sell_price:13,	sell_count:0,	stock:0,	auto_purchase:0,	grade:"L",	demand_index:70,	process_id:107,	process_difficulty:60,	description:"パイオニアってフォーマットが無かったら2円。"	};
	f.item[103]={	name:"モダンのシングルカード",	ask_price:14,	sell_price:18,	sell_count:0,	stock:0,	auto_purchase:0,	grade:"M",	demand_index:60,	process_id:108,	process_difficulty:60,	description:"あの時捨てずに取っておけば…なカード多数。"	};
	f.item[104]={	name:"レガシーのシングルカード",	ask_price:560,	sell_price:640,	sell_count:0,	stock:0,	auto_purchase:0,	grade:"H",	demand_index:30,	process_id:109,	process_difficulty:5,	description:"貴族が遊戯に使うカード。"	};
	f.item[105]={	name:"ヴィンテのシングルカード",	ask_price:5600,	sell_price:6400,	sell_count:0,	stock:0,	auto_purchase:0,	grade:"H",	demand_index:20,	process_id:110,	process_difficulty:5,	description:"石油王が遊戯に使うカード。"	};
	f.item[106]={	name:"スタンの構築済デッキ",	ask_price:260,	sell_price:300,	sell_count:0,	stock:0,	auto_purchase:0,	grade:"L",	demand_index:80,	process_id:-1,	process_difficulty:-1,	description:"禁止におびえながら遊ぶ道具。"	};
	f.item[107]={	name:"パイオニアの構築済デッキ",	ask_price:520,	sell_price:600,	sell_count:0,	stock:0,	auto_purchase:0,	grade:"L",	demand_index:70,	process_id:-1,	process_difficulty:-1,	description:"まずは遊んでくれる人を探すのが大変。"	};
	f.item[108]={	name:"モダンの構築済デッキ",	ask_price:1050,	sell_price:1200,	sell_count:0,	stock:0,	auto_purchase:0,	grade:"M",	demand_index:60,	process_id:-1,	process_difficulty:-1,	description:"多種多様なデッキが存在する。"	};
	f.item[109]={	name:"レガシーの構築済デッキ",	ask_price:2800,	sell_price:3200,	sell_count:0,	stock:0,	auto_purchase:0,	grade:"H",	demand_index:30,	process_id:-1,	process_difficulty:-1,	description:"一生モノの宝物・・・だったが最近はそうでもない。"	};
	f.item[110]={	name:"ヴィンテの構築済デッキ",	ask_price:28000,	sell_price:32000,	sell_count:0,	stock:0,	auto_purchase:0,	grade:"H",	demand_index:20,	process_id:-1,	process_difficulty:-1,	description:"一種の美術品。"	};
	
	f.item[150]={	name:"デアゴスティーニ",	ask_price:20,	sell_price:27,	sell_count:0,	stock:0,	auto_purchase:0,	grade:"M",	demand_index:50,	process_id:-1,	process_difficulty:-1,	description:"主力商品。"	};
	f.item[151]={	name:"デアゴスティーニ（高級）",	ask_price:38,	sell_price:51,	sell_count:0,	stock:0,	auto_purchase:0,	grade:"H",	demand_index:50,	process_id:-1,	process_difficulty:-1,	description:"主力商品（高級）。"	};
	f.item[152]={	name:"白黒ドラマDVD",	ask_price:13,	sell_price:18,	sell_count:0,	stock:0,	auto_purchase:0,	grade:"M",	demand_index:40,	process_id:153,	process_difficulty:5,	description:"昭和の匂いがする。"	};
	f.item[153]={	name:"黒澤明DVDコレクション",	ask_price:60,	sell_price:83,	sell_count:0,	stock:0,	auto_purchase:0,	grade:"M",	demand_index:30,	process_id:-1,	process_difficulty:-1,	description:"全30号で完結予定です。"	};
	f.item[154]={	name:"小学生向け歴史マンガ",	ask_price:6,	sell_price:9,	sell_count:0,	stock:0,	auto_purchase:0,	grade:"L",	demand_index:40,	process_id:155,	process_difficulty:17,	description:"小学校の図書館にあったやつ。"	};
	f.item[155]={	name:"歴史マンガシリーズ",	ask_price:125,	sell_price:172,	sell_count:0,	stock:0,	auto_purchase:0,	grade:"L",	demand_index:30,	process_id:-1,	process_difficulty:-1,	description:"先史時代から近代史まで日本の歴史がわかる！"	};
	f.item[156]={	name:"江戸時代のイラスト作品",	ask_price:30,	sell_price:41,	sell_count:0,	stock:0,	auto_purchase:0,	grade:"H",	demand_index:40,	process_id:157,	process_difficulty:10,	description:"独特の筆のタッチで描かれた名画。"	};
	f.item[157]={	name:"伊藤若冲大全大全",	ask_price:310,	sell_price:418,	sell_count:0,	stock:0,	auto_purchase:0,	grade:"H",	demand_index:30,	process_id:-1,	process_difficulty:-1,	description:"いま望みうる最大にして最高の決定版画集。"	};
	f.item[158]={	name:"京都のイラスト集",	ask_price:16,	sell_price:22,	sell_count:0,	stock:0,	auto_purchase:0,	grade:"M",	demand_index:40,	process_id:159,	process_difficulty:10,	description:"GP京都は楽しかったなぁ。"	};
	f.item[159]={	name:"京の絵本ケース入りセット",	ask_price:160,	sell_price:220,	sell_count:0,	stock:0,	auto_purchase:0,	grade:"M",	demand_index:30,	process_id:-1,	process_difficulty:-1,	description:"日本人の「心の遺産」。"	};
	f.item[160]={	name:"各国地図",	ask_price:14,	sell_price:20,	sell_count:0,	stock:0,	auto_purchase:0,	grade:"M",	demand_index:40,	process_id:161,	process_difficulty:10,	description:"知りたい人は覚えてね。"	};
	f.item[161]={	name:"最新・世界大地図",	ask_price:140,	sell_price:198,	sell_count:0,	stock:0,	auto_purchase:0,	grade:"M",	demand_index:30,	process_id:-1,	process_difficulty:-1,	description:"「今」の地球の全貌がつまったアトラスです。"	};
	f.item[162]={	name:"和歌のCD",	ask_price:16,	sell_price:22,	sell_count:0,	stock:0,	auto_purchase:0,	grade:"H",	demand_index:40,	process_id:163,	process_difficulty:10,	description:"聞いてると眠くなる。"	};
	f.item[163]={	name:"万葉秀歌を旅する令和版",	ask_price:160,	sell_price:220,	sell_count:0,	stock:0,	auto_purchase:0,	grade:"H",	demand_index:30,	process_id:-1,	process_difficulty:-1,	description:"万葉人の思いを捉える待望の意欲的大型企画。"	};

[endscript]

[return]