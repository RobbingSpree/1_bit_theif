// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function solid_tile(xx,yy){
	var _tile = object[# xx,yy];
	
	switch _tile {
		case -1: return false; break; //uninitalized map
		case state.empty: return false; break; //explicitly empty map
		case state.door_open: return false; break; //open doors count as empty
		default: return true //default to solid for other object types
	}
}

enum state {
	empty,
	solid_im, //solid object immovable
	solid_mov, //solid object movable
	solid_fla, //solid object flammable
	door_closed, //counts as a solid object for line of sight
	door_open, //counts as empty for line of sight
	chest
}