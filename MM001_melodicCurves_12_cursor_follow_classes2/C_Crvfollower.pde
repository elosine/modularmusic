// DECLARE/INITIALIZE CLASS SET
CrvfollowerSet crvfollowerz = new CrvfollowerSet();

/*
 /// PUT IN SETUP ///
 osc.plug(crvfollowerz, "mk", "/mkcrvfollower");
 osc.plug(crvfollowerz, "rmv", "/rmvcrvfollower");
 osc.plug(crvfollowerz, "rmvall", "/rmvallcrvfollower");
 /// PUT IN DRAW ///
 crvfollowerz.drw();
 */

class Crvfollower {

  // CONSTRUCTOR VARIALBES //
  int ix, csrix, crvix;
  // CLASS VARIABLES //
  float cyx = -100;
  Cursor csr;
  Drwcrvs crv;
  // CONSTRUCTORS //
  Crvfollower(int aix, int acsrix, int acrvix) {
    ix = aix;
    csrix = acsrix;
    crvix = acrvix;
    for (Cursor instcsr : cursorz.cset) {
      if (instcsr.ix == csrix) csr = instcsr;
    }
    for (Drwcrvs instcrv : drwcrvsz.cset) {
      if (instcrv.ix == crvix) crv = instcrv;
    }
  } //end constructor 1

  //  DRAW METHOD //
  void drw() {
    for (int i=0; i<crv.pts.length-1; i++) {
      if (csr.cx<=crv.pts[i+1][0] && csr.cx >=crv.pts[i][0]) {
        cyx = crv.pts[i][1] - ((crv.pts[i+1][1] - crv.pts[i][1])/2.0);
        break;
      }
    }

    noFill();
    strokeWeight(3);
    stroke(255, 0, 255);
    ellipse(csr.cx, cyx, 15, 15);
  } //End drw
  //
  //
}  //End class

////////////////////////////////////////////////////////////
/////////////   CLASS SET     //////////////////////////////
////////////////////////////////////////////////////////////

class CrvfollowerSet {
  ArrayList<Crvfollower> cset = new ArrayList<Crvfollower>();

  // Make Instance Method //
  void mk(int ix, int csrix, int crvix) {
    cset.add( new Crvfollower(ix, csrix, crvix) );
} //end mk method

  // Remove Instance Method //
  void rmv(int ix) {
    for (int i=cset.size ()-1; i>=0; i--) {
      Crvfollower inst = cset.get(i);
      if (inst.ix == ix) {
        cset.remove(i);
        break;
      }
    }
  } //End rmv method

  // Draw Set Method //
  void drw() {
    for (Crvfollower inst : cset) inst.drw();
  }//end drw method
  //
  //
} // END CLASS SET CLASS