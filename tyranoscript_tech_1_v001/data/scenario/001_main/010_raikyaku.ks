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


*SELL_AMOUNT

[jump target=*END]

*NOT_RAIKYAKU
…
[jump target=*END]

*NO_SELL_ITEM
売れるアイテムがありませんでした[p]
[jump target=*END]

*NO_SELL_AMOUNT
需要ルーレットに失敗し一個も販売されませんでした[p]
[jump target=*END]

*END

[return]