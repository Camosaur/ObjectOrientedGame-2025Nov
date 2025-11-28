class Player {

  //VARIBLES
  
  //--Physics
  PVector position;
  PVector velocity;
  PVector acceleration;
  
  //--Dash UI Display
  int rotationAngle;
  boolean isDashing;
  
  //--Dash Timer
  int maxDashCooldown; //The maxiumum value for the dash cooldown
  int dashCount; //How many more frames until the player may dash again

  
Player(){
  //--Physics
  position = new PVector(width/2, height/2);
  velocity = new PVector();
  acceleration = new PVector(0, 0.5);
  
  //--Dash UI Display
  rotationAngle = 90;
  isDashing = false;
  
  //--Dash Timer
  maxDashCooldown = 60*2; //2 Seconds?
}

void display(){
  push();
  
  translate(position.x, position.y);
  
  //Body
  fill(255, 0, 0);
  ellipse(0, 0, 60, 60);
  
  //Crown
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
  
  
  pop();
}

void update(){
  
  //Physics
  position.add(velocity);
  velocity.add(acceleration);
  
  //Bounce!
  
  //--X axis
  if (position.x >= width || position.x <= 0){
    velocity.x *= -0.9;
  }
  
  //--Y axis
  if (position.y >= height || position.y <= 0){
    velocity.y *= -0.9;
  }
  

}

void dash(){

}

}
