// Sizes of shelf. All are mm
/* [VESA Spacing] */
spacing = 75;

/* [Tickness] */
thickness = 3;

/* [Width] */
support_width = 10;

/* [Screw size (4 for M4, 5 for M5...). 75 and 100mm VESA uses M4] */
screw_size = 4;

/* [Shelf width] */
shelf_width = 150;

/* [Shelf height] */
shelf_height = 150;

/* [Space between shelf and mount] */
shelf_space = 20;

/* [Shelf rim] */
rim = 6;

/* [Hidden] */

module vesa_mount()
{
  difference()
  {
    union()
    {
      for(decal_x=[0:1:1])
      {
        translate([spacing * decal_x, 0, 0])
        {
          cube([support_width, spacing + support_width + shelf_space, thickness]);
        }
      }

      for(decal_y=[0:1:1])
      {
        translate([ 0, spacing * decal_y,0])
        {
          cube([spacing + support_width, support_width, thickness]);
        }

      }
    }

    for(decal_x=[0:1:1])
    {
      for(decal_y=[0:1:1])
      {
        translate([spacing * decal_x + support_width / 2, spacing * decal_y + support_width / 2, 0])
        {
          cylinder(h=2 * thickness + 2, d=screw_size + 0.5, center=true, $fn=100);
        }
      }
    }
  }
}

module shelf()
{
  union()
  {
    cube([shelf_width + thickness * 2, thickness + rim, thickness]);
    cube([thickness, thickness + rim, shelf_height + thickness]);
    translate([shelf_width + thickness, 0, 0])
    {
      cube([thickness, thickness + rim, shelf_height + thickness]);
    }

    cube([shelf_width + thickness * 2, thickness, shelf_height + thickness]);
  }
}

vesa_mount();
translate([shelf_width / -2 - thickness + (spacing + support_width) / 2 , spacing + support_width + shelf_space, 0])
{
  shelf();
}