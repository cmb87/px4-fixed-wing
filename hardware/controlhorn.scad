
difference(){
translate([-17.8,-19,0])import("ControlHorn-v1.STL");

translate([-8,-14,-5])cylinder(r=1.2,h=20,$fn=30);
translate([+8,-14,-5])cylinder(r=1.2,h=20,$fn=30);
translate([+8,+14,-5])cylinder(r=1.2,h=20,$fn=30);
translate([-8,+14,-5])cylinder(r=1.2,h=20,$fn=30);
translate([-45/2,20,-1])cube([45,40,10]);
    translate([-80/2,-80/2,2])cube([80,80,10]);
}

