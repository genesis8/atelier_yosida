;-----------------------------------------------------------
; ��Ԃ̒�`
;-----------------------------------------------------------
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
	f.money			=4649;
	f.fame			=9;
	f.technic		=13;
	f.warehouse_max	=30;
	f.item = {};
	
	// �A�C�e���Q
	f.item[1]= {
		name:"���K�V�[�̍\�z�ς݃f�b�L",
		ask_price:2,
		buy_price:3,
		buy_count:4,
		stock:5,
		auto_purchase:6,
		demand_index:7,
		process_difficulty:8,
		description:"���i1�̐���"
	};
	f.item[2]= {
		name:"���i2",
		ask_price:2,
		buy_price:3,
		buy_count:4,
		stock:5,
		auto_purchase:6,
		demand_index:7,
		process_difficulty:8,
		description:"���i2�̐���"
	};
	f.item[3]= {
		name:"���i3",
		ask_price:2,
		buy_price:3,
		buy_count:4,
		stock:5,
		auto_purchase:6,
		demand_index:7,
		process_difficulty:8,
		description:"���i3�̐���"
	};
	f.item[4]= {
		name:"���i4",
		ask_price:2,
		buy_price:3,
		buy_count:4,
		stock:5,
		auto_purchase:6,
		demand_index:7,
		process_difficulty:8,
		description:"���i4�̐���"
	};

	// �I
	f.sale_shelf = [
		{able:true	,item_no:1},
		{able:true	,item_no:2},
		{able:true	,item_no:0},
		{able:false	,item_no:0},
		{able:false	,item_no:0},
		{able:false	,item_no:0},
		{able:false	,item_no:0},
		{able:false	,item_no:0}
	];
	
	// �q��
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
	
	// �X�g���[�W
	f.storage_box = [
		{item_no:1,	stock:10},
		{item_no:2,	stock:10},
		{item_no:3,	stock:30},
		{item_no:4,	stock:30}
	];

[endscript]

[return]