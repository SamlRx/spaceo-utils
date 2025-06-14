// Parameters for the inverted T-profile
horizontal_width = 10;
horizontal_thickness = 0.6;
vertical_thickness = 3.6;
vertical_height = 5;
length = 100;

module profile_T_inverted() {
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

// Module call
profile_T_inverted();
