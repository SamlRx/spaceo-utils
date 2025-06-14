// --- Parameters ---

// Cylindrical rod
hole_diameter = 3.8;
hole_depth = 10;
clearance = 0.1;
rod_diameter = hole_diameter - clearance;
rod_length = hole_depth;

// Chamfer
chamfer_height = 2;
chamfer_base_diameter = rod_diameter - 0.6;  // Slightly wider to guide well

// Rectangular stop
stop_width = 14;
stop_length = 30;
stop_height = 1.6;

module foot() {
    union() {
        chamfer();

        translate([0, 0, chamfer_height])
            rod();

        translate([-stop_width/2, -stop_length/2, rod_length])
            rectangular_stop();
    }
}

module chamfer() {
    cylinder(h = chamfer_height, d1 = chamfer_base_diameter, d2 = rod_diameter, $fn = 100);
}

module rod() {
    cylinder(h = rod_length - chamfer_height, d = rod_diameter, $fn = 100);
}

module rectangular_stop() {
    cube([stop_width, stop_length, stop_height]);
}

foot();
