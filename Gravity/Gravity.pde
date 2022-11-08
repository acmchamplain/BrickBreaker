Space space;
float framesPressed;

void setup(){
  size(640, 360);
  frameRate(60);
  noStroke();
  space = new Space();
}

void draw(){
  background(55);
  space.render();
  space.update();
  if (mousePressed) {
    ellipse(mouseX, mouseY, framesPressed, framesPressed);
    framesPressed++;
  }
}

void mousePressed(){
  framesPressed = 0;
}

void mouseReleased(){
  space.placeBody(mouseX, mouseY, 1, framesPressed / 2);
}
