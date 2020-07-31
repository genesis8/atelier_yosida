;時間関連処理;

;-----------------------------------------------------
; 時計を10分進める
;-----------------------------------------------------
*MINUTE10
[iscript]
	f.hour
	f.minute = f.minute + 10;
	if (f.minute == 60)
	{
		f.hour = f.hour + 1;
		f.minute = 0;
	}
	if (f.hour == 24)
	{
		f.hour = 0;
	}
[endscript]

[return]

