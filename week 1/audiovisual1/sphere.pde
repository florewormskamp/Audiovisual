float size = 900;
float size2 = 900;

void setupSphere() {

}

void drawSphere() {
  int segX = 30;
  int segY = 30;
  
  pushMatrix();
  translate(width / 4, height / 2);
  sphereDetail(segX, 200);
  fill(0);
  stroke(255, 0, 127);
  sphere(size);
  popMatrix();

  pushMatrix();
  translate(width /4 * 3, height / 2);
  sphereDetail(segY, 200);
  sphere(size2); 
  popMatrix();
  

  if (segX < 200) {
    segX += 2;
    size -=  2;

  } 

  if (segY < 200) {
    segY += 2;
    size2 -= 2;
  }
  
 
} 
