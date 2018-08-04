
SHELF_HEIGHT = 20;
SHELF_THICKNESS = 10;

SHELF_BOTTOM_DEPTH = 20;
SHELF_BOTTOM_WIDTH = 30;

SHELF_TOP_DEPTH = SHELF_BOTTOM_DEPTH + 4;
SHELF_TOP_WIDTH = SHELF_BOTTOM_WIDTH + 4;


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



module shelf(height, width, depth, t) {
    difference() {
        wedge(height = height, width = width, depth = depth);
        
        translate([0, 0, t]) {
            wedge(height = height, width = width, depth = depth);
        }
    }
}



shelf(
    height = SHELF_HEIGHT,
    width = [SHELF_BOTTOM_WIDTH, SHELF_TOP_WIDTH],
    depth = [SHELF_BOTTOM_DEPTH, SHELF_TOP_DEPTH],
    t = SHELF_THICKNESS
);





