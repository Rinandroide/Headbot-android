import oscP5.*;
import netP5.*;

OscP5 oscP5;

float left_eye = 0;
float right_eye = 0;
float smiling = 0;
float eulerX = 0;
float eulerY = 0;
float eulerZ = 0;

void setup() {
  size(300, 250);
  frameRate(30);
  smooth(8);
  oscP5 = new OscP5(this,3000);
}

void draw(){
  background(0,40,0);
  textSize(25);
  fill(0,255,0);
  text("Left_eye: " + nf(left_eye,0,2),10,30);
  text("Right_eye: " + nf(right_eye,0,2),10,60);
  text("Smiling: " + nf(smiling,0,2),10,90);
  text("EulerX: " + nf(eulerX,0,2),10,120);
  text("EulerY: " + nf(eulerY,0,2),10,150);
  text("EulerZ: " + nf(eulerZ,0,2),10,180);
}

void oscEvent(OscMessage theOscMessage){
  if(theOscMessage.checkAddrPattern("/lefteye")==true){
    if(theOscMessage.checkTypetag("f")){
      //Get left-eye float value ( 0 - 1 );
      left_eye = theOscMessage.get(0).floatValue();
      return;
    }
  }
  if(theOscMessage.checkAddrPattern("/righteye")==true){
    if(theOscMessage.checkTypetag("f")){
      //Get right-eye float value ( 0 - 1 );
      right_eye = theOscMessage.get(0).floatValue();
      return;
    }
  }
  if(theOscMessage.checkAddrPattern("/smile")==true){
    if(theOscMessage.checkTypetag("f")){
      //Get smile float value ( 0 - 1 );
      smiling = theOscMessage.get(0).floatValue();
      return;
    }
  }
  if(theOscMessage.checkAddrPattern("/eulerX")==true){
    if(theOscMessage.checkTypetag("f")){
      //Get head X rotation float value ( -1 - 1 );
      eulerX = theOscMessage.get(0).floatValue();
      return;
    }
  }
  if(theOscMessage.checkAddrPattern("/eulerY")==true){
    if(theOscMessage.checkTypetag("f")){
      //Get head Y rotation float value ( -1 - 1 );
      eulerY = theOscMessage.get(0).floatValue();
      return;
    }
  }
  if(theOscMessage.checkAddrPattern("/eulerZ")==true){
    if(theOscMessage.checkTypetag("f")){
      //Get head Z rotation float value ( -1 - 1 );
      eulerZ = theOscMessage.get(0).floatValue();
      return;
    }
  }
}
