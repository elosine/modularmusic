//MM001 - Melodic Curves
//Justin Yang
import oscP5.*;
import netP5.*;

//Global Variables
////OSC
OscP5 osc;
NetAddress sc;
int ctr, mid;
//Score Window
int sw = 500;
int sh = 500;
int sl, st, sr, sb, sm, sct;
//pitch boxes
int pbt = 0;
int pbb = 0;
PImage tnote;
// end Global Variables

void setup() {
  size(800, 600);
  tnote = loadImage("MMLT_3_001_pngTest.png");
  ctr = round(width/2.0);
  mid = round(height/2.0);
  sl = ctr - round(sw/2.0);
  sr = sl + sw;
  st = mid - round(sh/2.0);
  sb = st + sh;
  ////Initialize OSC
  osc = new OscP5(this, 12321);
  sc = new NetAddress("127.0.0.1", 57120);
  //Cursor
  osc.plug(cursorz, "mk", "/mkcursor");
  osc.plug(cursorz, "rmv", "/rmvcursor");
  osc.plug(cursorz, "rmvall", "/rmvallcursor");
  osc.plug(drwcrvsz, "mk", "/mkdrwcrvs");
  osc.plug(drwcrvsz, "rmv", "/rmvdrwcrvs");
  osc.plug(drwcrvsz, "rmvall", "/rmvalldrwcrvs");
  ////OSC Plugs
  osc.plug(cursorz, "kdat", "/kdat");
  //////Save Curve
  osc.plug(crvmkr, "savecrv", "/savecrv");
  ////// Curve Follower
  osc.plug(crvfollowerz, "mk", "/mkcrvfollower");
  osc.plug(crvfollowerz, "rmv", "/rmvcrvfollower");
  osc.plug(crvfollowerz, "rmvall", "/rmvallcrvfollower");
}//end setup

void draw() {
  background(0);
  ////Bounding Box
  stroke(255);
  strokeWeight(3);
  noFill();
  rect(sl, st, sw, sh);
  ////Dividing Line
  strokeCap(SQUARE);
  stroke(153, 255, 0);
  strokeWeight(8);
  line(sl, mid, sr, mid);
  ////Curve
  crvmkr.drw();
  drwcrvsz.drw();
  ////Cursor
  cursorz.drw();
  //////Curve Follower
  crvfollowerz.drw();
  image(tnote, 50, 50);
} //end draw

void mouseDragged() {
  crvmkr.msdrg();
} //end mouseDragged

void keyPressed() {
  crvmkr.keyprs();
}