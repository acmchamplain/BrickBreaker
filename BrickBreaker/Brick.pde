class Brick extends Collider{
  Brick() {
    size = new PVector(10, 10);
    pos = new PVector(120, 140);
  }
  
  void display() {
    rect(pos.x, pos.y, size.x, size.y);
  }
  
}
