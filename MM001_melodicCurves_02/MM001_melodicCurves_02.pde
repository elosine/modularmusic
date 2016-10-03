//MM001 - Melodic Curves
//Justin Yang

import oscP5.*;
import netP5.*;

//Global Variables
////OSC
OscP5 osc;
NetAddress sc;
////Curve points array
int[][] pts;
////Cursor x
float cx = 0.0;
float pcx = 0.0;
int topbtm = 0;
// end Global Variables

void setup() {
  size(500, 500);
  ////Initialize empty curve points array
  pts = new int[0][2];
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
  fill(153,255,0);
  noStroke();
  for(int i=0;i<pts.length;i++) ellipse(pts[i][0], pts[i][1], 4,4);
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
  //if current mouseX/Y is not equal to previous X/Y then add to set
  if (pts.length>0) {
    if (mouseX == pts[pts.length-1][0] && mouseY == pts[pts.length-1][1]);
    else pts = (int[][])append(pts, new int[] {mouseX, mouseY});
  }
  else pts = (int[][])append(pts, new int[] {mouseX, mouseY});
} //end mouseDragged

void keyPressed() {
  if (key=='a') for (int i=0; i<pts.length; i++)printArray(pts[i]);
} //end keyPressed

void kdat(int clknum, float val){
  //Map normalized cursor x from SC to width of staff
  cx = map(val, 0.0, 1.0, 0.0, width);
} //end kdat

