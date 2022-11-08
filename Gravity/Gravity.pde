Space space;

void setup(){
  size(640, 360);
  frameRate(3);
  noStroke();
  space = new Space();
}

void draw(){
  space.render();
  space.update();
}

class Space {
  ArrayList<Body> bodies;
  
  Space() {
    bodies = new ArrayList<Body>();
    bodies.add(new Body(50, 100, 1));
    bodies.add(new Body(250, 100, 1));
  }
  
  void render(){
    int i;
    for(i = 0; i < bodies.size(); i++){
      bodies.get(i).display();
    }
  }
  
  void update(){
    int i, j;
    for(i = 0; i < bodies.size(); i++){
      for(j = 0; j < bodies.size(); j++){
        if(j != i){ //<>//
          bodies.get(i).applyGravity(bodies.get(j));
        }
      }
      bodies.get(i).applyVelocity();
    }
  }
}


class Body {
  PVector pos, vel;
  float mass;
  float diameter;
  float G = 0.001;
  
  Body(float x, float y, float mass){
    pos = new PVector(x,y);
    vel = new PVector(0,0);
    this.mass = mass;
    this.diameter = 10;
  }
  
  void display(){
    fill(255);
    print(pos);
    print(vel);
    ellipse(pos.x, pos.y, diameter, diameter);
  }
  
  void applyVelocity(){
    pos.x += vel.x;
    pos.y += vel.y;
  }
  
  void applyGravity(Body other){
     float m1 = this.mass;
     float m2 = other.mass;
     PVector r = this.pos.sub(other.pos);
     PVector f = new PVector(G * (m1 * m2)/ pow(r.x, 2),
                             G * (m1 * m2)/ pow(r.y, 2));
     PVector a = f.div(m1);
     vel.add(a);
  }
}
