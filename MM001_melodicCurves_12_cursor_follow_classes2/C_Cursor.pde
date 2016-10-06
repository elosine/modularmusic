// DECLARE/INITIALIZE CLASS SET
CursorSet cursorz = new CursorSet();
/*
 /// PUT IN SETUP ///
 osc.plug(cursorz, "mk", "/mkcursor");
 osc.plug(cursorz, "rmv", "/rmvcursor");
 osc.plug(cursorz, "rmvall", "/rmvallcursor");
 /// PUT IN DRAW ///
 cursorz.drw();
 */

class Cursor {
  // CONSTRUCTOR VARIALBES //
  int ix;
  // CLASS VARIABLES //
  float cx = 0.0;
  float pcx = 0.0;
  int topbtm = 0;
  // CONSTRUCTORS //
  Cursor(int aix) {
    ix = aix;
  } //end constructor 1

  //  DRAW METHOD //
  void drw() {
    //////Poll value from SC gets processed through kdat function below
    osc.send("/getkdata", new Object[]{ix}, sc);

    ////// Draw Cursor
    strokeWeight(3);
    stroke(255, 255, 0);
    //////Use variable topbtm to determine which stave the cursor is on
    if (cx <  pcx) topbtm = (topbtm + 1)%2;
    if (topbtm==0) line(cx, 0, cx, (height/2)-4);
    else line(cx, (height/2)+ 4, cx, height );
    pcx = cx;
  } //End drw
  //
}  //End class

////////////////////////////////////////////////////////////
/////////////   CLASS SET     //////////////////////////////
////////////////////////////////////////////////////////////

class CursorSet {
  ArrayList<Cursor> cset = new ArrayList<Cursor>();

  // Make Instance Method //
  void mk(int ix) {
    cset.add( new Cursor(ix) );
  } //end mk method

  // Remove Instance Method //
  void rmv(int ix) {
    for (int i=cset.size ()-1; i>=0; i--) {
      Cursor inst = cset.get(i);
      if (inst.ix == ix) {
        cset.remove(i);
        break;
      }
    }
  } //End rmv method

  // Draw Set Method //
  void drw() {
    for (Cursor inst : cset) {
      inst.drw();
    }
  }//end drw method

  // Get Control Data From SC //
  void kdat(int ix, float val) {
    for (Cursor inst : cset) {
      if (inst.ix==ix) {
        inst.cx = map(val, 0.0, 1.0, 0.0, width);
        break;
      }
    }
  }//end kdat method
  //
  //
} // END CLASS SET CLASS