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
PGraphics pg;
PImage img;

// end Global Variables

void setup() {
  size(500, 500);
  pg = createGraphics( 500, 246 );
  img = loadImage("test.png");
  ////Initialize OSC
  osc = new OscP5(this, 12321);
  sc = new NetAddress("127.0.0.1", 57120);
  ////OSC Plugs
  osc.plug(this, "kdat", "/kdat");
  //////Save Curve
  osc.plug(this, "savecrv", "/savecrv");
  //////Load Curve
  osc.plug(this, "loadcrv", "/loadcrv");
}//end setup

void draw() {
  background(0);
  ////Dividing Line
  stroke(153, 255, 0);
  strokeWeight(8);
  line(0, height/2, width, height/2);
  ////Curve
  crvmkr.drw();
  drwcrvs.drw();
  ////Cursor
  //////Poll value from SC gets processed through kdat function below
  osc.send("/getkdata", new Object[]{0}, sc);
  ////// Draw Cursor
  strokeWeight(3);
  stroke(255, 255, 0);
  //////Use variable topbtm to determine which stave the cursor is on
  if (cx <  pcx) topbtm = (topbtm + 1)%2;
  if (topbtm==0) line(cx, 0, cx, (height/2)-4);
  else line(cx, (height/2)+ 4, cx, height );
  pcx = cx;

  //image(img, 0, (height/2)+4);
} //end draw

void mouseDragged() {
  crvmkr.msdrg();
} //end mouseDragged

void keyPressed() {
  if (key=='a') crvmkr.render();
  if (key=='d') crvmkr.drawon = true;
  if (key=='f') crvmkr.drawon = false;
}

void kdat(int clknum, float val) {
  //Map normalized cursor x from SC to width of staff
  cx = map(val, 0.0, 1.0, 0.0, width);
} //end kdat

void savecrv(String name) {
  String[] strtemp = new String[crvmkr.pts.length];
  for (int i=0; i<crvmkr.pts.length; i++) {
    strtemp[i] = str(crvmkr.pts[i][0]) + ',' +  str(crvmkr.pts[i][1]);
  }
  saveStrings(name, strtemp);
}

void loadcrv(String name, int tpbtm) {
  if (tpbtm == 1) { //bottom
    String[] stemp1 = loadStrings(name);
    for (int i=0; i<stemp1.length; i++) {
      String[] stemp2 = split(stemp1[i], ',');
      drwcrvs.bpts = (int[][])append(drwcrvs.bpts, new int[] {int(stemp2[0]), int(stemp2[1])+(height/2)+4});
    }//end for
    for (int i=0; i<stemp1.length; i++) printArray(drwcrvs.bpts[i]);
  }//end if
  else {
    String[] stemp1 = loadStrings(name);
    for (int i=0; i<stemp1.length; i++) {
      String[] stemp2 = split(stemp1[i], ',');
      drwcrvs.tpts = (int[][])append(drwcrvs.tpts, new int[] {int(stemp2[0]), int(stemp2[1])});
    }
  }
}//end loadcrv