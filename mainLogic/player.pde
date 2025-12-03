class Player {

  //VARIBLES
  
  //--Physics
  PVector position;
  PVector velocity;
  PVector acceleration;
  
  //--Dash UI Display
  float rotationAngle;
  boolean isDashing;
  int bounces; //Bounces since the last dash. Used to determine when to set isDashing back to false
  int maxBounces = 3; //The number of bounces you can do before going red again
  
  //--Dash Timer
  int maxDashCooldown; //The maxiumum value for the dash cooldown
  int dashCount; //How many more frames until the player may dash again

  
Player(){
  //--Physics
  position = new PVector(width/2, height/2);
  velocity = new PVector(1, 0);
  acceleration = new PVector(0, 0.2);
  
  //--Dash UI Display
  rotationAngle = radians(90);
  isDashing = false;
  
  //--Dash Timer
  maxDashCooldown = 60*2; //2 Seconds?
  dashCount = maxDashCooldown;
}

void display(){
  push();
  
  translate(position.x, position.y);
  rotate(rotationAngle);
  
  //Body- Red if not dashing, Green if Dashing
  if(isDashing){
  fill(0, 255, 0);
  }
  else{
  fill(255, 0, 0);
  }
  ellipse(0, 0, 60, 60);
  
  //Crown
  if(canDash()){
    drawCrown();
  }
  
  pop();
}

void update(){
  
  //Physics
  position.add(velocity);
  velocity.add(acceleration);
  
  //Bounce!
  
  //--X axis
  if (position.x >= width-30 || position.x <= 30){
    velocity.x *= -1;
    bounces++;
  }
  
  //--Y axis
  if (position.y >= height-30 || position.y <= 30){
    velocity.y *= -1;
    bounces++;
  }
  
  //Set isDahsing to false after maxBounces
  if (bounces >= maxBounces){
    isDashing = false;
  }
  
  //Countdown the cooldown
  dashCount--;
  
  //Update Rotation
  rotationAngle = atan2(mouseY-position.y, mouseX-position.x);


}

void dash(){
  //Go flying in the rotationAngle
  velocity = PVector.fromAngle(rotationAngle).setMag(15);
  
  //Reset the cooldown
  dashCount = maxDashCooldown;
  
  //Set isDashing to true so that you can kill enemies
  isDashing = true;
  bounces = 0;
}

boolean canDash(){
  //Returns if the player is curretly able to dash, according to the cooldown
  return dashCount <= 0;
}

void drawCrown(){
  //Draws the golden crown
  fill(#FFE51F);
  beginShape();
  
  vertex(30, 0);
  
  vertex(30, 10);
  
  vertex(40, 10);
  
  vertex(35, 5);
  
  vertex(40, 0);
  
  vertex(35, -5);
  
  vertex(40, -10);
  
  vertex(30, -10);
  
  vertex(30, 0);
  
  endShape();
}

}
