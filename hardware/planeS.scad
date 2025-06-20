a = 100;
b = 42;
bMain = 80;

t = 10;

r = 5;
d = 20;

module square(a,b,t,r) {
hull(){
translate([a/2-r,b/2-r,0])cylinder(r=5,h=t,$fn=30);
translate([-a/2+r,-b/2+r,0])cylinder(r=5,h=t,$fn=30);
translate([-a/2+r,b/2-r,0])cylinder(r=5,h=t,$fn=30);
translate([a/2-r,-b/2+r,0])cylinder(r=5,h=t,$fn=30);
}
 }


module main(a,b,t,r,d, holes=true){
difference(){ 
   
translate([0,0, 0])square(a,b,t,r);
translate([0,0,-1])square(a-d,b-d,t+2,r); 
    
 if (holes){
translate([-(a+d)/2,b/2-d,t/2])rotate([0,90,00])cylinder(r=3/2,h=(a+d),$fn=30);
translate([-(a+d)/2,-b/2+d,t/2])rotate([0,90,00])cylinder(r=3/2,h=(a+d),$fn=30); 
translate([0,(b+d)/2,t/2])rotate([90,0,00])cylinder(r=3/2,h=(b+d),$fn=30); 
translate([a/2-d,(b+d)/2,t/2])rotate([90,0,00])cylinder(r=3/2,h=(b+d),$fn=30); 
translate([-a/2+d,(b+d)/2,t/2])rotate([90,0,00])cylinder(r=3/2,h=(b+d),$fn=30); 
    
translate([a/2-d+5,b/2-d/4,-t/2])rotate([0,0,0])cylinder(r=3/2,h=(b+d),$fn=30); 
translate([-a/2+d-5,b/2-d/4,-t/2])rotate([0,0,0])cylinder(r=3/2,h=(b+d),$fn=30); 
translate([a/2-d+5,-b/2+d/4,-t/2])rotate([0,0,0])cylinder(r=3/2,h=(b+d),$fn=30); 
translate([-a/2+d-5,-b/2+d/4,-t/2])rotate([0,0,0])cylinder(r=3/2,h=(b+d),$fn=30); 

translate([-a/2+d/4,-b/2+d/2,-t/2])rotate([0,0,0])cylinder(r=3/2,h=(b+d),$fn=30); 
translate([+a/2-d/4,-b/2+d/2,-t/2])rotate([0,0,0])cylinder(r=3/2,h=(b+d),$fn=30); 
translate([-a/2+d/4,-b/2+d/2,-t/2])rotate([0,0,0])cylinder(r=3/2,h=(b+d),$fn=30); 
    
translate([+a/2-d/4,-b/2+d/2,-t/2])rotate([0,0,0])cylinder(r=3/2,h=(b+d),$fn=30); 
translate([-a/2+d/4,+b/2-d/2,-t/2])rotate([0,0,0])cylinder(r=3/2,h=(b+d),$fn=30); 
translate([+a/2-d/4,+b/2-d/2,-t/2])rotate([0,0,0])cylinder(r=3/2,h=(b+d),$fn=30);   




}
}

}

module motor(a,b,t,r,d, holes=true){
difference(){
 union(){
  main(a,b,10,r,d, true);
  translate([0,0,0])cylinder(r=42/2,h=t,$fn=30);
 }
translate([0,0,-1])cylinder(r=22/2,h=t+2,$fn=30);
 
translate([0,-33/2,-t/2])rotate([0,0,0])cylinder(r=3/2,h=(b+d),$fn=30); 
translate([0,33/2,-t/2])rotate([0,0,0])cylinder(r=3/2,h=(b+d),$fn=30); 
translate([-33/2,0,-t/2])rotate([0,0,0])cylinder(r=3/2,h=(b+d),$fn=30); 
translate([33/2,0,-t/2])rotate([0,0,0])cylinder(r=3/2,h=(b+d),$fn=30); 
};
}


module tail(a,b,t,r,d,){
difference(){
main(a,55,16,r,d, true);

mirror([1,0,0])
translate([5,0,0])rotate([0,0,45])translate([0,0,3])cube([50,5,10]);
translate([5,0,0])rotate([0,0,45])translate([0,0,3])cube([50,5,10]);
translate([-60,-65-13,-20])cube([120,65,40]);
}
}


module servoHolder(a,b,t,r,d,){
difference(){
union(){
hull(){
translate([-23/2-10,-12-10,0])cube([23+30,2*12+20,1]);
translate([-23/2-5,-12-5,8])cube([23+10,2*12+10,1]);
}
hull(){
translate([12,-15/2,0])cube([50,15,1]);
translate([12,-15/2,8])cube([40,15,1]);
}

translate([-23/2-5,-12-5,-3])cube([23+10,2*12+10,3]);


}

translate([-23/2,-12.3,-20])cube([23,2*12.3,40]);
translate([+27/2,-6,-10])cylinder(r=1.2,h=30,$fn=50);
translate([+27/2,+6,-10])cylinder(r=1.2,h=30,$fn=50);
translate([-27/2,-6,-10])cylinder(r=1.2,h=30,$fn=50);
translate([-27/2,+6,-10])cylinder(r=1.2,h=30,$fn=50);
translate([40,-8.05/2,-10])cube([8.05,8.05,50]);
}
}


// ------------------------------
module wingMount(alpha=3) {
difference(){
    

   hull(){
    rotate([0,-alpha,0])translate([-160/2,-110/2,-4])cube([160,110,9]);
    translate([-10/2+100,-80/2,-0])cube([10,80,3]);
   }
   translate([-200/2,-200/2,-40])cube([200,200,40]);
   translate([-105/2+15-15,-80/2,-10])cube([120,80,40]);
   
   translate([50,+48,-10])cylinder(r=1.5,h=30,$fn=50);
   translate([50,-48,-10])cylinder(r=1.5,h=30,$fn=50);
   translate([-50,+48,-10])cylinder(r=1.5,h=30,$fn=50);
   translate([-50,-48,-10])cylinder(r=1.5,h=30,$fn=50);  
   
   translate([50,+48,-26])cylinder(r=7/2,h=30,$fn=6);
   translate([50,-48,-26])cylinder(r=7/2,h=30,$fn=6);
   translate([-50,+48,-26])cylinder(r=7/2,h=30,$fn=6);
   translate([-50,-48,-26])cylinder(r=7/2,h=30,$fn=6);   
   
}
hull(){
    translate([-10/2+82,-110/2,-0])cube([3,110,20]);
    translate([-10/2+100,-80/2,-0])cube([10,80,5]);
}

}
   
// ------------------------------

module piCamHolder(xcam=25.1, xcable=16.0, camTilt=5.0, zcamOff=10, zCircOff=41) {
  
  difference(){
  // ----------------------
  union(){
  difference(){
  hull(){
      translate([0,-xcam/2,zCircOff])
      rotate([90,0,0])
      cylinder(r=50,h=5,$fn=45);
      
      translate([0,xcam/2+5,zCircOff])
      rotate([90,0,0])
      cylinder(r=50,h=5,$fn=45);
  }
  translate([-100,-100,0])
  cube([200,200,200]);
  
  }
  translate([-(xcam+25)/2,-(xcam+5)/2,0])
  cube([xcam+25,xcam+5,8]);
  }
  
  // ----------------------
  color("red")  
  rotate([0,-camTilt,0])
  
  union(){
      translate([-xcam/2,-xcam/2,-zcamOff])cube([xcam,xcam,15]);
      translate([-xcam/2-10,-xcable/2,-zcamOff])cube([10,xcable,15]);
      translate([-3/2,-xcable/2,-zcamOff])cube([3,xcable,90]);  
  };

  // ----------------------
  rotate([0,-camTilt,0])translate([10,-21/2,-20]) cylinder(r=1.3,h=40,$fn=30);
  rotate([0,-camTilt,0])translate([10, 21/2,-20]) cylinder(r=1.3,h=40,$fn=30);
  rotate([0,-camTilt,0])translate([10-14,-21/2,-20]) cylinder(r=1.3,h=40,$fn=30);
  rotate([0,-camTilt,0])translate([10-14, 21/2,-20]) cylinder(r=1.3,h=40,$fn=30);
  
  rotate([0,-camTilt,0])translate([10, -21/2,6]) cylinder(r=3.3,h=40,$fn=6);
  rotate([0,-camTilt,0])translate([10, 21/2,6]) cylinder(r=3.3,h=40,$fn=6);
  rotate([0,-camTilt,0])translate([10-14, -21/2,6]) cylinder(r=3.3,h=40,$fn=6);
  rotate([0,-camTilt,0])translate([10-14, 21/2,6]) cylinder(r=3.3,h=40,$fn=6);
  }
  
  

}


piCamHolder();

//color("red")
//translate([7,0,10])
//rotate([0,-3,0])translate([-160/2,-110/2,-4])cube([153,110,10]);

//