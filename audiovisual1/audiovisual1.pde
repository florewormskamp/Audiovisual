int scene = 2;

void setup() {
  size(displayWidth, displayHeight, P3D);
  frameRate(60);
  background(0);

  setupSphere();
  setupLights(); 
  setupBoxes();
}

void draw() {
  if (frameCount % 990 == 0) {
    scene = floor(random(3));
  }

  switch (scene) {
  case 0:
    drawSphere();
    break;
  case 1:
    drawLights();
    break;
  case 2:
    drawBoxes();
    break;
  }
}
