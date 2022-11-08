
ArrayList<Ball> balls;
Paddle paddle;

void setup() {
  size(640, 360);
  noStroke();
  balls = new ArrayList<Ball>();
  for(int i = 0; i < 1; i++){
    balls.add(new Ball(320, 340, 4));
  }
  paddle = new Paddle();
}

void draw() {
  background(102);
  for(int i = 0; i < balls.size(); i++){
    balls.get(i).update();
    balls.get(i).display();
    paddle.actOnCollide(balls.get(i));
  }
  
  
  paddle.update();
  paddle.display();
}
