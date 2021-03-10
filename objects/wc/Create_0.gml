/// @description Insert description here
// You can write your code in this editor

ts = big_sheet;
wid = 20;
hei = 20;
world = ds_grid_create(wid,hei);
object = ds_grid_create(wid,hei);
unit = 15; //value can be 15 for tight cell connection and 14 for seamless connection
index = 0;

//fill grid
for (var i=0; i<wid; i++) 
	for (var k=0; k<hei; k++) {
		world[# i,k] = 0;
		object[# i,k] = -1;
	}
	
//position player
player = new person();
px = 2; //player x pos on grid
py = 2; //player y pos on grid
ps = 25; //player sprite on ts
world[# px,py] = 25;
//store item under player
stand_on = 0;

#macro ts_wid 48 //the tile set is 47 tiles accross
#macro ts_hei 21 //the tile set is 21 tiles tall

rooms = [];
for (var i=0; i<5; i++) {
	//pick spot for room
	var r = new gen_room();
	r.room_w = irandom_range(3,8);
	r.room_h = irandom_range(3,8);
	r.rc_x = irandom_range(1+r.room_w/2,wid-r.room_w/2); //room center x pos
	r.rc_y = irandom_range(1+r.room_h/2,hei-r.room_h/2); //room center y pos
	
	r.room_gen();
	rooms[i]=r;
}
///empty room internals
for (var i=0; i<array_length(rooms); i++) {
	with (rooms[i]) {
		room_clear();
	}
}

//connect wall corners
connect_walls();

//make a door and place player infront of it
make_doors();


//resolve unused parts of the map
clear_uninitalized_grid();