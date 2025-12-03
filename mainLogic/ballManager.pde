class BallManager {

  //Variables 
  
  ArrayList<Ball> balls;
  boolean isAlive; //checks weather the player is alive based on how many balls are left

  BallManager() {

    balls = new ArrayList<Ball>();
    
    startGame();
  }

  void update() {

    isAlive = false; //Set is alive to false, to start

    //Iterate through all the balls
    for (int i = balls.size()-1; i > -1; i--) {
      Ball ball = balls.get(i); //Get the ball at that index

      //Update and Display
      ball.update();
      ball.display();

      //If this ball !isFalling, set isAlive to true. This is because there is at least one ball still left for the health pool
      if (!ball.isFalling) {
        isAlive = true;
      }

      //If it's below the screen, remove it from the list
      if (ball.position.y >= height+20) {
        balls.remove(i);
      }
    }
  }

  void spawn(PVector position) {
    balls.add(new Ball(position.x, position.y));
  }

  void startGame() {
    for (int iteration = 1; iteration <= 200; iteration++) {
      spawn(new PVector(random(0, width), random(0, height)));
    }
  }
  
  void enemyDeath(PVector position){
    for (int iteration = 1; iteration <= 10; iteration++) {
      spawn(position);
    }
  }

  void hurt() {
    int hurtCount = 50; //This is how much balls will be downed when the player is hit
    for (Ball ball : balls) {
      hurtCount--;
      ball.isFalling = true;
      if (hurtCount <= 0) {
        break;
      }
    }
  }
}
