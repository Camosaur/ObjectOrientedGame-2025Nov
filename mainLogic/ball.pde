class Ball {
  //VARIBLES

  //--Physics
  PVector position;
  PVector velocity;
  PVector acceleration;

  //--Other
  int hue;
  boolean isFalling; //Is this ball still in the game?


  Ball() {
    //--Physics
    position = new PVector(width/2, height/2);
    velocity = new PVector(random(-1, 1), random(-1, 1));
    acceleration = new PVector(0, 0.2);

    //--Other
    hue = int(random(0, 256));
    isFalling = false;
  }


  void display() {

    colorMode(HSB);

    push();

    translate(position.x, position.y);

    //If isFalling, reduce brightness
    if (isFalling) {
      fill(hue, 255, 100);
    } else {
      fill(hue, 255, 255);
    }

    //Draw the body
    ellipse(0, 0, 10, 10);

    pop();

    colorMode(RGB);
  }

  void update() {
    //Physics
    position.add(velocity);
    velocity.add(acceleration);

    //Bounce! Only if you are in the game
    if (!isFalling) {
      //--X axis
      if (position.x >= width-5 || position.x <= 5) {
        velocity.x *= -1;
      }

      //--Y axis
      if (position.y >= height-5 || position.y <= 5) {
        velocity.y *= -1;
      }
    }
  }
}
