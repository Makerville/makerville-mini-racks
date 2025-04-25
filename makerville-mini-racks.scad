include <jl_scad/box.scad>
include <jl_scad/parts.scad>


1U = 44.45;
6inch = 152.4;

module 6_blank(U = 1, text = "") {

  translate([6inch / 2, U * 1U / 2, 3])
    color("red")
      linear_extrude(1)
        text(text, size = 1U / 3, halign = "center", valign = "center", font = "Fira Code:style=Bold");

  difference() {
    cube([6inch, U * 1U, 3]);
    for(x = [7, 6inch - 7])
      for(y = [10, U * 1U - 10])
        translate([x, y, -1])
          cylinder(h = 5, d = 4.4, $fn = 30);
  }
}

module 6_olimex_serial(num = 2) {
  for(i = [0:num - 1]) {
    translate([i * (6inch / num) + (6inch / num) / 2 - 5, 1U / 2 - 22.225, 0])
      translate([5, 0, 20])
        rotate([-90, 0, 0])
          box_make(halves = [BOT])
            box_shell_base_lid([8.5, 34, 12]);
  }

  difference() {
    difference() {
      cube([6inch, 1U, 3]);
      for(i = [0:num - 1]) {
        translate([i * (6inch / num) + (6inch / num) / 2, 1U / 2, 0])
          cube([8, 25, 7], center = true);
      }
    }
    ;
    for(x = [7, 6inch - 7])
      for(y = [10, 1U - 10])
        translate([x, y, -1])
          cylinder(h = 5, d = 4.4, $fn = 30);
  }
  ;
}
