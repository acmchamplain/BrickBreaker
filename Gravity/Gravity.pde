Space space;
float framesPressed;
PVector mouseVel;
PVector lastMousePos;
ArrayList<PVector> MousePositionQueue;
float G = 0.1;
float DENSITY = 1;

void setup(){
  MousePositionQueue = new ArrayList();
  for (int i = 0; i < 10; i++ ){
    MousePositionQueue.add(new PVector(0, 0));
  }
  
  size(1280, 720);
  frameRate(60);
  noStroke();
  space = new Space();
}

void keyPressed() {
  if (key == 'g') {
      space.obliterate();
    }
}

void draw(){
  background(55);
  space.render();
  space.update();
  if (mousePressed) {
    mouseVel = PVector.sub(getMousePos(), MousePositionQueue.get(9));
    ellipse(mouseX, mouseY, framesPressed, framesPressed);
    framesPressed++;
  } //<>//
  MousePositionQueue.remove(0);
  MousePositionQueue.add(new PVector(mouseX, mouseY));
}

PVector getMousePos(){
  return new PVector(mouseX, mouseY);
}

void mousePressed(){
  framesPressed = 0;
}

void mouseReleased(){
  PVector vel = PVector.mult(mouseVel, 0.3);
  float radius = framesPressed / 2;
  float mass = (float)Math.PI * pow(radius, 2) * DENSITY;
  space.placeBody(mouseX, mouseY, mass, radius, vel);
}
