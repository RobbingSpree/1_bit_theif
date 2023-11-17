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
		if (xx != 0 || yy != 0) && (xx+px < zone_width && xx+px > 0 && yy+py < zone_height && yy+py > 0) {
			cycle = move_cycle; 
			var cel = floor_space[px+xx,py+yy] //destination cell
			switch (cel) {
				case ground.empty: px += xx; py += yy; break;
				case ground.stairs_down: px += xx; py += yy; change_floors("dwn"); break;
				case ground.stairs_up: px += xx; py += yy; change_floors("up"); break;
				case ground.wall: break;//needs attention 
				case ground.door:  px += xx; py += yy; structure_exit(); break;
			}
		}
		
		
	} else {
		cycle -= 1 + run; //ticks down faster if shift is held
	}
} else { //reset the depth back to default when not the active layer
	depth = -deepth
}

