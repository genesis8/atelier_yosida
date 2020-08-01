;-----------------------------------------------------
; 来客判定
;-----------------------------------------------------

*START

*RAIKYAKU
; 来客判定は名声値に依存したルーレットを回す
; ルーレットはロジスティック関数で算出した閾値と乱数を対決させる
[iscript]
	// パラメータ：これでゲームバランスを調整する
	tf.pA=120;
	tf.pB=50;
	
	tf.thre = 1 / ( 1 + Math.pow( 2.71828 ,( -1 * (f.fame - tf.pA) / tf.pB)));
	tf.rand = Math.random();
	
	// 乱数が閾値を「下回ったら」来客
	tf.raikyaku = 0;
	if (tf.thre >= tf.rand)
	{
		tf.raikyaku = 1;
	}
[endscript]

;来客判定開始[p]
;名声値[emb exp="f.fame"]
;スレッショルド[emb exp="tf.thre"]
;乱数[emb exp="tf.rand"] [p]

[jump target=*NOT_RAIKYAKU cond="tf.raikyaku==0"]

お客さんが来ました！[p]

*KYAKUSOU
; 客層判定は客層値に依存したルーレットで回す
; ルーレットはロジスティック関数で算出した閾値を乱数と対決させる
[iscript]
	// パラメータ：これでゲームバランスを調整する
	tf.pA=7;
	tf.pB=10;
	
	tf.thre_HM = 1 / ( 1 + Math.pow( 2.71828 ,( (f.kyaku_grade - tf.pA) / tf.pB)));
	tf.thre_ML = 1 / ( 1 + Math.pow( 2.71828 ,( (f.kyaku_grade + tf.pA) / tf.pB)));

	tf.rand = Math.random();
	
	// 客層判定
	tf.kyakusou = "M";
	tf.msg = "中流層";
	if(tf.rand >= tf.thre_HM){
		tf.kyakusou = "H";
		tf.msg = "裕福層";
	}
	if(tf.rand <= tf.thre_ML){
		tf.kyakusou = "L";
		tf.msg = "低流層";
	}
[endscript]

;客層判定開始[p]
;客層値[emb exp="f.kyaku_grade"]
;スレッショルド[emb exp="tf.thre_HM"]／[emb exp="tf.thre_ML"]
;乱数[emb exp="tf.rand"] [p]
客層は[emb exp="tf.msg"]のようです。[p]


*SELL_ITEM
;売物棚の上にある商品から探索を行う
;マッチするのであれば需要指数÷100との乱数対決を行い、勝利したら売却が確定する
[iscript]
	// 客層と商品グレードがマッチするか判定する関数
	function ysd_kyakusou_match(kyaku,item){
		if( kyaku=="L" )
		{
			if (item == "L") { return true; }
			if (item == "M") { return true; }
		}
		if( kyaku=="M")
		{
			return true;
		}
		if( kyaku=="H")
		{
			if (item == "M") { return true; }
			if (item == "H") { return true; }
		}
		return false;
	}

	// 売れなかった場合は -1 を戻す
	tf.sell_shelf_no = -1;
	for ( tf.i = 0 ; tf.i < 8 ; tf.i++)
	{
		// 空欄または在庫ゼロなら販売対象にならない
		tf.item_no = f.sale_shelf[tf.i].item_no;
		if( tf.item_no == 0 ) continue;
		if( f.item[tf.item_no].stock <= 0) continue;
		
		// グレードのマッチングで買ってくれる可能性があるかをチェック
		tf.item_grade = f.item[tf.item_no].grade;
		tf.kyaku_grade = tf.kyakusou;
		tf.matching = ysd_kyakusou_match(tf.kyaku_grade,tf.item_grade);
		if( tf.matching == false ) continue;
		
		// マッチした商品を買ってくれるかを乱数で判定
		tf.rand = Math.random();
		tf.thre = f.item[tf.item_no].demand_index / 100.0;
		
		if( tf.rand <= tf.thre)
		{
			tf.sell_shelf_no = tf.i;
			break;
		}
	}
[endscript]

[jump target=*NO_SELL_ITEM cond="tf.sell_shelf_no==-1"]
[emb exp="f.item[f.sale_shelf[tf.sell_shelf_no].item_no].name"]を買ってくれそうです！[p]

*SELL_AMOUNT
;購入数は1～6を乱数で決定
;[TODO]販売数に応じてボーナスをつける
[iscript]
	tf.sell_item_amount = Math.ceil(Math.random()*6);
	tf.sell_item_amount = Math.min(tf.sell_item_amount, f.item[f.sale_shelf[tf.sell_shelf_no].item_no].stock);
[endscript]
[emb exp="tf.sell_item_amount"]個売れました！[p]

;売却処理
[iscript]
	// 在庫減少
	f.item[f.sale_shelf[tf.sell_shelf_no].item_no].stock -= tf.sell_item_amount;
	
	// 販売数増加
	f.item[f.sale_shelf[tf.sell_shelf_no].item_no].sell_amount += tf.sell_item_amount;
	
	// お金が増えるよ
	f.money += f.item[f.sale_shelf[tf.sell_shelf_no].item_no].sell_price * tf.sell_item_amount;
[endscript]

[jump target=*END]

*NOT_RAIKYAKU
…
[jump target=*END]

*NO_SELL_ITEM
何も買ってもらえませんでした…[p]
[jump target=*END]

*NO_SELL_AMOUNT
需要ルーレットに失敗し一個も販売されませんでした[p]
[jump target=*END]

*END

[return]