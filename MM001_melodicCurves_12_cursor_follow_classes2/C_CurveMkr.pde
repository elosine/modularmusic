// DECLARE/INITIALIZE CLASS SET
Curvemkr crvmkr = new Curvemkr();

class Curvemkr {
  // CONSTRUCTOR VARIALBES //
  // CLASS VARIABLES //
  ////Curve points array
  int[][] pts;
  boolean drawon = false;
  // CONSTRUCTORS //
  Curvemkr() {
    ////Initialize empty curve points array
    pts = new int[0][2];
  } //end constructor 1

  //  DRAW METHOD //
  void drw() {
    if (drawon) {
      ////Draw Curve
      if (pts.length>0) {
        stroke(255, 128, 0);
        strokeWeight(5);
        noFill();
        beginShape();
        curveVertex(pts[0][0], pts[0][1]);
        for (int i=0; i<pts.length; i++) curveVertex(pts[i][0], pts[i][1]);
        curveVertex(pts[pts.length-1][0], pts[pts.length-1][1]);
        endShape();
      }
    }
  } //End drw

  //  msdrg METHOD //
  void msdrg() {
    if (drawon) {
      //if current mouseX/Y is not equal to previous X/Y then add to set
      if (pts.length>0) {
        if (mouseX == pts[pts.length-1][0] && mouseY == pts[pts.length-1][1]);
        else pts = (int[][])append(pts, new int[] {mouseX, mouseY});
      } else pts = (int[][])append(pts, new int[] {mouseX, mouseY});
    }
  }//End msdrg

  void keyprs() {
    if (key=='d') drawon = true;
    if (key=='f') drawon = false;
    if (key=='e') pts = new int[0][2];
  } //End keyprs

  void savecrv(String name) {
    String[] strtemp = new String[pts.length];
    for (int i=0; i<pts.length; i++) {
      strtemp[i] = str(pts[i][0]) + ',' +  str(pts[i][1]);
    }
    saveStrings(name, strtemp);
  }
  //
} //End class