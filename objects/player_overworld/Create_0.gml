layer = 0;
active = true;

left = false;
right = false;
up = false;
down = false;
run = false;

move_cycle = 15; //the max that a cycle can use
cycle = 0;
unit = 16; //the unit by which the smallest object is measured

sprite_sheet = kenney_white; //used in the draw part function
sheetx = 25; //assumes above unit as a multiple for position
sheety = 0; //ditto

default_sheetx = 25
default_sheety = 0

elsewhere_sheetx = 43
elsewhere_sheety = 16

active_depth = 0 //this should be which layer of sub map is the active player
//a 0 means overworld movement