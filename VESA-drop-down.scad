module main(spacing){
    sm=0.001;
    m4r=2.25; //hole for M4 hardware with some clearance
    offset=30; //distance from original position
    thickness=6;
    difference(){
        cube([spacing+20, spacing+offset + 20, thickness], center=true);
        cube([spacing-20, spacing-20+offset, thickness+2], center=true);
        hs=spacing/2;
        for(dy=[-offset/2, offset/2]){
            translate([0, dy, 0]){
                for(px=[-hs, hs]){
                    for(py=[-hs, hs]){
                        translate([px, py, 0]) cylinder(r=m4r, h=thickness+2, center=true);
                        translate([px, py, thickness/2]) cylinder(r1=m4r, r2=m4r+4, h=4, center=true);
                    }
                }
            }
        }
    }
}
