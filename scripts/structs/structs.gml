// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function person() constructor{
	namewa = "Debug";
	hp = 6;
	max_hp = hp;
	invintory = noone;
	class = job.npc;
}


function door(dest) constructor{
	destination = dest;
	seed = random_get_seed();
	room_index = 0;
	room_x = 0;
	room_y = 0;
	visited = false;
	
	static change_room = function(){
		//feed random seed into room gen function if we've already visted this room
		if visited
			random_set_seed(seed);
		//store changes about this room
		
		//store this room
		
		//empty grid
		for (var i=0; i<ts_hei; i++)
			for (var k=0; k<ts_wid; k++) {
				wc.world[# k,i] = 0;
				wc.objects[# k,i] = 0;
			}
		
		//generate new room
		
	}
}

function gen_room() constructor{
	rc_x = 0;
	rc_y = 0;
	room_w = 4;
	room_h = 4;
	index = 0;
	
	static room_gen = function(){
		//pick wall type
		//walls start on col 16
		//3 types of walls staring on row 13, 16, 19
		var tx = 13; //wall type
		var ty = 16; 
		var tile = ts_wid * 13;
		//top wall
		wc.world[# rc_x-room_w/2, rc_y-room_h/2] = tile;
		wc.object[# rc_x-room_w/2, rc_y-room_h/2] = state.solid_im;
		for (var i=1; i<room_w; i++) {
			wc.world[# rc_x-room_w/2+i, rc_y-room_h/2]=tile;
			wc.object[# rc_x-room_w/2+i, rc_y-room_h/2]=state.solid_im; 
		}
		wc.world[# rc_x+room_w/2, rc_y-room_h/2]=tile;
		wc.object[# rc_x+room_w/2, rc_y-room_h/2]=state.solid_im;
		
		//vert walls
		//tile += ts_wid; //jumps down a whole row in the tile sheet
		for (var i=1; i<room_h; i++) {
			wc.world[# rc_x-room_w/2, rc_y-room_h/2+i]=tile;
			wc.object[# rc_x-room_w/2, rc_y-room_h/2+i]=state.solid_im;
			wc.world[# rc_x+room_w/2, rc_y-room_h/2+i]=tile;
			wc.object[# rc_x+room_w/2, rc_y-room_h/2+i]=state.solid_im;
		}
		
		//bottom wall
		//tile += ts_wid;
		wc.world[# rc_x-room_w/2, rc_y+room_h/2] = tile;
		wc.object[# rc_x-room_w/2, rc_y+room_h/2] = state.solid_im;
		for (var i=1; i<room_w; i++) {
			wc.world[# rc_x-room_w/2+i, rc_y+room_h/2]=tile;
			wc.object[# rc_x-room_w/2+i, rc_y+room_h/2]=state.solid_im;
		}
		wc.world[# rc_x+room_w/2, rc_y+room_h/2]=tile;
		wc.object[# rc_x+room_w/2, rc_y+room_h/2]=state.solid_im;
	}
	
	static room_clear = function() {
		//run at world gen before characters or objects are put in buildings to try and join walls
		var tl_x = rc_x - room_w/2+1; //top left x and y pos
		var tl_y = rc_y - room_h/2+1;
		//itterate through room internals
		for (var i=0; i<room_w-1; i++)
			for (var k=0; k<room_h-1	; k++) {
				if wc.world[# tl_x+i, tl_y+k] != 0 {
					wc.world[# tl_x+i, tl_y+k] = 0;
					wc.object[# tl_x+i, tl_y+k] = state.empty;
				}
			}
	}
}


enum job {
	player,
	npc,
	guard,
	shopkeep
}