/// @description Insert description here
// You can write your code in this editor

//get input
if active {
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
		if xx != 0 || yy != 0 {
			cycle = move_cycle;
			if position_meeting(x,y,overworld_entrance){
				//create location and call new area data
				var struc = structure_create(-1) //-1 is the debug value for making astructure
				//debug
				active = false;
				sheetx = elsewhere_sheetx;
				sheety = elsewhere_sheety;
			}
		}
	} else {
		cycle -= 1 + run; //ticks down faster if shift is held
	}
}


//debug
if keyboard_check_pressed(vk_escape) {
	change_floors();
}