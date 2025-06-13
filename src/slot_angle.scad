// Parameters
horizontal_width = 10;
horizontal_thickness = 0.6;
vertical_thickness = 4;
vertical_height = 6;
length = 50;

module profile_T_inverted(len) {
    union() {
        // Horizontal bar (flat)
        cube([horizontal_width, horizontal_thickness, length]);

        // Vertical stem that "rises", centered on the width
        translate([
            (horizontal_width - vertical_thickness)/2,
            horizontal_thickness,
            0
        ])
        cube([vertical_thickness, vertical_height, length]);
    }
}


module gap(len) {
    union() {
        translate([(horizontal_width - vertical_thickness)/2,horizontal_thickness-horizontal_thickness, -vertical_height-horizontal_thickness])
            cube([vertical_thickness, vertical_height+horizontal_thickness, vertical_height+horizontal_thickness]);

    }
}

module reinforcement(len) {
    small_len = len / 6 * 5;
    thickness = (horizontal_width - vertical_thickness)/2;
    union() {
        translate([thickness, 0, 0])
        translate([0, -small_len, 0])
        rotate([-45, 0, 0])
        cube([thickness, vertical_height, sqrt(small_len^2 * 2)]);
    }
}

module corner_with_bevel() {
    intersection() {
        union() {
            // First T
            profile_T_inverted(length);

            // Fill the gap
            gap(length);
            
            // Second T, rotated by 90 degrees
            rotate([90, 180, 0])
            translate([-horizontal_width, 0, 0])
                profile_T_inverted(length);

            // Bar between the Ts
            reinforcement(length);
        }
    }
}

// Display
corner_with_bevel();
