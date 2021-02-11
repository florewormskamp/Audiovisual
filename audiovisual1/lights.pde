int lightsC = 6;

ArrayList <Float> startLocations = new ArrayList<Float>();
ArrayList <Float> endLocations = new ArrayList<Float>();

float r = random(255);
float g = random(255);
float b = random(255);

void setupLights() {

  for (int i = 0; i < lightsC; i++) {
    startLocations.add(random(50, width - 50));
    endLocations.add(random(50, width - 50));
  }
}


void drawLights() {
  colorMode(RGB, 255, 255, 255);

  if (frameCount % 60 == 0) {
    startLocations.clear();
    startLocations.addAll(endLocations);
    endLocations.clear();

    for (int i = 0; i < lightsC; i++) {
      endLocations.add(random(50, width - 50));
    }
  }

  background(0);
  //lights();
  fill(255);
  noStroke();

  //if (frameCount == 120) {
  //  r = random(255);
  //  g = random(255);
  //  b = random(255);
  //  frameCount = 0;
  //}

  float time = (float) (frameCount % 120) / 120;

  time = 0.5 - (cos(PI * time) / 2);

  for (int i = 0; i < lightsC; i++) {
    float start = startLocations.get(i);
    float end = endLocations.get(i);

    float location = lerp(start, end, time);

    pushMatrix();
    translate(location, height / 2);
    sphere(100);
    popMatrix();

    pushMatrix();
    pointLight(r, g, b, location - 10, height / 2, -200);
    popMatrix();

    if (time == 0) {
      r = random(255);
      g = random(255);
      b = random(255);
    }
  }
}
