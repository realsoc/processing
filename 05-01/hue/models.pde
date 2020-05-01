class Color {
  final int v1;
  final int v2;
  final int v3;
  
  Color(int v1, int v2, int v3) {
     this.v1 = v1;
     this.v2 = v2; 
     this.v3 = v3;
  }
}

class Point {
  final int x;
  final int y;
  
  Point(int x, int y) {
    this.x = x;
    this.y = y;
  }
}

// Represents a bezier curve, from left to right
class Curve {
  final Point firstPoint;
  final Point secondPoint;
  final Point thirdPoint;
  final Point fourthPoint;
  
  Curve(Point p1, Point p2, Point p3, Point p4) {
    if (p1.x > p4.x) 
      throw new RuntimeException("The bezier curve should always be from left to right");
    firstPoint = p1;
    secondPoint = p2;
    thirdPoint = p3; 
    fourthPoint = p4;
  }
}
