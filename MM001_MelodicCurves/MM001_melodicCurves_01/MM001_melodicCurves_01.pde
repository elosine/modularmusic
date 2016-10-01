//MM001 - Melodic Curves
//Justin Yang

//Global Variables
int[][] pts;

void setup() {
  size(500, 500);
  pts = new int[0][2];
}//end setup

void draw() {
  background(0);
  fill(153,255,0);
  noStroke();
  for(int i=0;i<pts.length;i++){
    ellipse(pts[i][0], pts[i][1], 4,4);
  }
} //end draw

void mouseDragged() {
  //if current mouseX/Y is not equal to previous X/Y then add to set
  if (pts.length>0) {
    if (mouseX == pts[pts.length-1][0] && mouseY == pts[pts.length-1][1]);
    else pts = (int[][])append(pts, new int[] {mouseX, mouseY});
  }
  else pts = (int[][])append(pts, new int[] {mouseX, mouseY});
} //end mouseDragged

void keyPressed() {
  if (key=='a') for (int i=0; i<pts.length; i++)printArray(pts[i]);
}

