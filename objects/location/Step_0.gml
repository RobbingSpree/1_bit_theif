/// @description Insert description here
// You can write your code in this editor

//get input
if handeler.active_deepth == deepth {
	left = keyboard_check(vk_left) || keyboard_check(ord("A"));
	right = keyboard_check(vk_right) || keyboard_check(ord("D"));
	down = keyboard_check(vk_down) || keyboard_check(ord("S"));
	up = keyboard_check(vk_up) || keyboard_check(ord("W"));
	
	run = keyboard_check(vk_shift);

	var xx = right - left;
	var yy = down - up;

	if cycle <= 0 {
		px += xx*unit;
		py += yy*unit;
		cycle = move_cycle;
	} else {
		cycle -= 1 + run; //ticks down faster if shift is held
	}
}

