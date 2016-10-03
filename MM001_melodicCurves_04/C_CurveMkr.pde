// DECLARE/INITIALIZE CLASS SET
Curvemkr crvmkr = new Curvemkr(0);

class Curvemkr {
  // CONSTRUCTOR VARIALBES //
  int ix;
  // CLASS VARIABLES //
  ////Curve points array
  int[][] pts;
  // CONSTRUCTORS //
  /// Constructor 1 ///
  Curvemkr(int aix) {
    ix = aix;
    ////Initialize empty curve points array
    pts = new int[0][2];
  } //end constructor 1

  //  DRAW METHOD //
  void drw() {
    ////Draw Curve
    if(pts.length>0){
      stroke(255,128,0);
      strokeWeight(5);
      noFill();
      beginShape();
      curveVertex(pts[0][0], pts[0][1]);
      for (int i=0; i<pts.length; i++) curveVertex(pts[i][0], pts[i][1]);
      curveVertex(pts[pts.length-1][0], pts[pts.length-1][1]);
      endShape();
    }
  } //End drw

  //  msdrg METHOD //
  void msdrg() {
    //if current mouseX/Y is not equal to previous X/Y then add to set
    if (pts.length>0) {
      if (mouseX == pts[pts.length-1][0] && mouseY == pts[pts.length-1][1]);
      else pts = (int[][])append(pts, new int[] {mouseX, mouseY});
    } 
    else pts = (int[][])append(pts, new int[] {mouseX, mouseY});
  } //End msdrg
  //
} //End class