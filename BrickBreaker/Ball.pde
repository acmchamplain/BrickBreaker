

class Ball {
  PVector pos, vel;
  int rad;
  Ball(){
    pos = new PVector(320, 340);
    vel = new PVector(random(-1, 1), -1);
    rad = 5;
  }
  
  Ball(int x, int y, float speed){
    pos = new PVector(x, y);
    vel = new PVector(random(-1,1)*speed, speed);
    rad = 5;
  }
  
  void update(){
    pos.add(vel);
    
    if (pos.x > width-rad || pos.x < rad){
     collide(Direction.VERTICAL); 
    }
    if (pos.y > height-rad || pos.y < rad){
     collide(Direction.HORIZONTAL); 
    }
  }
  
  void display(){
    ellipse(pos.x, pos.y, rad*2, rad*2);
  }
  
  void collide(Direction dir){
    if (dir == Direction.HORIZONTAL){
     vel.y *= -1; 
    }
    else{
     vel.x *= -1;
    }
  }
  
}
