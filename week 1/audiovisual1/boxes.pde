float x = width / 2;
float y = height / 2;
float z = random(200);

float r1 = 255;
float g1 = 0;
float b1 = 127;


void setupBoxes() {
  background(0);
}

void drawBoxes() {
  float size = 50;
  float speed = 100;
  
//lights();
  fill(255);
  noStroke();

  pushMatrix();
  translate(x, y, z);
  pointLight(r1, g1, b1, x, y, z);
  sphere(size);
  popMatrix();

  x = x + random(-speed, speed);
  y = y + random(-speed, speed);
  z = z + random(-speed, speed);
  
  if (x > width) {
    x = 0;
  } else if (x < 0) {
    x = width;
  }
  
  if (y > height) {
    y = 0;
  } else if (y < 0) {
    y = height;
  }
  
}
