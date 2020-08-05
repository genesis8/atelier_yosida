;-----------------------------------------------------
; 掃除をする
;-----------------------------------------------------

; 単に可能なかぎり清掃をする;
[iscript]
	tf.clean_point = Math.min(f.mental,f.dirt);
	
	f.dirt -= tf.clean_point;
	f.mental -= tf.clean_point;
[endscript]

[return]

