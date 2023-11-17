/// @description Insert description here
// You can write your code in this editor

deepth = 0;
visual_depth = depth;

zone_width = 5;
zone_height = 5;
unit = 16;
border = 3;

image_speed = 0;

enum ground {
	empty,
	wall,
	door,
	stairs_down,
	stairs_up,
	door
}

floor_space = noone;


//player details
px = 3;
py = zone_height-1;
active = true;

left = false;
right = false;
up = false;
down = false;
run = false;

move_cycle = 30;
cycle = 0;

image_xscale = (unit/sprite_width) * (zone_width+border*2);
image_yscale = (unit/sprite_height) * (zone_height+border*2);
