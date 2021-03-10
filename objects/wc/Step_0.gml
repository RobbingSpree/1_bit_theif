/// @description Insert description here
// You can write your code in this editor
index ++;

if keyboard_check_released(vk_escape)	
	game_end();
	
//detect WASD input
var up = keyboard_check_pressed(ord("W")) | keyboard_check_pressed(vk_up);
var left = keyboard_check_pressed(ord("A")) | keyboard_check_pressed(vk_left);
var down = keyboard_check_pressed(ord("S")) | keyboard_check_pressed(vk_down);
var right = keyboard_check_pressed(ord("D")) | keyboard_check_pressed(vk_right);

var ydir = down - up;
var xdir = right - left;

if within(px+xdir,0,wid) && within(py+ydir,0,hei) && !solid_tile(px+xdir,py+ydir){
	world[# px,py] = stand_on;
	px += xdir;
	py += ydir;
	stand_on = world[# px,py];
	world[# px,py] = ps;
}
