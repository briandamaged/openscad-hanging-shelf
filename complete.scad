
SHELF_HEIGHT = 20;
SHELF_THICKNESS = 10;

SHELF_BOTTOM_DEPTH = 20;
SHELF_BOTTOM_WIDTH = 30;

SHELF_TOP_DEPTH = SHELF_BOTTOM_DEPTH + 4;
SHELF_TOP_WIDTH = SHELF_BOTTOM_WIDTH + 4;





module wedge(height, bottom_width, top_width, bottom_depth, top_depth) {

    s_w = (top_width / bottom_width);
    s_d = (top_depth / bottom_depth);

    linear_extrude(height = height, center = true, scale=[s_w, s_d]) {
        square(size = [bottom_width, bottom_depth], center = true);
    }
}


wedge(
    height = SHELF_HEIGHT,
    bottom_width = SHELF_BOTTOM_WIDTH,
    top_width = SHELF_TOP_WIDTH,

    bottom_depth = SHELF_BOTTOM_DEPTH,
    top_depth = SHELF_TOP_DEPTH
);



