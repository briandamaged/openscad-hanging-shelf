
SHELF_HEIGHT = 20;
SHELF_THICKNESS = 10;

SHELF_BOTTOM_DEPTH = 20;
SHELF_BOTTOM_WIDTH = 30;

SHELF_TOP_DEPTH = SHELF_BOTTOM_DEPTH + 4;
SHELF_TOP_WIDTH = SHELF_BOTTOM_WIDTH + 4;


s_w = (SHELF_TOP_WIDTH / SHELF_BOTTOM_WIDTH);
s_d = (SHELF_TOP_DEPTH / SHELF_BOTTOM_DEPTH);


module wedge(height, bottom_width, top_width, bottom_depth, top_depth) {

}

linear_extrude(height = SHELF_HEIGHT, center = true, convexity = 10, scale=[s_w, s_d]) {
    square(size = [SHELF_BOTTOM_WIDTH, SHELF_BOTTOM_DEPTH], center = true);
}



