class Paddle extends Collider{
  Paddle() {
    size = new PVector(60, 10);
    pos = new PVector(320, 330);
  }
  
  void update() {
    pos.x = mouseX - 30;
  }
  
  void display() {
    rect(pos.x, pos.y, size.x, size.y);
  }
  
}
