include <VESA-drop-down.scad>;

// Works only for spacing between 75 and 100, this should be enough for computer screen
/* [VESA Spacing] */
spacing = 75; // [75, 100]

/* [Hidden] */
spacing_with_marging = spacing - 2;

difference()
{
    union() {
        main(spacing, $fn=80);

        for (decal_x = [0, 1, 1]) {
            translate([decal_x * (spacing - 2) - (spacing_with_marging / 2), spacing_with_marging, 0]) {
                cube([22, spacing - 50, 6], true);
            }
        };

        translate([0, spacing + 18, 47]) {
            cube([150, 20, 100], true);
        }
    };

    translate([0, spacing + 22, 56]) {
        cube([138, 16, 100], true);
    };
}
