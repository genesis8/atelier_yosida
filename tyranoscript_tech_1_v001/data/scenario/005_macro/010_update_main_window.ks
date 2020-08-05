[macro name="update_main_window"]

	; 描画;
	[freeimage layer="0" page="back"]
	[call storage="003_show\003_sale_shelf.ks"]
	[call storage="003_show\004_warehouse.ks"]
	[call storage="003_show\002_menu.ks"]
	[call storage="003_show\005_status.ks"]
	; 描画結果を反映;
	[trans layer="0" time="0"]

[endmacro]

[return]