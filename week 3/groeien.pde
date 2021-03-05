import themidibus.*;

MidiBus myBus;

 float theta;
 float hoek;
void setup(){
 size(displayWidth, displayHeight); 
 background(0);
 
MidiBus.list();
  myBus = new MidiBus(this, 0, 1); // sketch, input, output
}

void draw(){

  background(0);
  frameRate(30);
  stroke(255);
  // Let's pick an angle 0 to 90 degrees based on the mouse position
  float a = hoek;
  // Convert it to radians
  theta = radians(a);
  // Start the tree from the bottom of the screen
  translate(width/2, 1000);
  // Draw a line 120 pixels
  line(0,0,0,-120);
  // Move to the end of that line
  translate(0,-120);
  // Start the recursive branching!
  branch(400);
 
 
 
}


void branch(float h) {
  // Each branch will be 2/3rds the size of the previous one
  h *= 0.66;
  
  // All recursive functions must have an exit condition!!!!
  // Here, ours is when the length of the branch is 2 pixels or less
  if (h > 2) {
    pushMatrix();    // Save the current state of transformation (i.e. where are we now)
    rotate(theta);   // Rotate by theta
    line(0, 0, 0, -h);  // Draw the branch
    translate(0, -h); // Move to the end of the branch
    branch(h);       // Ok, now call myself to draw two new branches!!
    popMatrix();     // Whenever we get back here, we "pop" in order to restore the previous matrix state
    
    // Repeat the same thing, only branch off to the "left" this time!
    pushMatrix();
    rotate(-theta);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
  }
}


void controllerChange(int channel, int controllerID, int controllerValue) {
  // Receive a controllerChange
  println();
  println("Controller Change:");
  println("--------");
  println("Channel:"+channel);
  println("controllerID:"+controllerID);
  println("controllerValue:"+controllerValue);
  
  if (controllerID == 10) {
    // It's the first controller
    hoek = controllerValue ;
  //} else if (controllerID == 74) {
  //  // It's the second controller
  //  ellipseSize = controllerValue * 10;
  }
}
