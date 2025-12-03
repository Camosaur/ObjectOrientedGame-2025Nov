class EnemyManager {

  int enemiesKilled; //My version of a high score
  ArrayList<Enemy> enemies;
  Player player; //A reference to the player. So the enemies know if it was dashing on collision
  BallManager ballMan; //A reference to BallManager, as enemies are the main thing that interacts with it  
  int enemySpawnCountdown; //How many frames until a new enemy spawns

  EnemyManager(Player player, BallManager ballMan) {
    enemies = new ArrayList<Enemy>();
    this.player = player; //I'm allowed to do this, right? It's a part of this language...
    this.ballMan = ballMan; //I didn't want the parameters to have a different name, ok?
  }

  void update() {
    //Iterate through all the balls
    for (int i = enemies.size()-1; i > -1; i--) {
      
      //Get the enemy at that index
      Enemy enemy = enemies.get(i);

      //Update and Display
      enemy.update();
      enemy.display();
      
      //If it's dead, remove it from the list
      if (enemy.isDead) {
        if(enemy.wasKilled){
          enemiesKilled++; //Keep a kill count to use as a highscore
        }
        enemies.remove(i);
      }
    }
    
    //Add a new enemy every few seconds
    enemySpawnCountdown--;
    if (enemySpawnCountdown <= 0 ){
      enemies.add(new Enemy(player, ballMan));
      enemySpawnCountdown = int(random(60*2, 60*5));
    }
    
  }
  
  
}
