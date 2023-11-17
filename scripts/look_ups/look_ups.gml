//new functions start with function name_of_funct(inputs) {


function struct_look_ups(sid){
	//returns the name of the structure as a string
	switch (sid) {
		case 1: return "Castle"; break;
		case 2: return "House"; break;
		case 3: return "Den"; break;
		case 4: return "Place"; break;
		default: return "???";
	}
}