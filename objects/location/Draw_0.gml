/// @description Insert description here
// You can write your code in this editor


draw_self();
if deepth > 0
	draw_text(x+15,y+10,"F"+string(deepth));
else 
	draw_text(x+15,y+10,"BF"+string(deepth*(-1)));

//draw_controls
/*
if up draw_sprite_part(kenney_col,0,51*(unit+1),22*(unit+1),unit,unit,x,y+10);
if right draw_sprite_part(kenney_col,0,52*(unit+1),22*(unit+1),unit,unit,x+10,y);
if down draw_sprite_part(kenney_col,0,53*(unit+1),22*(unit+1),unit,unit,x,y-10);
if left draw_sprite_part(kenney_col,0,54*(unit+1),22*(unit+1),unit,unit,x-10,y);
*/

//draw the room
if floor_space != noone
for (var i=0; i<zone_width; i++) {
	for (var k=0; k<zone_height; k++) {
		var cel = floor_space[i,k];
		var xx = 0;
		var yy = 0;
		switch (cel) {
			case ground.wall: 			xx=10; yy = 17; break;
			case ground.empty: 			xx=0; yy = 0; break;
			case ground.stairs_down: 	xx=3; yy = 6; break;
			case ground.stairs_up: 		xx=2; yy = 6; break;
			case ground.door: 			xx=2; yy = 9; break;
		}
		//the above code is calling specific tiles from a sheet
		draw_sprite_part(kenney_col,0,xx*(unit+1),yy*(unit+1),unit,unit,(border+i)*unit+x,(border+k)*unit+y);
	}
}
//draw the player
play_spr_x = 25;
play_spr_y = 0;
draw_sprite_part(kenney_col,0,play_spr_x*(unit+1),play_spr_y*(unit+1),unit,unit,(border+px)*unit+x,(border+py)*unit+y);