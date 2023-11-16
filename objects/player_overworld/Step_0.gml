/// @description Insert description here
// You can write your code in this editor

//get input
if handeler.active_deepth == 0 {
	left = keyboard_check(vk_left) || keyboard_check(ord("A"));
	right = keyboard_check(vk_right) || keyboard_check(ord("D"));
	down = keyboard_check(vk_down) || keyboard_check(ord("S"));
	up = keyboard_check(vk_up) || keyboard_check(ord("W"));
	
	run = keyboard_check(vk_shift);

	var xx = right - left;
	var yy = down - up;

	if cycle <= 0 {
		x += xx*unit;
		y += yy*unit;
		cycle = move_cycle;
		if position_meeting(x,y,overworld_entrance){
			var loc = instance_create_depth(50,50,depth-1,location);
			handeler.active_deepth = loc.depth;
		}
	} else {
		cycle -= 1 + run; //ticks down faster if shift is held
	}
}


if keyboard_check_pressed(vk_escape) {
	var loc = instance_create_depth(50,50,depth-1,location);
	handeler.active_deepth = loc.depth;
}