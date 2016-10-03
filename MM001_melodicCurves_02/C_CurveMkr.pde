// DECLARE/INITIALIZE CLASS SET
NewclassSet newclassz = new NewclassSet();

/**
 *
 *
 /// PUT IN SETUP ///
 meosc.plug(newclassz, "mk", "/mknewclass");
 meosc.plug(newclassz, "rmv", "/rmvnewclass");
 meosc.plug(newclassz, "rmvall", "/rmvallnewclass");
 
 /// PUT IN DRAW ///
 newclassz.drw();
 *
 *
 */


class Newclass {

  // CONSTRUCTOR VARIALBES //
int ix;
  // CLASS VARIABLES //

  // CONSTRUCTORS //

  /// Constructor 1 ///
  Newclass(int aix) {
    ix = aix;
  } //end constructor 1

  //  DRAW METHOD //
  void drw() {
  } //End drw
  //
  //
}  //End class

////////////////////////////////////////////////////////////
/////////////   CLASS SET     //////////////////////////////
////////////////////////////////////////////////////////////

class NewclassSet {
  ArrayList<Newclass> cset = new ArrayList<Newclass>();

  // Make Instance Method //
  void mk(int ix) {
    cset.add( new Newclass(ix) );
  } //end mk method

  // Remove Instance Method //
  void rmv(int ix) {
    for (int i=cset.size ()-1; i>=0; i--) {
      Newclass inst = cset.get(i);
      if (inst.ix == ix) {
        cset.remove(i);
        break;
      }
    }
  } //End rmv method

  // Remove All Method //
  void rmvall() {
    cset.clear();
  } //End rmvall method

  // Draw Set Method //
  void drw() {
    for (int i=cset.size ()-1; i>=0; i--) {
      Newclass inst = cset.get(i);
      inst.drw();
    }
  }//end drw method
  //
  //
} // END CLASS SET CLASS







