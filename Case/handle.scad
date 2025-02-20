// Framework Desktop Handle
//  An OpenSCAD implementation of a carrying handle for the Framework Desktop
//
//  Print it laying on its side for layer strength.
//  Needs 2x M6 x 12mm bolts or thumbscrews to attach to the system.
//
// Framework Desktop Handle © 2025 Framework Computer Inc
// is licensed under Attribution 4.0 International. 
// To view a copy of this license, visit http://creativecommons.org/licenses/by/4.0/

include <MCAD/boxes.scad>;

// Matching the bolt spacing on the Top Cover
hole_to_hole = 120;
// Tradeoff between more thumbscrew clearance vs hand space
hole_offset = 10;
// Handle height
height = 40;
// Handle width
width = 25;
thickness = width/2;
// 3mm is enough strength when using typical filament
base_thickness = 3;
r = thickness;
// Bolt hole diameter
m6_r = 6/2 + 0.5;

$fn = 128;

rotate([-90, 0, 0]) difference() {
    union() {
        intersection() {
            // Rounding the overall shape of the handle by starting with a rounded cube
            translate([hole_offset/2, -r, 0]) roundedCube([hole_to_hole - hole_offset, height + r, width], r, true);
            // Rounding each section of the handle by making each a cylinder
            union() {
                // The two vertical pieces
                translate([hole_offset/2, 0, width/2]) rotate([-90, 0, 0]) cylinder(h = height, r = width/2);
                translate([hole_to_hole - hole_offset/2, 0, width/2]) rotate([-90, 0, 0]) cylinder(h = height, r = width/2);
                // The horizontal piece
                translate([hole_offset/2, height, width/2]) rotate([0, 90, 0]) cylinder(h = hole_to_hole - hole_offset, r = width/2); 
            }
        }
        
        // The flat parts that the bolts go through
        mount_length = width + hole_offset/2;
        translate([-width/2, 0, width]) rotate([-90, 0, 0]) roundedCube([mount_length, width, base_thickness], width/2, true);
        translate([hole_to_hole - width + (width - hole_offset)/2, 0, width]) rotate([-90, 0, 0]) roundedCube([mount_length, width, base_thickness], width/2, true);
    }
    
    // The cylinder cutouts in the vertical parts
    translate([hole_offset/2, base_thickness, width/2]) rotate([-90, 0, 0]) cylinder(h = height, r = width/2 - 2);
    translate([hole_to_hole - hole_offset/2, base_thickness, width/2]) rotate([-90, 0, 0]) cylinder(h = height, r = width/2 - 2);
    
    // The bolt holes
    translate([0, 0, width/2]) rotate([-90, 0, 0]) cylinder(h = height, r = m6_r);
    translate([hole_to_hole, 0, width/2]) rotate([-90, 0, 0]) cylinder(h = height, r = m6_r);    
}
