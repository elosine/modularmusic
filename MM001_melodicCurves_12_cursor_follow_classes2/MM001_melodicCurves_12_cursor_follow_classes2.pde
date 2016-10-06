//MM001 - Melodic Curves
//Justin Yang
import oscP5.*;
import netP5.*;

//Global Variables
////OSC
OscP5 osc;
NetAddress sc;
// end Global Variables

void setup() {
  size(500, 500);
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
  ////Dividing Line
  stroke(153, 255, 0);
  strokeWeight(8);
  line(0, height/2, width, height/2);
  ////Curve
  crvmkr.drw();
  drwcrvsz.drw();
  ////Cursor
  cursorz.drw();
  //////Curve Follower
  crvfollowerz.drw();
} //end draw

void mouseDragged() {
  crvmkr.msdrg();
} //end mouseDragged

void keyPressed() {
  crvmkr.keyprs();
}