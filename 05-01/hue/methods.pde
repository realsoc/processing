/** 
 * Draws a bezier shape that takes the whole width between
 * the given last bezier curve and a newly calculated one
 * thanks to the vertical index
 *
 * Returns the newly calculated curve
*/
Curve drawBezierShape(int index, Curve oldCurve) {
  Color newColor = pickColor(index);
  fill(newColor.v1, newColor.v2, newColor.v3);
  
  beginShape();
  // Top right point
  vertex(oldCurve.fourthPoint.x, oldCurve.fourthPoint.y);
  
  // Going to Top left
  bezierVertex(
    oldCurve.thirdPoint.x, oldCurve.thirdPoint.y,
    oldCurve.secondPoint.x, oldCurve.secondPoint.y,
    oldCurve.firstPoint.x, oldCurve.firstPoint.y);
    
  Curve currentCurve = getBezierForY(index);
  
  // Bottom left
  vertex(currentCurve.firstPoint.x, currentCurve.firstPoint.y);
  
  // Bottom right
  bezierVertex(
    currentCurve.secondPoint.x, currentCurve.secondPoint.y,
    currentCurve.thirdPoint.x, currentCurve.thirdPoint.y,
    currentCurve.fourthPoint.x, currentCurve.fourthPoint.y);
    
  endShape(CLOSE);
  
  return currentCurve;
}

// Picks a color for a shape using its vertical index
Color pickColor(int index) {
  return new Color((index + OFFSET_COLOR) % NUMBER_VERTICAL, NUMBER_VERTICAL, NUMBER_VERTICAL);
}

// Gets coordinates for a grid point
Point getPointOnGrid(int x, int y) {
  if (x < 0 || x >= 4) throw new RuntimeException("Illegal x value");
  if (y <= 0 || y > NUMBER_VERTICAL) throw new RuntimeException("Illegal y value");
  
  if (y == NUMBER_VERTICAL) return new Point(x * width/3, height);
  return new Point(x * width/3, randomHeight(y));
}

// Gets a randomized height for a vertical index
int randomHeight(int index) {
  return (int)((index * height/NUMBER_VERTICAL) + (random(height/NUMBER_VERTICAL) - height/(NUMBER_VERTICAL*2)));
}

// Calculates a curve from a verticla index
Curve getBezierForY(int y) {
    Point p1 = getPointOnGrid(0, y);
    Point p2 = getPointOnGrid(1, y);
    Point p3 = getPointOnGrid(2, y);
    Point p4 = getPointOnGrid(3, y);
    return new Curve(p1, p2, p3, p4);
  }
