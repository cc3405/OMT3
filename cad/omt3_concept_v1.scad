// OMT3 2026-27 Problem 1 - concept assembly v1
// Units: mm. Concept/layout model only; NOT manufacturing or occupant-safety CAD.
// Adjustable envelopes are intentionally parameterized pending measured hardware.
$fn = 32;
chassis_L=900; chassis_W=620; chassis_H=120;
wheel_D=300; wheel_W=75; wheelbase=650; track=520;
basket_L=650; basket_W=470; basket_H=360;
hitch_L=420; hitch_z=145;
arm_base_z=chassis_H+45; arm_upper=260; arm_fore=230;
show_sensors=true; show_arm=true; show_trailer=true; show_unloader=true;
module rounded_box(l,w,h,r=18){
  hull() for(x=[-l/2+r,l/2-r], y=[-w/2+r,w/2-r]) translate([x,y,0]) cylinder(r=r,h=h);
}
module wheel(x,y,z){
  translate([x,y,z]) rotate([90,0,0]) difference(){
    cylinder(d=wheel_D,h=wheel_W,center=true);
    cylinder(d=wheel_D-28,h=wheel_W+2,center=true);
  }
  translate([x,y,z]) rotate([90,0,0]) cylinder(d=100,h=wheel_W+4,center=true);
}
module chassis(){
  color("#b8bec5") translate([0,0,35]) rounded_box(chassis_L,chassis_W,chassis_H,35);
  color("#707983") translate([-40,0,155]) rounded_box(420,450,30,15);
  for(x=[-wheelbase/2,wheelbase/2]) for(y=[-track/2-38,track/2+38])
    color("#252a30") wheel(x,y,wheel_D/2);
  // Seat and tiller are layout placeholders, not approved occupant hardware.
  color("#424a54") translate([-70,0,220]) rounded_box(270,300,55,35);
  color("#424a54") translate([-190,0,360]) rotate([0,-8,0]) rounded_box(55,300,300,25);
  color("#555d66") translate([310,0,190]) rotate([0,-16,0]) cylinder(d=38,h=440);
  color("#20262d") translate([365,0,600]) rotate([0,90,0]) cylinder(d=42,h=470,center=true);
}
module sensor(x,y,z,rot=0){
  color("#1976d2") translate([x,y,z]) rotate([0,rot,0]){
    cylinder(d=48,h=28,center=true); translate([0,0,20]) cylinder(d=12,h=18,center=true);
  }
}
module sensors(){
  if(show_sensors){ sensor(460,0,170,0); sensor(400,190,170,-18); sensor(400,-190,170,18); }
}
module arm_link(p1,p2,r=24){ hull(){translate(p1) sphere(r=r); translate(p2) sphere(r=r);} }
module gripper(){
  color("#e7a23b"){
    arm_link([0,0,0],[0,68,75],12);
    arm_link([0,0,0],[0,-68,75],12);
    sphere(r=20);
  }
}
module robotic_arm(){
 if(show_arm){
  color("#59636e") translate([340,0,arm_base_z]) cylinder(d=115,h=70);
  color("#8b969f") arm_link([340,0,arm_base_z+45],[400,0,arm_base_z+arm_upper],28);
  color("#8b969f") arm_link([400,0,arm_base_z+arm_upper],[570,0,arm_base_z+arm_upper+arm_fore],22);
  color("#68737e") translate([570,0,arm_base_z+arm_upper+arm_fore]) sphere(r=34);
  translate([600,0,arm_base_z+arm_upper+arm_fore-10]) rotate([0,25,0]) gripper();
  color("#d0d5da") translate([390,0,arm_base_z+arm_upper/2]) sphere(r=32);
  color("#d0d5da") translate([490,0,arm_base_z+arm_upper+70]) sphere(r=27);
 }
}
module trailer(){
 if(show_trailer){
  color("#454d56") arm_link([-chassis_L/2-15,0,hitch_z],[-chassis_L/2-hitch_L,0,hitch_z],22);
  color("#20262d") translate([-chassis_L/2-hitch_L+35,0,hitch_z]) sphere(r=30);
  tx=-chassis_L/2-hitch_L-basket_L/2+15;
  color("#aeb7bf") translate([tx,0,95]) rounded_box(basket_L,basket_W,24,20);
  color("#737f89") for(z=[115:55:basket_H+95]){
    translate([tx,basket_W/2,z]) cube([basket_L,12,12],center=true);
    translate([tx,-basket_W/2,z]) cube([basket_L,12,12],center=true);
    translate([tx+basket_L/2,0,z]) cube([12,basket_W,12],center=true);
    translate([tx-basket_L/2,0,z]) cube([12,basket_W,12],center=true);
  }
  color("#737f89") for(x=[-basket_L/2:75:basket_L/2])
    translate([tx+x,0,(basket_H+210)/2]) cube([10,basket_W,basket_H+95],center=true);
  for(x=[-basket_L/2+85,basket_L/2-85]) for(y=[-basket_W/2+55,basket_W/2-55])
    color("#252a30") translate([tx+x,y,48]) rotate([90,0,0]) cylinder(d=95,h=42,center=true);
 }
}
module independent_unloader(){
 if(show_unloader){
  // Separate freestanding manual slide tray, intentionally not attached to cart or vehicle.
  ux=250; uy=1050;
  color("#68737e") translate([ux,uy,35]) rounded_box(650,480,35,12);
  color("#aeb7bf") translate([ux,uy,95]) rounded_box(520,360,22,8);
  color("#424a54") for(y=[uy-220,uy+220]) translate([ux,y,25]) cube([610,24,50],center=true);
  color("#424a54") translate([ux+300,uy,155]) cube([24,440,220],center=true);
  color("#d59b3d") translate([ux-320,uy,160]) cylinder(d=34,h=320);
 }
}
chassis(); sensors(); robotic_arm(); trailer(); independent_unloader();
