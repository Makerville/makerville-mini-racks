1U = 44.45;
6inch = 152.4;

module 6_blank(U=1,text="")
{

translate([6inch/2, U*1U/2, 3])
    color("red")
        linear_extrude(1)
            text(text, size=1U/3, halign="center", valign="center", font="Fira Code:style=Bold");

difference() {
    cube([6inch,U*1U,3]);
    for (x = [7, 6inch-7])
        for (y = [10, U*1U-10])
            translate([x, y, -1])
                cylinder(h=5, d=4.4, $fn=30);
}    
}