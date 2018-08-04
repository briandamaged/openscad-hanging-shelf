
ROWS = 2;
SEP = 40;

SHELF_THICKNESS = 5;
SHELF_LIP = 5;
SHELF_WIDTH = 80;
SHELF_DEPTH = 40;


// Derived properties
SHELF_HEIGHT = SHELF_THICKNESS + 2;


function is_vector(thing) = (
    thing[0] == thing[0] && len(thing) != undef
);

function to_coord(thing) = (
    is_vector(thing) ? thing : [thing, thing]
);


module wedge(height, width, depth) {
    _width = to_coord(width);
    _depth =  to_coord(depth);

    bottom_width = _width[0];
    top_width = _width[1];
    
    bottom_depth = _depth[0];
    top_depth = _depth[1];

    s_w = (top_width / bottom_width);
    s_d = (top_depth / bottom_depth);

    linear_extrude(height = height, center = true, scale=[s_w, s_d]) {
        square(size = [bottom_width, bottom_depth], center = true);
    }
}



module platter(height, width, depth, t) {
    difference() {
        wedge(height = height, width = width, depth = depth);
        
        translate([0, 0, t]) {
            wedge(height = height, width = width, depth = depth);
        }
    }
}

module backing(height, width, depth) {
    cube([width, depth, height], center = true);
}


module shelf(height, width, depth, t, lip, rows, sep) {
    backing_height = ((rows - 0.5) * sep);
    translate([0, 0, backing_height / 2]) {
        backing(height = backing_height, width = width, depth = 4);        
    }


    platter_width = [width, width + lip];
    platter_depth = [depth, depth + lip];

    translate([0, -depth / 2, 0]) {
        for(i = [0:rows - 1]) {
            translate([0, 0, i * sep]) {
                platter(height = height, width = platter_width, depth = platter_depth, t = t);
            }
        }
    }

}


shelf(
    height = SHELF_HEIGHT,
    width = SHELF_WIDTH,
    depth = SHELF_DEPTH,
    t = SHELF_THICKNESS,
    lip = SHELF_LIP,
    rows = ROWS,
    sep = SEP
);


