// OMT3 Division II independent manual unloader — CONCEPT ONLY
// Units: mm. This model is a layout aid, not a certified structural drawing.
// The unloader must remain physically separate from the vehicle and shopping cart.
// Confirm all dimensions after measuring the actual cart, props and competition layout.

$fn = 32;

// Editable prototype envelope. Do not treat these as frozen manufacturing dimensions.
base_x = 450;
base_y = 350;
base_t = 18;

tray_x = 300;
tray_y = 240;
tray_t = 12;
tray_lip_h = 30;
tray_lip_t = 6;

rail_length = 300;
rail_spacing = 220;
rail_w = 18;
rail_h = 12;

support_h = 80;       // placeholder; adjust to measured cart rim / operator geometry
support_w = 18;
support_t = 18;

stop_h = 22;
stop_t = 8;
handle_d = 22;
handle_len = 90;

foot_d = 28;
foot_h = 8;

module rounded_box(x,y,z,r=4) {
    minkowski() {
        cube([x-2*r,y-2*r,z/2], center=true);
        cylinder(r=r,h=z/2,center=true);
    }
}

module base_plate() {
    translate([0,0,base_t/2])
        color("burlywood") rounded_box(base_x,base_y,base_t,5);
    for (sx=[-1,1], sy=[-1,1]) {
        translate([sx*(base_x/2-35),sy*(base_y/2-35),-foot_h/2])
            color("dimgray") cylinder(d=foot_d,h=foot_h,center=true);
    }
}

module supports_and_rails() {
    for (sx=[-1,1]) {
        translate([sx*(rail_spacing/2+support_w/2),0,base_t+support_h/2])
            color("silver") cube([support_w,base_y-50,support_h],center=true);
        translate([sx*rail_spacing/2,0,base_t+support_h+rail_h/2])
            color("gray") cube([rail_w,rail_length,rail_h],center=true);
    }
}

module tray_assembly() {
    tray_z = base_t + support_h + rail_h + tray_t/2;
    translate([0,0,tray_z]) {
        color("lightgray") cube([tray_x,tray_y,tray_t],center=true);
        // Low containment lips
        translate([0,tray_y/2-tray_lip_t/2,tray_lip_h/2])
            color("silver") cube([tray_x,tray_lip_t,tray_lip_h],center=true);
        translate([0,-tray_y/2+tray_lip_t/2,tray_lip_h/2])
            color("silver") cube([tray_x,tray_lip_t,tray_lip_h],center=true);
        translate([tray_x/2-tray_lip_t/2,0,tray_lip_h/2])
            color("silver") cube([tray_lip_t,tray_y,tray_lip_h],center=true);
        translate([-tray_x/2+tray_lip_t/2,0,tray_lip_h/2])
            color("silver") cube([tray_lip_t,tray_y,tray_lip_h],center=true);
        // Travel end stops (visual placeholders; actual anti-pullout hardware required)
        for (sx=[-1,1]) {
            translate([sx*(rail_spacing/2),tray_y/2+15,stop_h/2])
                color("orange") cube([stop_t,20,stop_h],center=true);
        }
        // Handle at operator side
        translate([0,-tray_y/2-handle_len/2,handle_d/2])
            rotate([90,0,0]) color("black") cylinder(d=handle_d,h=handle_len,center=true);
    }
}

base_plate();
supports_and_rails();
tray_assembly();

// REQUIRED DESIGN REVIEW BEFORE FABRICATION:
// 1) Replace support_h, tray position, rail length and base dimensions after physical measurement.
// 2) Specify actual commercial rail profile, fasteners and anti-pullout stops.
// 3) Check stability under maximum actual prop load and pull force.
// 4) Remove pinch points and add guards around moving rails.
// 5) Verify the device is freestanding and never attached to the vehicle/cart.
// 6) This model omits fastener holes, material grades, load calculations and manufacturing tolerances.
