;-----------------------------------------------------
; ダミーアイテムを定義する
;-----------------------------------------------------

[iscript]
	f.item = {};
	// 0番itemはダミー
	f.item[0]= {name:"表示されてたらバグ",stock:0};
	f.item[1]= {name:"1_低級_200_40_1"	,ask_price:150	,buy_price:200	,buy_count:4	,stock:5	,auto_purchase:0	,grade:1	,demand_index:40	,process_difficulty:1	,	description:"説明"};
	f.item[2]= {name:"2_低級_100_80_2"	,ask_price:50	,buy_price:100	,buy_count:4	,stock:5	,auto_purchase:0	,grade:1	,demand_index:80	,process_difficulty:1	,	description:"説明"};
	f.item[3]= {name:"3_中級_200_40_1"	,ask_price:150	,buy_price:200	,buy_count:4	,stock:5	,auto_purchase:0	,grade:2	,demand_index:40	,process_difficulty:1	,	description:"説明"};
	f.item[4]= {name:"4_中級_100_80_2"	,ask_price:50	,buy_price:100	,buy_count:4	,stock:5	,auto_purchase:0	,grade:2	,demand_index:80	,process_difficulty:1	,	description:"説明"};
	f.item[5]= {name:"5_高級_200_40_1"	,ask_price:150	,buy_price:200	,buy_count:4	,stock:5	,auto_purchase:0	,grade:3	,demand_index:40	,process_difficulty:1	,	description:"説明"};
	f.item[6]= {name:"6_高級_100_80_2"	,ask_price:50	,buy_price:100	,buy_count:4	,stock:5	,auto_purchase:0	,grade:3	,demand_index:80	,process_difficulty:1	,	description:"説明"};

[endscript]

[return]