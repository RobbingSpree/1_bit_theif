//new functions start with function name_of_funct(inputs) {


function change_floors(dir){
	if dir == "dwn"
		dir = -1;
	else 
		dir = 1;
	var loc = instance_create_depth(50,50,handeler.active_deepth-1,location);
	loc.deepth = handeler.active_deepth + dir;
	handeler.active_deepth += dir;
	loc.floor_space = generate_floor(loc.zone_width,loc.zone_height);
}

function structure_exit() {
	with (location) {
		instance_destroy(self);
		}
	with (handeler) {
		active_deepth = 0;
		structure = []; //empty the array structure
		height = 0;
	}
}

function structure_create() {
	
}

function generate_floor(wid,hei) {
	
	for (var i=0; i<wid; i++) {
	for (var k=0; k<hei; k++) {
		floor_space[i,k] = ground.empty
		if i==0 || i == wid-1 || k == 0 || k == hei-1
			floor_space[i,k] = ground.wall;
		}
	}
	floor_space[floor(random_range(1,wid-2)),floor(random_range(1,hei-2))] = ground.stairs_down;
	//floor_space[zone_height-2,1] = ground.stairs_up;
	floor_space[3,hei-1] = ground.door;
	
	return floor_space;
}