include <lib/switch.scad>;
include <lib/stabilizer.scad>;

hide_bottom_cover = true;
hide_case = false;

//scrw support
module scrwM3_support(height=10, cutout=false) {
    if (cutout) {
        cylinder(height, r=5.15, $fn=50);
    } else {
        difference(){
            cylinder(height, r=5, $fn=50);
            translate([0,0,-0.1]) cylinder(height + 0.2, r=3.2/2, $fn=25);
        }
    }
}

module scrwM3(hight=16) {
    color("grey") union() {
        //head
        translate([0,0,-0.1]) cylinder(3.3, r=5.6/2, $fn=50);
        //gewinde
        cylinder(3.2+hight+0.1, r=3.1/2, $fn=50);
        //mutter
        translate([0,0,3.2+hight+0.1-2.8]) cylinder(2.8, r=6.6/2, $fn=50);
    }
}

//deckel
module deckel(cutout=false) {
difference(){
union(){
difference() {
    rotate([-4,0,0]) color("yellow") translate([-19.05, -19.05, -11.5 - 4.9 -4 - 3 + 5.1-2.0+3]) cube([19.05 * 5, 19.05 * 6+3, 3]);
    color("pink") translate([-19.05-1, -19.05-5, -16.5]) cube([19.05 * 5+2, 5, 5]);
    color("pink") translate([-19.05-1, 19.05 * 5, -25]) cube([19.05 * 5+2, 5, 5]);
}
rotate([180,0,0]) translate([-11,11, 10]) scrwM3_support(5, cutout);
rotate([180,0,0]) translate([19.05 * 3 + 11 ,11, 10]) scrwM3_support(5, cutout);
rotate([180,0,0]) translate([-11,-19.05 * 4-11, 17]) scrwM3_support(5, cutout);
rotate([180,0,0]) translate([19.05 * 3 + 11,-19.05 * 4-11, 17]) scrwM3_support(5, cutout);
}
rotate([180,0,0]) translate([-11,11, 1.35]) scrwM3(12);
rotate([180,0,0]) translate([19.05 * 3 + 11 ,11, 1.35]) scrwM3(12);
rotate([180,0,0]) translate([-11,-19.05 * 4-11, 1.2]) scrwM3(19);
rotate([180,0,0]) translate([19.05 * 3 + 11,-19.05 * 4-11, 1.2]) scrwM3(19);
}
}



if (!hide_case){
difference(){
union(){
difference() {
    translate([-19.05, -19.05, -4.9 - 19.1]) cube([19.05 * 5, 19.05 * 6, 19.1+4.9]);
    translate([-19.05+4, -19.05+4, -4.9 - 19.1]) cube([19.05 * 5-8, 19.05 * 6-8, 19.1]);
    rotate([-4,0,0]) color("green") translate([-19.05-10, -19.05, -11.5 - 4.9 -4 - 3 + 5.1-9]) cube([19.05 * 5+20, 19.05 * 6+5, 13]);
}
rotate([180,0,0]) translate([-11,11,+0.1]) scrwM3_support(13);
rotate([180,0,0]) translate([19.05 * 3 + 11 ,11,+0.1]) scrwM3_support(13);
rotate([180,0,0]) translate([-11,-19.05 * 4-11,+0.1]) scrwM3_support(20);
rotate([180,0,0]) translate([19.05 * 3 + 11,-19.05 * 4-11,+0.1]) scrwM3_support(20);
}
rotate([180,0,0]) translate([-11,11,0]) scrwM3(12);
rotate([180,0,0]) translate([19.05 * 3 + 11 ,11,0]) scrwM3(12);
rotate([180,0,0]) translate([-11,-19.05 * 4-11,0]) scrwM3(19);
rotate([180,0,0]) translate([19.05 * 3 + 11,-19.05 * 4-11,0]) scrwM3(19);
deckel(cutout=true);
//NodeMCU ESP32
color("blue") translate([19.05 * 1.5, 19.05 * 5-48+0.1, -11.5 - 4.9 -4.6]) cube([26, 48, 11.5-3.5]);
//ON_OFF switch
translate([-19.05+17, 19.05 * 5-19.2+0.1, -21]) color("red") cube([19.9, 19.2, 12.7]);

//switches
for (oIndex=[0:4]) {
    for (iIndex=[0:2]) {
        translate([19.05 * iIndex, 19.05 * oIndex, 0]) switch();
    }
}
translate([19.05 * 3, 19.05/2, 0]) stabilizer(24, 90);
translate([19.05 * 3, 19.05/2, 0]) switch();
translate([19.05 * 3, (19.05*2) + 19.05/2, 0]) stabilizer(24, 90);
translate([19.05 * 3, (19.05*2) + 19.05/2, 0]) switch();
translate([19.05 * 3, 19.05 * 4, 0]) switch();
}
}



////NodeMCU ESP32
//color("blue") translate([19.05 * 1.5+8, 19.05 * 5 - 48 + 0.1, -11.5 - 4.9 -4.6]) cube([26, 48, 11.5-3.5]);
////ON_OFF switch
//translate([-19.05+17, 19.05 * 5-19.2+0.1, -21]) color("red") cube([19.9, 19.2, 12.7]);

module batteryCR2032(){
    translate([0,0,-0.1]) cylinder(3.3, d=21, $fn=50);
}

if (!hide_bottom_cover) {
    rotate([4]) difference() {
        union() {
            deckel();
            rotate([-4]) translate([0,60,-13.4]) difference(){
                translate([0,0,-1.9]) cylinder(5, d=26, $fn=50);
                batteryCR2032();
            }
            rotate([-4]) translate([0,60-24,-13.4]) difference(){
                translate([0,0,-1.9]) cylinder(5, d=26, $fn=50);
                batteryCR2032();
            }
            difference(){
                rotate([-4]) translate([12,27,-14.4]) cube([4,21*2,7]);
                rotate([-4]) translate([11,27+6.5,-13.4+3.5]) cube([6,5,1]);
                rotate([-4]) translate([11,27+6.5+24,-13.4+3.5]) cube([6,5,1]);
            }
        }
        rotate([-94, 0, 0]) translate([0,14,15]) cylinder(65, r=1, $fn=50);
    }
}






//module batteryAAA(){
//    rotate([-90, 0, 0]) cylinder(44.5, d=10.5, $fn=50);
//}
//module batteryPack(){
//    translate([-10.5*0,0,0]) batteryAAA();
//    translate([-10.5*1,0,0]) batteryAAA();
//    translate([-10.5*2,0,0]) batteryAAA();
//}
//rotate([-4,0,0]) translate([20,30,-5.25-4.9+1]) batteryPack();

