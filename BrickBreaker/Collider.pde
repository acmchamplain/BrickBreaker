class Collider {
  PVector pos, size, vel;
  
  void actOnCollide(Ball ball) {
    float deltaX = abs(ball.pos.x - (pos.x + size.x / 2));
    //float deltaX = abs(ball.pos.x - pos.x);
    //float deltaY = abs(ball.pos.y - pos.y);
    float deltaY = abs(ball.pos.y - pos.y);
    
    
    if (deltaY < (ball.rad + size.y / 2)) {
      if (deltaX < (ball.rad + size.x / 2)) {
        ball.collide(Direction.HORIZONTAL);
        
      }
    }
    
    else if (deltaX < (ball.rad + size.x / 2)) {
      if (deltaY < (ball.rad + size.y / 2)) {
        ball.collide(Direction.VERTICAL);
      }
    }
   
    
  //  if (xCollision) {
  //    if (yCollision) {
  //      ball.collide(Direction.VERTICAL);
  //      yCollision = false;
  //    }
  //    ball.collide(Direction.HORIZONTAL);
  //  }
  //  ;
  //  ball.collide(Direction.VERTICAL);
  }
  
}
