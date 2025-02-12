/// @description 

wid = 7;
hei = 8;
margin = 1;
image_xscale = 3;
image_yscale = 3;

unit = 16;

nameplate = "Nameless Town";

layout_index = -1;
var faredge_x = x+140; //magic number, will fix later

var g = instance_create_layer(faredge_x,y+unit,"floating_under_ui",tag);
g.display_tag = "G";
g.parent = self;
g.related_deepth = 0;
var b = instance_create_layer(faredge_x,y+unit*2,"floating_under_ui",tag);
b.display_tag = "B1";
b.parent = self;
b.related_deepth = 1;
known_floors = [g,b]; //a rough way of knowing what floors you can disaply as tags
focus_floor = 0; //floor being drawn
player_on_floor = 0; //floor player is drawn on
deepest_sloor = 1;

player_x = 3;
player_y = 6;

floor_details = [];

cycle = 30;
move_cycle = 15;