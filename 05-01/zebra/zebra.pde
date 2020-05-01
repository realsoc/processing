final static int NUMBER_VERTICAL = 14;
final static boolean SHOULD_SAVE = false;
final static String FILENAME = "test5.png";
final static boolean IS_LOOP = true;
final static int STROKE_WEIGHT = 42;
final static boolean INVERT_COLOR = false;

void setup() {
  size(420, 680);
  smooth();
  noFill();
  if (!IS_LOOP) noLoop();
}

void draw() {
  background(INVERT_COLOR ? 255 : 0);
  stroke(INVERT_COLOR ? 0 : 255);
  strokeWeight(STROKE_WEIGHT);
  
  for (int i=1; i<NUMBER_VERTICAL; i++) {
    drawBezier(i);
  }
  
  if (SHOULD_SAVE) saveFrame(FILENAME);
}
