/// @description Insert description here
// You can write your code in this editor

ts = big_sheet;
wid = 20;
hei = 20;
world = ds_grid_create(wid,hei);
object = ds_grid_create(wid,hei);
unit = 15; //value can be 15 for tight cell connection and 14 for seamless connection
index = 0;
dun_depth = 1; //0 depth is overword, 1 deth is frist level, higher depths are deeper into the structure
dun_doors = ds_list_create();

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

rooms=[];
generate_structure();
