include <makerville-mini-racks/makerville-mini-racks.scad>

6_blank(U = 1, text = "Makerville");

translate([0, 50, 0])
  6_olimex_serial(num = 4);
