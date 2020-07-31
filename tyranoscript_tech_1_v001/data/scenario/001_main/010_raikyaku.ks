;-----------------------------------------------------
; 来客判定
;-----------------------------------------------------

*START
来客判定開始[p]

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

名声値[emb exp="f.fame"]
スレッショルド[emb exp="tf.thre"]
乱数[emb exp="tf.rand"] [p]

[jump target=*NOT_RAIKYAKU cond="tf.raikyaku==0"]

来客！！[p]

[jump target=*END]

*KYAKUSOU

*NOT_RAIKYAKU
来客ならず[p]

*END

[return]