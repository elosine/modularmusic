//MM001 - Melodic Curves
//Justin Yang

import oscP5.*;
import netP5.*;

//Global Variables
////OSC
OscP5 osc;
NetAddress sc;
////Cursor x
float cx = 0.0;
float pcx = 0.0;
int topbtm = 0;
// end Global Variables

void setup() {
  size(500, 500);
  ////Initialize OSC
  osc = new OscP5(this, 12321);
  sc = new NetAddress("127.0.0.1", 57120);
  ////OSC Plugs
  osc.plug(this, "kdat", "/kdat");
}//end setup

void draw() {
  background(0);
  ////Dividing Line
  stroke(153,255,0);
  strokeWeight(8);
  line(0,height/2,width,height/2);
  ////Curve
  crvmkr.drw();
  ////Cursor
  //////Poll value from SC gets processed through kdat function below
  osc.send("/getkdata", new Object[]{0}, sc);
  ////// Draw Cursor
  strokeWeight(3);
  stroke(255, 255, 0);
  //////Use variable topbtm to determine which stave the cursor is on
  if(cx <  pcx) topbtm = (topbtm + 1)%2;
  if(topbtm==0) line(cx, 0, cx, (height/2)-4);
  else line(cx, (height/2)+ 4, cx, height );
  pcx = cx;
  
} //end draw

void mouseDragged() {
  crvmkr.msdrg();
} //end mouseDragged

void kdat(int clknum, float val){
  //Map normalized cursor x from SC to width of staff
  cx = map(val, 0.0, 1.0, 0.0, width);
} //end kdat