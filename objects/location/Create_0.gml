/// @description Insert description here
// You can write your code in this editor

deepth = 0;

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

floor_space = [];
for (var i=0; i<zone_width; i++) {
	for (var k=0; k<zone_height; k++) {
		floor_space[i,k] = ground.empty
		if i==0 || i == zone_width-1 || k == 0 || k == zone_height-1
			floor_space[i,k] = ground.wall;
	}
}
floor_space[1,zone_width-2] = ground.stairs_down;
floor_space[zone_height-2,1] = ground.stairs_up;
floor_space[3,zone_height-1] = ground.door;

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
