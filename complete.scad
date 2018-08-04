
ROWS = 2;
SEP = 40;

SHELF_THICKNESS = 5;
_SHELF_WIDTH = 80;
_SHELF_DEPTH = 40;


// Derived properties
SHELF_HEIGHT = SHELF_THICKNESS + 2;
SHELF_WIDTH = [_SHELF_WIDTH, _SHELF_WIDTH + 10];
SHELF_DEPTH = [_SHELF_DEPTH, _SHELF_DEPTH + 10];



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


module shelf(height, width, depth, t, rows, sep) {
    for(i = [0:rows - 1]) {
        translate([0, 0, i * sep]) {
            platter(height = height, width = width, depth = depth, t = t);
        }
    }
}


shelf(
    height = SHELF_HEIGHT,
    width = SHELF_WIDTH,
    depth = SHELF_DEPTH,
    t = SHELF_THICKNESS,
    rows = ROWS,
    sep = SEP
);




