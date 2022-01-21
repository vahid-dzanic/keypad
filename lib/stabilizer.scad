include <switch.scad>

module stabilizer (width=24, rotation = 0, x_offset = 0, y_offset = 0) {
    cube_w = 7;
    overall_width = width + cube_w; // 1x cube_w --> 3.5 per side
    upper_cube_depth = 11.4;

    module _stabilizer() {
        union() {
            color("#5C52AA") translate([0, 0, -0.1]) cube([cube_w, upper_cube_depth, 4.3]);
            color("#5C5248") translate([0, -4.1, -3.5]) cube([cube_w, 19.8, 3.5]);
            color("#5C5248") translate([2.1, -5.3, -6.3]) cube([2.8, 4.3, 2.8]);
            
            // scrw cutout
            color([1,0,0]) translate([3.5, 13.2, -2]) union() {
                cylinder(4, r=1.2, $fn=50);
                translate([0,0, 4.0]) cylinder(2.2, r=2, $fn=50);
            }
        }
    }

    rotate([0, 0, rotation]) translate([(-overall_width/2) + x_offset, (-upper_cube_depth/2) + y_offset, -1.5]) union() {
        _stabilizer();
        translate([width,0,0]) _stabilizer();
        color("#CCCCCC") translate([3.5, -4.1, -4.0]) cube([width, 3.1, 4]);
    }
}

//difference(){
//translate([3.5, -4.1, -4.9]) cube([30,30, 4.9]);
//stabilizer();
//}
//stabilizer(40);