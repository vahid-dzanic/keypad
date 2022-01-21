module tube(inner_radius, outer_radius, height, top_outer_camfer = 0, top_inner_camfer = 0,center = false, detail_level = 300) {
    if (center) {
        difference() {
            cylinder(height, outer_radius, outer_radius, center, $fn=detail_level);
            translate([0,0,0]) cylinder(height+0.2, inner_radius, inner_radius, center, $fn=detail_level);
        }
    } else {
        difference() {
            cylinder(height, outer_radius, outer_radius, center, $fn=detail_level);
            translate([0,0,-0.1]) cylinder(height+0.2, inner_radius, inner_radius, center, $fn=detail_level);
            if (top_outer_camfer > 0) {
                translate([0,0, height - (top_outer_camfer + 0.1)]) difference() {
                    cylinder(top_outer_camfer+0.4, outer_radius+0.1, outer_radius+0.1, center, $fn=detail_level);
                    translate([0,0,-0.1]) cylinder(top_outer_camfer+0.2, outer_radius+0.2, outer_radius+0.2 - (top_outer_camfer+0.2), center, $fn=detail_level);
                }
            }
            if (top_inner_camfer > 0) {
                translate([0,0, height+0.1-top_inner_camfer]) cylinder(top_inner_camfer+0.1, inner_radius, inner_radius + top_inner_camfer + 0.1, center, $fn=detail_level);
            }
        }
    }
}


// Tube with measurements to fit around something.
/*
module fit_outside_tube(dim, thickness, radius) {
	w = dim[0];
	l = dim[1];
	h = dim[2];
	
	or = min(w, l) * 0.1;
	ir = radius;
	
	// Extrude the tube
	linear_extrude(height = h)
	difference() {
		rounded_square(
			[w + thickness*2, l+thickness*2],
			[or,or,or,or], true);
		rounded_square([w, l],
			[ir,ir,ir,ir], true);
	}
}
*/
// Tube with measurements to fit inside something.
/*
module fit_inside_tube(dim, thickness, radius) {
	w = dim[0];
	l = dim[1];
	h = dim[2];
	
	or = radius;
	ir = min(w, l) * 0.1;
	
	linear_extrude(height = h)

	difference() {
		rounded_square(
			[w-slop , l-slop],
			[or,or,or,or], true);
		rounded_square(
			[w - thickness*2, l - thickness*2],
			[ir,ir,ir,ir], true);
	}
}
*/
