// Draws a bezier curve for a vertical index
void drawBezier(int index) {
  Point p1 = getPointOnGrid(0, index);
  Point p2 = getPointOnGrid(1, index);
  Point p3 = getPointOnGrid(2, index);
  Point p4 = getPointOnGrid(3, index);
  
  bezier(
    (float)p1.x, (float)p1.y,
    (float)p2.x, (float)p2.y,
    (float)p3.x, (float)p3.y,
    (float)p4.x, (float)p4.y
    );
}

// Transforms a grid position in coordinates
Point getPointOnGrid(int x, int y) {
  if (x < 0 || x >= 4) throw new RuntimeException("Illegal x value");
  if (y <= 0 || y >= NUMBER_VERTICAL) throw new RuntimeException("Illegal y value");
  
  return new Point(x * width/3, randomHeight(y));
}

// Gets a vertical coordinate from a vertical index
int randomHeight(int index) {
  return (int)((index * height/NUMBER_VERTICAL) + (random(height/NUMBER_VERTICAL) - height/(NUMBER_VERTICAL*2)));
}
