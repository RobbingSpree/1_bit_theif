// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function generate_structure() {
	with wc {
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
	}
	
	//connect wall corners
	connect_walls();
	
	//make a door and place player infront of it
	make_doors();
	
	//resolve unused parts of the map
	clear_uninitalized_grid();
}


/*
function room_gen(room_w,room_h,rc_x,rc_y){
	
	//pick wall type
	//walls start on col 16
	//3 types of walls staring on row 13, 16, 19
	var tx = 13; //wall type
	var ty = 16; 
	var tile = ts_wid * tx+ty;
	//top wall
	world[# rc_x-room_w/2, rc_y-room_h/2] = tile;
	for (var i=1; i<room_w; i++) {
		world[# rc_x-room_w/2+i, rc_y-room_h/2]=tile+1;
	}
	world[# rc_x+room_w/2, rc_y-room_h/2]=tile +2;
	
	//vert walls
	tile += ts_wid; //jumps down a whole row in the tile sheet
	for (var i=1; i<room_h; i++) {
		world[# rc_x-room_w/2, rc_y-room_h/2+i]=tile;
		world[# rc_x+room_w/2, rc_y-room_h/2+i]=tile+2;
	}
	
	//bottom wall
	tile += ts_wid;
	world[# rc_x-room_w/2, rc_y+room_h/2] = tile;
	for (var i=1; i<room_w; i++) {
		world[# rc_x-room_w/2+i, rc_y+room_h/2]=tile+1;
	}
	world[# rc_x+room_w/2, rc_y+room_h/2]=tile +2;
	
}
*/

function connect_walls() {
	var ul = ts_wid*13+16;
	ul=ts_wid*13;
	var ur = ts_wid*13+18;
	ur=ts_wid*13;
	var bl = ts_wid*15+16;
	bl=ts_wid*13;
	var br = ts_wid*15+18;
	br=ts_wid*13;
	var ct = ts_wid*14+17;
	
	for (var i=0; i<ts_wid; i++)
		for (var k=0; k<ts_hei; k++) {
			var current = wc.world[# i, k];
			if current != 0 {
				var up = wc.world[# i,k-1];
				var down = wc.world[# i,k+1];
				var right = wc.world[# i+1,k];
				var left = wc.world[# i-1,k];
				
				//check for corners
				if ((right && !left) || (!right && left)) && ((up && !down) || (!up && down)) {
					if right && down 
						wc.world[# i,k] = ul;
					if right && up
						wc.world[# i,k] = bl;
					if left && down 
						wc.world[# i,k] = ur;
					if left && up
						wc.world[# i,k] = br;
				}
			}
		}
	
}

function make_doors(){
	var esc_row = -1;
	var esc_col = -1;
	var nex_row = -1;
	var nex_col = -1;
	
	for (var i=0; i<ts_hei; i++) 
		for (var k=0; k<ts_wid; k++) {
			if wc.object[# k,i] == state.solid_im {
					if wc.object[# k+1,i] == state.solid_im && wc.object[# k-1,i] == state.solid_im {
						esc_col = k;
						esc_row = i;
				}
			}
			if wc.object[# ts_wid-k,ts_hei-i] == state.solid_im {
					if wc.object[# ts_wid-k-1,ts_hei-i] == state.solid_im && wc.object[# ts_wid-k+1,ts_hei-i] == state.solid_im {
						nex_col = ts_wid-k;
						nex_row = ts_hei-i;
				}
			}
		}
	wc.object[# esc_col,esc_row]=state.door_open;
	wc.world[# esc_col,esc_row] = ts_wid*10+8;
	wc.object[# nex_col,nex_row]=state.door_open;
	wc.world[# nex_col,nex_row] = ts_wid*10+8;
	tp_actor_from_to(wc.px,wc.py,esc_col,esc_row-1,true);
	var esc = new door("Escape");
	wc.object[# esc_col,esc_row-1]= esc;
	var nex = new door("Deeper");
	wc.object[# nex_col,nex_row+1] = nex;
}

function clear_uninitalized_grid(){
	
	for (var i=0; i<ts_wid; i++)
		for (var k=0; k<ts_hei; k++) {
			if object[# i,k] == -1
				object[# i,k] = state.empty;
		}
}