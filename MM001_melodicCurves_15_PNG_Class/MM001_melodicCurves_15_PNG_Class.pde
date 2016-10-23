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
  size(680, 510);
  tnote = loadImage("Snippet_template.png");
  ctr = round(width/2.0);
  mid = round(height/2.0);
  sl = width - 5 - sw;
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
  stroke(255);
  strokeWeight(4);
  line(sl, mid, sr, mid);
  ////Curve
  crvmkr.drw();
  drwcrvsz.drw();
  ////Cursor
  cursorz.drw();
  //////Curve Follower
  crvfollowerz.drw();
  //Pitch Set PNG
  noStroke();
  fill(153,255,0);
  rect(5, st, 165, 80);
  rect(5, st+(82*1), 165, 80);
  rect(5, st+(82*2), 165, 80);
  image(tnote, -23, st, 200, 80);
  image(tnote, -23, st+(82*1), 200, 80);
  image(tnote, -23, st+(82*2), 200, 80);
} //end draw

void mouseDragged() {
  crvmkr.msdrg();
} //end mouseDragged

void keyPressed() {
  crvmkr.keyprs();
}