module main(spacing){
    sm=0.001;
    //if (spacing == 0) spacing=100; //Square VESA mounting pattern, 100mm or 75mm
    m4r=2.25; //hole for M4 hardware with some clearance
    offset=30; //distance from original position
    thickness=6;
    difference(){
        // overall shape
        //minkowski(){
            cube([spacing+20, spacing+offset + 20, thickness], center=true);
        //    cylinder(r=10, h=sm);
        //}
        // central hole to save material
        //minkowski(){
            cube([spacing-20, spacing-20+offset, thickness+2], center=true);
        //    cylinder(r=8, h=sm);
        //}
        // mounting holes, only 4 need to be countersunk, but works if they all are anyway
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
