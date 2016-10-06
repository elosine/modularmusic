// DECLARE/INITIALIZE CLASS SET
DrwcrvsSet drwcrvsz = new DrwcrvsSet();
/*
 /// PUT IN SETUP ///
 osc.plug(drwcrvsz, "mk", "/mkdrwcrvs");
 osc.plug(drwcrvsz, "rmv", "/rmvdrwcrvs");
 osc.plug(drwcrvsz, "rmvall", "/rmvalldrwcrvs");
 /// PUT IN DRAW ///
 drwcrvsz.drw();
 */

class Drwcrvs {
  // CONSTRUCTOR VARIABLES
  int ix, topbtm;
  String crvname, clrnm;
  // CLASS VARIABLES //
  ////Curve points array
  int[][] pts;
  // CONSTRUCTORS //
  Drwcrvs(int aix, String acrvname, int atopbtm, String aclrnm) {
    ix = aix;
    crvname = acrvname;
    topbtm = atopbtm;
    clrnm = aclrnm;
    ////Initialize empty curve points array
    pts = new int[0][2];
    ////Load Curve
    loadcrv();
  } 

  //  DRAW METHOD //
  void drw() {
    ////Draw Top Curve
    if (!crvmkr.drawon) {
      if (pts.length>0) {
        stroke( clr.get(clrnm) );
        strokeWeight(7);
        noFill();
        beginShape();
        curveVertex(pts[0][0], pts[0][1]);
        for (int i=0; i<pts.length; i++) curveVertex(pts[i][0], pts[i][1]);
        curveVertex(pts[pts.length-1][0], pts[pts.length-1][1]);
        endShape();
      }
    }
  } //End drw

  void loadcrv() {
    if (topbtm == 1) { //bottom
      String[] stemp1 = loadStrings(crvname);
      for (int i=0; i<stemp1.length; i++) {
        String[] stemp2 = split(stemp1[i], ',');
        pts = (int[][])append(pts, new int[] {int(stemp2[0]), int(stemp2[1])+(height/2)+4});
      }//end for
    }//end if
    else {
      String[] stemp1 = loadStrings(crvname);
      for (int i=0; i<stemp1.length; i++) {
        String[] stemp2 = split(stemp1[i], ',');
        pts = (int[][])append(pts, new int[] {int(stemp2[0]), int(stemp2[1])});
      }
    }
  }//end loadcrv
} //End class


////////////////////////////////////////////////////////////
/////////////   CLASS SET     //////////////////////////////
////////////////////////////////////////////////////////////

class DrwcrvsSet {
  ArrayList<Drwcrvs> cset = new ArrayList<Drwcrvs>();

  // Make Instance Method //
  void mk(int ix, String crvname, int topbtm, String clrnm) {
    cset.add( new Drwcrvs(ix, crvname, topbtm, clrnm) );
  } //end mk method

  // Remove Instance Method //
  void rmv(int ix) {
    for (int i=cset.size ()-1; i>=0; i--) {
      Drwcrvs inst = cset.get(i);
      if (inst.ix == ix) {
        cset.remove(i);
        break;
      }
    }
  } //End rmv method

  // Draw Set Method //
  void drw() {
    for (Drwcrvs inst : cset) {
      inst.drw();
    }
  }//end drw method
  //
  //
} // END CLASS SET CLASS