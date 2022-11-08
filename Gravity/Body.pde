class Body {
  PVector pos, vel;
  float mass;
  float radius;
  float G = 1000;
  
  Body(float x, float y, float mass, float radius){
    pos = new PVector(x,y);
    vel = new PVector(0,0);
    this.mass = mass;
    this.radius = radius;
  }
  
  void display(){
    fill(255);
    ellipse(pos.x, pos.y, radius * 2, radius * 2);
  }
  
  void updatePos(){
    pos.add(vel);
  }
  
  PVector accelOfGravityFrom(Body other){
     float m1 = this.mass;
     float m2 = other.mass;
     PVector r = PVector.sub(other.pos, this.pos);
     float fp = G * (m1 * m2)/ r.magSq();
     float ap = fp / m1;
     PVector a = PVector.mult(r.normalize(), ap);
     return a;
  }
  
  boolean isCollidingWith(Body other){
    PVector r = PVector.sub(other.pos, this.pos);
    if (r.mag() <= this.radius + other.radius){
      return true;
    }
    else{
      return false;
    }
  }
  
  Body combine(Body other){
     float mass = this.mass + other.mass;
     float radius = (float)Math.sqrt(pow(this.radius, 2) + pow(other.radius, 2));
     float xPos = (other.pos.x + this.pos.x) / 2;
     float yPos = (other.pos.y + this.pos.y) / 2;
    
    return new Body(xPos, yPos, mass, radius);
  }
}
