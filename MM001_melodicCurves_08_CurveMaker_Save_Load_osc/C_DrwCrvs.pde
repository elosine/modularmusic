// DECLARE/INITIALIZE CLASS SET
Drwcrvs drwcrvs = new Drwcrvs();

class Drwcrvs {
  // CLASS VARIABLES //
  ////Curve points array
  int[][] tpts;
  int[][] bpts;
  // CONSTRUCTORS //
  Drwcrvs() {
    ////Initialize empty curve points array
    tpts = new int[0][2];
    bpts = new int[0][2];
  } 

  //  DRAW METHOD //
  void drw() {
    ////Draw Top Curve
    if (!crvmkr.drawon) {
      if (tpts.length>0) {
        stroke(255, 128, 0);
        strokeWeight(5);
        noFill();
        beginShape();
        curveVertex(tpts[0][0], tpts[0][1]);
        for (int i=0; i<tpts.length; i++) curveVertex(tpts[i][0], tpts[i][1]);
        curveVertex(tpts[tpts.length-1][0], tpts[tpts.length-1][1]);
        endShape();
      }
    }
    ////Draw Bottom Curve
    if (bpts.length>0) {
      stroke(0, 128, 255);
      strokeWeight(5);
      noFill();
      beginShape();
      curveVertex(bpts[0][0], bpts[0][1]);
      for (int i=0; i<bpts.length; i++) curveVertex(bpts[i][0], bpts[i][1]);
      curveVertex(bpts[bpts.length-1][0], bpts[bpts.length-1][1]);
      endShape();
    }
  } //End drw
} //End class