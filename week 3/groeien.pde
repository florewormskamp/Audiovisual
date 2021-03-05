import themidibus.*;

MidiBus myBus;

float theta;
float theta1;
float theta2;

float hoek;
float hoek1;
float hoek2;


float grote;
float grote1;
float grote2;

void setup() {
  size(displayWidth, displayHeight); 
  background(0);

  MidiBus.list();
  myBus = new MidiBus(this, 0, 1); // sketch, input, output
}

void draw() {

  background(0);
  frameRate(30);
  stroke(255);

  float a = hoek;
  float b = hoek1;
  float c = hoek2;

  theta = radians(a);
  theta1 = radians(b);
  theta2 = radians(c);

  pushMatrix();
  translate(width/2, 1000);
  line(0, 0, 0, 0);
  translate(0, 0);
  branch(grote);
  popMatrix();

  pushMatrix();
  translate(width/4, 1000);
  line(0, 0, 0, 0);
  translate(0, 0);
  branch1(grote1);
  popMatrix();

  pushMatrix();
  translate(width/4 * 3, 1000);
  line(0, 0, 0, 0);
  translate(0, 0);
  branch2(grote2);
  popMatrix();
}


void branch(float h) {
  h *= 0.66;

  if (h > 2) {
    pushMatrix();   
    rotate(theta);   
    line(0, 0, 0, -h);  
    translate(0, -h); 
    branch(h);       
    popMatrix();    

    pushMatrix();
    rotate(-theta);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
  }
}

void branch1(float h1) {
  h1 *= 0.66;

  if (h1 > 2) {
    pushMatrix();    
    rotate(theta1);   
    line(0, 0, 0, -h1);  
    translate(0, -h1); 
    branch1(h1);      
    popMatrix();     

    pushMatrix();
    rotate(-theta1);
    line(0, 0, 0, -h1);
    translate(0, -h1);
    branch1(h1);
    popMatrix();
  }
}

void branch2(float h2) {
  h2 *= 0.66;

  if (h2 > 2) {
    pushMatrix();    
    rotate(theta2);  
    line(0, 0, 0, -h2); 
    translate(0, -h2); 
    branch2(h2);      
    popMatrix();    

    pushMatrix();
    rotate(-theta2);
    line(0, 0, 0, -h2);
    translate(0, -h2);
    branch2(h2);
    popMatrix();
  }
}


void controllerChange(int channel, int controllerID, int controllerValue) {
  println();
  println("Controller Change:");
  println("--------");
  println("Channel:"+channel);
  println("controllerID:"+controllerID);
  println("controllerValue:"+controllerValue);

  if (controllerID == 74) {
    hoek = controllerValue ;
    grote = controllerValue * 15;
  }

  if (controllerID == 10) {
    hoek1 = controllerValue ;
    grote1 = controllerValue * 15;
  }

  if (controllerID == 71) {
    hoek2 = controllerValue ;
    grote2 = controllerValue * 15;
  }
}
