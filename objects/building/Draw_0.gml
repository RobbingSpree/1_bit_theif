/// @description Insert description here
// You can write your code in this editor

draw_self();
draw_set_font(defont);
draw_text(x,y-20,nameplate);

//draw walls
for(var i=1;i!=wid;i++) {
	draw_sprite_part(kenney_col,0,(unit+1)*14,(unit+1)*16,15,unit,x+unit*i,y+unit)
	if i != 3 || focus_floor == 1
		draw_sprite_part(kenney_col,0,(unit+1)*14,(unit+1)*16,unit,unit,x+unit*i,y+unit*7)
	else 
		draw_sprite_part(kenney_col,0,(unit+1)*6,(unit+1)*9,unit,unit,x+unit*i,y+unit*7)
}
for (var i=1;i!=hei;i++) {
	draw_sprite_part(kenney_col,0,(unit+1)*14,(unit+1)*16,unit,unit,x+unit,y+unit*i)
	draw_sprite_part(kenney_col,0,(unit+1)*14,(unit+1)*16,unit,unit,x+unit*wid,y+unit*i)
}
if focus_floor == player_on_floor
//draw the player
	draw_sprite_part(kenney_col,0,(unit+1)*25,(unit+1)*0,unit,unit,x+unit*player_x,y+unit*player_y)

if focus_floor == 0 {
	//draw the stairs down
	draw_sprite_part(kenney_col,0,(unit+1)*3,(unit+1)*6,unit,unit,x+unit*4,y+unit*3)

	//draw details
	draw_sprite_part(kenney_col,0,(unit+1)*5,(unit+1)*14,unit,unit,x+unit*5,y+unit*6)
}

if focus_floor == 1 {
	//draw the stairs up
	draw_sprite_part(kenney_col,0,(unit+1)*2,(unit+1)*6,unit,unit,x+unit*4,y+unit*3)

	//draw details
	draw_sprite_part(kenney_col,0,(unit+1)*5,(unit+1)*0,unit,unit,x+unit*3,y+unit*3)
}