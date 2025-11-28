// Main logic for my game about bouncing. Help the king of the bouncy castle save the kingdom from the evil black holes!


//DELCARE VARIABLES

//--Game State
boolean isGameOver = true;
boolean isFirstGame = true;

//--TODO put these in a designated EnemyManager Object. It seems better that way
int enemiesKIlled;
ArrayList enemyList;

//--TODO Referance Variables
//Player player;
//BallManager ballMan;
//EnemyManager enemyMan;

void setup(){
  size(1000, 800);
  background(255);
  frameRate(60);
  
  //-- TODO Instantiate objects HERE
}

void draw(){
  background(255);
  
  //What state are we in?
  if (isGameOver){
    gameOverScreen();
  }
  else{
    gameDraw();
  }

}

void gameOverScreen(){
  //DRAW THE GAME OVER SCREEN
  
  //--In order to stop irrelevent information from appearing before the user has played the game
 textSize(width*0.05);
 textAlign(CENTER);
 fill(0);
    
  if(!isFirstGame){
    text("Game Over! You killed CHANGE THIS enemies!", width/2, height*0.25);
  }
  
  //--Next Text Call
  text("Click the mouse to PLAY!", width/2, height*0.75);
  
}

void gameDraw(){

}

void mousePressed(){
  if(isGameOver){
    startGame();
    return;
  }

}

void startGame(){
  //Does all the nessisary steps to start the game
  isGameOver = false;
  isFirstGame = false;
  
}
