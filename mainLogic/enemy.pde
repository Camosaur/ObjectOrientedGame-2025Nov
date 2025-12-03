class Enemy {

  //VARIBLES
  PVector position;
  int graceCountdown = 60*3; // How long it will be harmless. To alert the player it's there. 3 seconds?
  Player player; //A reference to the player. So they know if it was dashing on collision
  BallManager ballMan; //A reference to BallManager, as enemies are the main thing that interacts with it
  boolean isDead; //So it can mark itself as dead, and main logic can delete it's instance
  int diameter; //So it can keep growing
  int sizeGrowthTimer = 10; //So I can make it get 2 pixels wider fraction of a second
  int sizeGrowthCountdown = 10;

  Enemy(Player player, BallManager ballMan) {
    position = new PVector(random(0, width), random(0, height));
    diameter = 60;
    this.player = player; //I'm allowed to do this, right? It's a part of this language...
    this.ballMan = ballMan; //I didn't want the parameters to have a different name, ok?
  }

  void display() {

    //Be black, but semi-transperant if it's still the grace period
    if (graceCountdown > 0) {
      fill(0, 0, 0, 100);
    } else {
      fill(0);
    }

    //Draw the body
    noStroke();
    ellipse(position.x, position.y, diameter, diameter);
    stroke(0);
  }

  void update() {

    graceCountdown--; //Count how long it's been since this enemy spawned

    if (graceCountdown >0) {
      return;
    } //Only do everything else once this enemy is fully spawned

    //Grow every few frames
    sizeGrowthCountdown--;
    if (sizeGrowthCountdown <= 0) {
      sizeGrowthCountdown = sizeGrowthTimer;
      diameter++;
    }

    //Handle collision
    if (dist(player.position.x, player.position.y, position.x, position.y) <= diameter/2) { //If you are colliding with the player...
      collision(player.isDashing);
    }
  }

  void collision(boolean isDashing) {
    
    //Mark yourself to be DELETED :(
    isDead = true;
    
    //Give or take away balls from the players health pool
    if(!isDashing){
      ballMan.hurt();
    }
    else{
      ballMan.enemyDeath(position);
    }
  }
}
