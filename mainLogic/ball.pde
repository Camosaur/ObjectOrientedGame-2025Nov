class Ball {
  //VARIBLES

  //--Physics
  PVector position;
  PVector velocity;
  PVector acceleration;

  //--Other
  int hue;
  boolean isFalling; //Is this ball still in the game?


  Ball(float x, float y) {
    //--Physics
    position = new PVector(x, y);
    velocity = new PVector(random(-1, 1), random(-1, 1));
    acceleration = new PVector(0, random(0.1, 0.3));

    //--Other
    hue = int(random(0, 256));
    isFalling = false;
  }


  void display() {

    colorMode(HSB);
    noStroke();
    push();

    translate(position.x, position.y);

    //If isFalling, reduce brightness
    if (isFalling) {
      fill(hue, 150, 100);
    } else {
      fill(hue, 150, 255);
    }

    //Draw the body
    ellipse(0, 0, 10, 10);

    pop();

    colorMode(RGB);
    stroke(0);
  }

  void update() {
    //Physics
    position.add(velocity);
    velocity.add(acceleration);

    //Bounce! Only if you are in the game
    if (!isFalling) {
      //--X axis
      if (position.x <= 5) {
        velocity.x = 2;
      }
      if (position.x >= width-5) {
        velocity.x = -2;
      }

      //--Y axis
      if (position.y >= height-5) {
        velocity.y = -12;
      }
      if (position.y <= 5) {
        velocity.y = 12;
      }
    }
  }
}
