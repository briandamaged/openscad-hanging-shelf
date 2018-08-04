
SHELF_DEPTH = 40;
SHELF_WIDTH = 80;
SHELF_HEIGHT = 20;

linear_extrude(height = SHELF_HEIGHT, center = true, convexity = 10, scale=3) {
    square(size = [SHELF_WIDTH, SHELF_DEPTH], center = true);
}