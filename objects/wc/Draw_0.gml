/// @description Insert description here
// You can write your code in this editor
draw_text(100,10,"Debug Mode");
for (var i=0; i<wid; i++) 
	for (var k=0; k<hei; k++) {
		var obj = object[# i,k];
		var val = world[# i,k];
		if obj == -1 || obj <= state.door_open || obj != player
			draw_tile(ts,val,0,30+i*unit,30+k*unit);
		else
			draw_tile(ts,obj.tile,0,30+i*unit,30+k*unit)
	}

//draw UI
for (var i=0; i<ceil(player.max_hp/2); i++) {
	//index for heart sprite
	var heart = ts_wid*10+42;
	if player.hp - i*2 <= 0 {
		draw_tile(ts,heart-2,0,20+i*unit,20);
	} else if player.hp - i*2 -1 == 0 {
		draw_tile(ts,heart-1,0,20+i*unit,20);
	} else
		draw_tile(ts,heart,0,20+i*unit,20);
}
draw_text(20,40,px);
draw_text(20,60,py);

