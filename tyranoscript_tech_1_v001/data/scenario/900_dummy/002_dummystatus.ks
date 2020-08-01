;-----------------------------------------------------
; ダミーステータスを定義する
;-----------------------------------------------------

[iscript]

	f.hour			= 8;
	f.minute		= 30;
	f.day_count		=4;
	f.mental		=90;
	f.mental_max	=100;
	f.dirt			=30;
	f.dirt_max		=100;
	f.exp			=25;
	f.popularity	=13;
	f.money			=5000;
	f.fame			=9;
	f.technic		=13;
	f.kyaku_grade	=20;
	f.warehouse_max	=30;
		
	f.sale_shelf = [
		{able:true	,item_no:1},
		{able:true	,item_no:2},
		{able:true	,item_no:6},
		{able:false	,item_no:0},
		{able:false	,item_no:0},
		{able:false	,item_no:0},
		{able:false	,item_no:0},
		{able:false	,item_no:0}
	];
	
	f.warehouse = [
		{item_no:3},
		{item_no:4},
		{item_no:0},
		{item_no:0},
		{item_no:0},
		{item_no:0},
		{item_no:0},
		{item_no:0}
	];
	
	f.storage_box = [
		{item_no:1,	stock:10},
		{item_no:2,	stock:10},
		{item_no:3,	stock:30},
		{item_no:4,	stock:30}
	];
[endscript]

[return]