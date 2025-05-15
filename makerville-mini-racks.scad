include <jl_scad/box.scad>
include <jl_scad/parts.scad>


1U = 44.45;
6inch = 156;

module 6_blank(U = 1, text = "", text_size = 3) {

  translate([6inch / 2, U * 1U / 2, 3])
    color("red")
      linear_extrude(1)
        text(text, size = 1U / text_size, halign = "center", valign = "center", font = "Fira Code:style=Bold");

  difference() {
    cube([6inch, U * 1U, 3]);
    for(x = [7, 6inch - 7])
      for(y = [10, U * 1U - 10])
        translate([x, y, -1])
          cylinder(h = 5, d = 4.4, $fn = 30);
  }
}

module 6_olimex_serial(num = 2) {
  6inch_shrink = 6inch - 20;
  for(i = [0:num - 1]) {
    translate([i * (6inch_shrink / num) + (6inch_shrink / num) / 2 - 5 + 10, 1U / 2 - 22.225, 0])
      translate([5, 0, 20])
        rotate([-90, 0, 0])
          box_make(halves = [BOT])
            box_shell_base_lid([8.5, 34, 12]);
  }

  difference() {
    difference() {
      cube([6inch, 1U, 3]);
      for(i = [0:num - 1]) {
        translate([i * (6inch_shrink / num) + (6inch_shrink / num) / 2 + 10, 1U / 2, 0])
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

module 6_iec320_c14(acdc = false, lrs505 = false) {
  difference() {
    difference() {
      cube([6inch, 1U, 3]);
      for(x = [7, 6inch - 7])
        for(y = [10, 1U - 10])
          translate([x, y, -1])
            cylinder(h = 5, d = 4.4, $fn = 30);
    }
    ;

    // cutouts for IEC320 C14
    translate([6inch / 2 + 10, 1U / 2, 0])
      cube([27.3, 30, 7], center = true);
    // mounting holes for IEC320 C14
    translate([6inch / 2 - 9, 1U / 2, 0])
      cylinder(d = 3.3, h = 10, center = true, $fn = 30);
    translate([6inch / 2 + 29, 1U / 2, 0])
      cylinder(d = 3.3, h = 10, center = true, $fn = 30);

    // cutout for rocker switch
    translate([6inch / 2 + 45, 1U / 2, 0])
      cube([13, 20, 7], center = true);
  }
  ;
  // optional fun text
  if (acdc) {
    translate([15, 1U / 2 - 6, 3])
      color("red")
        linear_extrude(1)
          scale([0.3, 0.3, 1])
            import("./acdc.svg");
  }

  // LRS-50-5 mount
  if (lrs505) {
    width = 110;
    translate([(6inch - width) / 2, 0, -100])
      cube([width, 3, 100]);
  }
}

module 6_blank_hole(U = 1, d = 4.4, x = 6inch / 2, y = 1U / 2) {
  difference() {
    difference() {
      cube([6inch, U * 1U, 3]);

      for(x = [7, 6inch - 7])
        for(y = [10, U * 1U - 10])
          translate([x, y, -1])
            cylinder(h = 5, d = 4.4, $fn = 30);
    }
    translate([x, y, 0])
      cylinder(h = 5, d = d, $fn = 30);
  }
}

module 6_120mm_fan_3u() {
  difference() {
    difference() {
      difference() {
        cube([6inch, 3 * 1U, 3]);
        for(x = [7, 6inch - 7])
          for(y = [10, 3 * 1U - 10])
            translate([x, y, -1])
              cylinder(h = 5, d = 4.4, $fn = 30);
      }
      ;
      // Standard 120mm fan has mounting holes at 105mm spacing
      for(x = [6inch / 2 - 52.5, 6inch / 2 + 52.5])
        for(y = [1.5 * 1U - 52.5, 1.5 * 1U + 52.5])
          translate([x, y, -1])
            cylinder(h = 5, d = 4.4, $fn = 30);
    }
    ;
    // Create circular vent pattern for 120mm fan
    translate([6inch / 2, 1.5 * 1U, -1])
      cylinder(h = 5, d = 110, $fn = 100);
  }
  ;
}

module 6_waveshare_5inch_dsi() {
  length = 114;
  breadth = 69;
  difference() {
    cube([6inch, 2 * 1U, 3]);
    for(x = [7, 6inch - 7])
      for(y = [10, 2 * 1U - 10])
        translate([x, y, -1])
          cylinder(h = 5, d = 4.4, $fn = 30);


  // Mounting holes for 5-inch display
  for(x = [6inch/2 - length/2, 6inch/2 + length/2])
    for(y = [1U - breadth/2, 1U + breadth/2])
      translate([x, y, -1])
        cylinder(h = 5, d = 4.4, $fn = 30);
  // cutout for DSI cable
    translate([25,1U-27/2,0])cube([10,27,3]);
  }
}

module 6_analyzer(num = 1) {
  6inch_shrink = 6inch - 20;
  for(i = [0:num - 1]) {
    translate([i * (6inch_shrink / num) + (6inch_shrink / num) / 2 - 5 + 10, 1U / 2 - 22.225, 0])
      translate([5, 0, 20])
        rotate([-90, 0, 0])
          box_make(halves = [BOT])
            box_shell_base_lid([8.5, 34, 12]);
  }

  difference() {
    difference() {
      cube([6inch, 1U, 3]);
      for(i = [0:num - 1]) {
        translate([i * (6inch_shrink / num) + (6inch_shrink / num) / 2 + 10, 1U / 2, 0])
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
