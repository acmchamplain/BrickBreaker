class Space {
  ArrayList<Body> bodies;
  
  Space() {
    bodies = new ArrayList<Body>();
  }
  
  void obliterate() {
   bodies.clear(); 
  }
  
  void placeBody(float x, float y, float mass, float radius, PVector velocity){
    bodies.add(new Body(x, y, mass, radius, velocity));
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
         if(i != j){
           Body b1 = bodies.get(i);
           Body b2 = bodies.get(j);
           if(b1.isCollidingWith(b2)){
             Body b3 = b1.combine(b2);
             bodies.add(b3);
             bodies.remove(b1);
             bodies.remove(b2);
           }
           else{
             b1.vel.add(b1.accelOfGravityFrom(b2));
           }
         }
       }
     }
     
    for(i = 0; i < bodies.size(); i++){
      bodies.get(i).updatePos();
    }
  }
}
