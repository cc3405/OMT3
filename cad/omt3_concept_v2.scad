// OMT3 2026-27 | cost-down parametric concept assembly v2
// Units: mm. Layout CAD only; NOT a manufacturing drawing or rider-safety approval.
// Front of vehicle = +X. All dimensions are provisional pending physical measurement.
$fn=36;
chassis_L=900; chassis_W=620; chassis_H=115;
wheel_D=300; wheel_W=72; wheelbase=650; track=520;
basket_L=650; basket_W=470; basket_H=360; basket_floor_z=95;
hitch_L=420; hitch_z=150;
arm_mount_x=300; arm_mount_z=chassis_H+100;
upper_arm_L=250; forearm_L=220; link_w=42; link_h=24;
shoulder_deg=-25; elbow_deg=55; wrist_deg=0; // pose parameter only; no wrist actuator
jaw_open=100; jaw_length=95; jaw_thick=14;
sensor_front_x=chassis_L/2-25; sensor_side_x=chassis_L/2-85; sensor_y=190;
show_vehicle=true; show_arm=true; show_sensors=true; show_trailer=true; show_unloader=true; show_payloads=true;
module rbox(x,y,z,r=12){ hull() for(a=[-x/2+r,x/2-r],b=[-y/2+r,y/2-r]) translate([a,b,0]) cylinder(r=r,h=z,center=true); }
module axle_wheel(x,y,z){ translate([x,y,z]) rotate([90,0,0]) { color("#20252b") difference(){ cylinder(d=wheel_D,h=wheel_W,center=true); cylinder(d=wheel_D-24,h=wheel_W+2,center=true); } color("#8b949c") cylinder(d=92,h=wheel_W+4,center=true); } }
module vehicle(){
 color("#aeb7bf") translate([0,0,70]) rbox(chassis_L,chassis_W,chassis_H,28);
 color("#59636d") translate([-25,0,145]) rbox(500,460,30,10);
 for(x=[-wheelbase/2,wheelbase/2]) for(y=[-track/2-wheel_W/2,track/2+wheel_W/2]) axle_wheel(x,y,wheel_D/2);
 // Seat/tiller are visual placeholders only, not occupant-rated structures.
 color("#424b55") translate([-90,0,220]) rbox(280,310,55,25);
 color("#424b55") translate([-90,0,285]) rbox(250,260,28,12);
 color("#555e68") translate([-350,0,390]) rotate([0,-10,0]) cube([45,45,360],center=true);
 color("#20262d") translate([-350,0,570]) rotate([0,90,0]) cylinder(d=38,h=420,center=true);
 color("#59636d") translate([arm_mount_x-35,0,arm_mount_z-35]) rbox(170,230,18,8);
}
module hc_sr04(){ color("#2379c8") cube([46,24,2],center=true); for(y=[-12,12]) translate([0,y,8]) color("#91a7ba") cylinder(d=16,h=16,center=true); }
module sensors(){ if(show_sensors){ translate([sensor_front_x,0,185]) hc_sr04(); translate([sensor_side_x,sensor_y,185]) hc_sr04(); translate([sensor_side_x,-sensor_y,185]) hc_sr04(); for(s=[-1,1]) color("#4b5661") translate([sensor_side_x-15,s*sensor_y,165]) rotate([0,0,s*18]) cube([70,8,35],center=true); } }
module servo_block(size=[42,22,40]){ color("#343b43") cube(size,center=true); color("#c0c6cc") translate([0,0,size[2]/2+3]) cylinder(d=18,h=6,center=true); }
module arm_link(len){ color("#89949e") difference(){ hull(){ translate([0,0,0]) cylinder(d=link_w,h=link_h,center=true); translate([len,0,0]) cylinder(d=link_w,h=link_h,center=true); } translate([0,0,0]) cylinder(d=10,h=link_h+2,center=true); translate([len,0,0]) cylinder(d=10,h=link_h+2,center=true); } }
module pushrod(p1,p2,r=4){ hull(){ translate(p1) sphere(r=r); translate(p2) sphere(r=r); } }
module v_gripper(){
 // One micro-servo drives both hinged, symmetric V jaws through a mechanical equalizer.
 color("#d99b43"){
  translate([jaw_length/2,jaw_open/2,0]) rotate([0,0,-18]) cube([jaw_length,jaw_thick,22],center=true);
  translate([jaw_length/2,-jaw_open/2,0]) rotate([0,0,18]) cube([jaw_length,jaw_thick,22],center=true);
  color("#454b52"){ translate([jaw_length/2,jaw_open/2-10,0]) rotate([0,0,-18]) cube([jaw_length-12,8,24],center=true); translate([jaw_length/2,-jaw_open/2+10,0]) rotate([0,0,18]) cube([jaw_length-12,8,24],center=true); }
  for(y=[-jaw_open/2,jaw_open/2]) translate([12,y,0]) color("#c0c6cc") cylinder(d=12,h=30,center=true);
  translate([-28,0,0]) servo_block([42,30,28]);
  color("#c0c6cc") translate([-5,0,18]) cylinder(d=26,h=5,center=true);
  pushrod([0,0,18],[20,jaw_open/2-8,0],4);
  pushrod([0,0,18],[20,-jaw_open/2+8,0],4);
 }
}
module arm(){
 if(show_arm) translate([arm_mount_x,0,arm_mount_z]){
  color("#59636d") rbox(110,145,48,10); servo_block([52,34,48]);
  rotate([0,shoulder_deg,0]){
   translate([upper_arm_L/2,0,0]) arm_link(upper_arm_L);
   translate([upper_arm_L,0,0]){
    color("#c0c6cc") sphere(d=44); servo_block([48,34,42]);
    rotate([0,elbow_deg,0]){
     translate([forearm_L/2,0,0]) arm_link(forearm_L);
     translate([forearm_L,0,0]){ color("#c0c6cc") sphere(d=38); rotate([0,wrist_deg,0]) translate([18,0,0]) v_gripper(); }
    }
   }
  }
 }
}
module trailer(){
 if(show_trailer){
  color("#4c5661") translate([-chassis_L/2-hitch_L/2,0,hitch_z]) cube([hitch_L,32,32],center=true);
  color("#20262d") translate([-chassis_L/2-20,0,hitch_z]) sphere(d=48);
  color("#d49a42") translate([-chassis_L/2-55,0,hitch_z+28]) rotate([90,0,0]) cylinder(d=10,h=90,center=true);
  color("#333a42") translate([-chassis_L/2-hitch_L+60,0,hitch_z-22]) cube([hitch_L-80,5,5],center=true);
  tx=-chassis_L/2-hitch_L-basket_L/2+10;
  color("#9ea9b2") translate([tx,0,basket_floor_z]) rbox(basket_L,basket_W,22,16);
  color("#737f89") for(z=[basket_floor_z+22:55:basket_floor_z+basket_H]){ translate([tx,basket_W/2,z]) cube([basket_L,9,9],center=true); translate([tx,-basket_W/2,z]) cube([basket_L,9,9],center=true); translate([tx+basket_L/2,0,z]) cube([9,basket_W,9],center=true); translate([tx-basket_L/2,0,z]) cube([9,basket_W,9],center=true); }
  color("#737f89") for(x=[-basket_L/2+35:65:basket_L/2-35]) for(y=[-basket_W/2,basket_W/2]) translate([tx+x,y,basket_floor_z+basket_H/2]) cube([8,8,basket_H],center=true);
  for(x=[-basket_L/2+85,basket_L/2-85]) for(y=[-basket_W/2+60,basket_W/2-60]) color("#252a30") translate([tx+x,y,48]) rotate([90,0,0]) cylinder(d=95,h=38,center=true);
  if(show_payloads){ color("#dce1e5") translate([tx-100,-80,basket_floor_z+65]) cylinder(d=68,h=210,center=true); color("#f1c65c") translate([tx+65,65,basket_floor_z+50]) sphere(d=76); color("#c94b4b") translate([tx+130,-85,basket_floor_z+35]) rbox(120,80,50,6); }
 }
}
module independent_unloader(){
 if(show_unloader){ ux=280; uy=1050; color("#626d77") translate([ux,uy,32]) rbox(620,450,28,10); color("#aeb7bf") translate([ux,uy,88]) rbox(500,330,20,8); color("#444c55") for(y=[uy-205,uy+205]) translate([ux,y,20]) cube([580,22,42],center=true); color("#444c55") translate([ux+285,uy,135]) cube([20,400,180],center=true); color("#d49a42") translate([ux-305,uy,145]) cylinder(d=28,h=250); }
}
if(show_vehicle) vehicle();
sensors(); arm(); trailer(); independent_unloader();
