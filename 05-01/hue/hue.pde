final static int NUMBER_VERTICAL = 3;
final int OFFSET_COLOR = 3;
final static boolean SHOULD_SAVE = false;
final static boolean IS_LOOP = false;
final static String FILENAME = "test7.png";

void setup() {
  smooth();
  size(420, 680);
  noStroke();
  colorMode(HSB, NUMBER_VERTICAL);
  if (!IS_LOOP) noLoop();
}

void draw() {
  Curve oldCurve = new Curve(
    new Point(0, 0),
    new Point(width/3, 0),
    new Point(2 * width/3, 0),
    new Point(width, 0));
    
  for (int i = 1; i <= NUMBER_VERTICAL; i++) {
    oldCurve = drawBezierShape(i, oldCurve);
  }
  
  if (SHOULD_SAVE) saveFrame(FILENAME);
}
