// Two-Part Enclosure for Mini Theremin (Final Version)
// All dimensions are in millimeters

// Parameters:
enclosure_length = 35;
enclosure_width  = 30;
bottom_height    = 10;
lid_thickness    = 5;
wall_thickness   = 2;
clearance        = 0.5;

// Battery cavity (indentation only; do not cut through the bottom)
battery_cavity_length = 20;
battery_cavity_width  = 10;
battery_cavity_depth  = 5;

// USB slot parameters (back wall)
usb_cutout_width  = 10;
usb_cutout_height = 4;

// Buzzer slot parameters (front wall)
buzzer_cutout_width  = 6;
buzzer_cutout_height = 3;

// Power switch slot parameters (right wall)
switch_slot_height = 6;  // vertical extent (a square of wall thickness by 6 mm by 6 mm)

// Sensor slot parameters (in the lid)
sensor_slot_length = 10;
sensor_slot_width  = 5;

////////////////////////////
// Module: Bottom Enclosure
////////////////////////////
module bottom_enclosure() {
  difference() {
    // Outer solid box for the bottom enclosure:
    cube([enclosure_length, enclosure_width, bottom_height], false);
    
    // Hollow out the interior starting at z = wall_thickness to keep a solid bottom:
    translate([wall_thickness, wall_thickness, wall_thickness])
      cube([enclosure_length - 2*wall_thickness, enclosure_width - 2*wall_thickness, bottom_height - wall_thickness], false);
    
    // USB slot on the back wall (assumed at y = 0):
    // Cut a through–hole only through the wall thickness.
    translate([ (enclosure_length - usb_cutout_width) / 2, 0 - wall_thickness, bottom_height/4 ])
      cube([usb_cutout_width, wall_thickness, usb_cutout_height], false);
    
    // Buzzer slot on the front wall (assumed at y = enclosure_width):
    translate([ (enclosure_length - buzzer_cutout_width) / 2, enclosure_width, (bottom_height - buzzer_cutout_height) / 2 ])
      cube([buzzer_cutout_width, wall_thickness, buzzer_cutout_height], false);
    
    // Power switch slot on the right wall (assumed at x = enclosure_length):
    // Cut a through–hole through the wall thickness.
    translate([enclosure_length - wall_thickness, (enclosure_width - switch_slot_height) / 2, bottom_height/2 - switch_slot_height/2 ])
      cube([wall_thickness, switch_slot_height, switch_slot_height], false);
    
    // Battery cavity: an internal indentation (do NOT cut through the bottom)
    // Positioned so that 1 mm remains at the very bottom.
    translate([ (enclosure_length - battery_cavity_length) / 2, wall_thickness, 1 ])
      cube([battery_cavity_length, battery_cavity_width, battery_cavity_depth], false);
  }
}

//////////////////////
// Module: Top Lid
//////////////////////
module top_lid() {
  difference() {
    // Outer lid: a solid plate.
    cube([enclosure_length, enclosure_width, lid_thickness], false);
    
    // Inner recess for a snug fit over the bottom enclosure.
    // Cut out from the underside so that 0.5 mm remains as the top.
    translate([wall_thickness - clearance, wall_thickness - clearance, 0])
      cube([enclosure_length - 2*(wall_thickness - clearance), enclosure_width - 2*(wall_thickness - clearance), lid_thickness - 0.5], false);
    
    // Sensor slot: a through–cut in the lid that spans the full lid thickness.
    translate([ (enclosure_length - sensor_slot_length) / 2, (enclosure_width/4) - sensor_slot_width/2, 0 ])
      cube([sensor_slot_length, sensor_slot_width, lid_thickness], false);
  }
}

//////////////////////////////
// Render Both Parts Side by Side
//////////////////////////////
union() {
  // Bottom enclosure (in blue)
  translate([0, 0, 0])
    color("blue") bottom_enclosure();
  
  // Top lid (in green), shifted to the right
  translate([enclosure_length + 10, 0, 0])
    color("green") top_lid();
}
