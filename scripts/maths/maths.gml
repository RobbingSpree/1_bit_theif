// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function within(value, lower, upper){
	if value >= lower && value <= upper
		return true;
	else 
		return false;
}

function is_any_value(value,arg) {
	for (i=1; i=argument_count; i++) {
		if value == argument[i] {
			return true;
			break;
		} 
	}
	return false;
}

function tp_actor_from_to(px,py,nx,ny,player_flag){
	var char = wc.world[# px,py]; //character at previous location
	var actor = wc.object[# px,py]; //object for the actor found at location
	wc.world[# px,py] = 0; //zero out cell
	wc.object[# px,py] = state.empty; //remove pointer to object
	if player_flag { //are we teleporting the player
		wc.px = nx; //new x pos for player
		wc.py = ny; //new y pos for player
		wc.world[# px,py] = wc.stand_on;
		wc.stand_on = wc.world[# nx,ny];
	} 
	wc.world[# nx,ny] = char;
	wc.object[# nx,ny] = actor;
}