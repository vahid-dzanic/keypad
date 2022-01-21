module switch(center = true) {
    oversize = 1;
    oversize_top_n_bottom = oversize * 2;
    
    side = 14.1;
    hight = 5;
    hight_overall = hight + oversize_top_n_bottom;
    
    notch_w = 5.1;
    notch_cutout = 1;
    notch_l = side + notch_cutout * 2;
    notch_h = 3.2;
    
    if (center){
        color([0,1,0]) translate([0,0,-(hight_overall/2)+oversize]) union() {
            cube([side, side, hight_overall], center);
            translate([0, 0, -(hight_overall - (notch_h + oversize))/2]) cube([notch_w, notch_l, notch_h + oversize], center);
        }
    } else {
        color([0,1,0]) translate([0,0,-hight - oversize]) union() {
            cube([side, side, hight_overall], center);
            translate([(side-notch_w)/2, -notch_cutout, 0]) cube([notch_w, notch_l, notch_h + oversize], center);
        }
    }
}
