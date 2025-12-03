// Main logic for my game about bouncing. Help the king of the bouncy castle save the kingdom from the evil black holes!
//By Cameron Pletsch
//Coded on December 3rd, 2025


//DELCARE VARIABLES

//--Game State
boolean isGameOver = true;
boolean isFirstGame = true;

//--TODO Referance Variables
Player player;
BallManager ballMan;
EnemyManager enemyMan;


void setup() {
  windowTitle("King of the Bouncy Castle");
  size(1000, 800);
  background(255);
  frameRate(60);

  //-- TODO Instantiate objects HERE
  player = new Player();
  ballMan = new BallManager();
}

void draw() {
  background(255);

  //Ball Stuff- I want to display the balls no matter what
  ballMan.update();
  
  //What state are we in?
  if (isGameOver) {
    gameOverScreen();
  } else {
    gameDraw();
  }
}

void gameOverScreen() {
  //DRAW THE GAME OVER SCREEN

  //Make sure the frameRate is 60
  frameRate(60);
  
  //--In order to stop irrelevent information from appearing before the user has played the game
  textSize(width*0.05);
  textAlign(CENTER);
  fill(0);

  if (!isFirstGame) {
    text("Game Over! You killed "+ enemyMan.enemiesKilled +" enemies!", width/2, height*0.25);
  }

  //--Next Text Call
  text("Click the mouse to PLAY!", width/2, height*0.75);
}

void gameDraw() {

  //Enemy Stuff
  enemyMan.update();

  //Player stuff
  player.update();
  player.display();
  
  //Check if we are dead!!!!
  isGameOver = !ballMan.isAlive;
}

void mousePressed() {
  if (isGameOver) {
    startGame();
    return;
  }

  //Slow down framerate so player may aim
  frameRate(30);
}

void mouseReleased() {
  //Restore framerate and make the player dash
  if (player.canDash()) {
    player.dash();
  }
  frameRate(60+enemyMan.enemiesKilled); //Add a bit to the framerate to scale with enemiesKilled. This is my jank attempt to increase difficulty as the game goes on.
}

void startGame() {
  //Does all the nessisary steps to start the game
  isGameOver = false;
  isFirstGame = false;

  //---Instantiate new objects
  ballMan = new BallManager();
  player = new Player();
  enemyMan = new EnemyManager(player, ballMan);
}
