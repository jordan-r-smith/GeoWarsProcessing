class UX 
{
  int score, lives, bombs, multiplier;
  public UX()
  {
    score = 0;
    lives = 3;
    bombs = 3;
  }
  
  public void draw()
  {
    fill(255);
    textSize(30);
    textAlign(CENTER);
    drawLives();
    drawScore();
    drawBombs();
    drawSpawnNumber();
  }
  
  public int getLives()
  {
    return lives;
  }
  
  public int getScore()
  {
    return score;
  }
  
  public int getBombs()
  {
    return bombs;
  }
  
  public void updateLives(int amount)
  {
    lives += amount;
  }

  
  public void updateScore(int amount)
  {
      score += amount * GeoWars.getMultiplier();
  }
  
  public void updateBombs(int amount)
  {
     bombs += amount; 
  }
    
  public void drawLives()
  {
    text("Lives: " + lives, width/5, 50);
  }
  
  public void drawScore()
  {
    text("Score: " + score, width/2, 50);
  }
  
  public void drawBombs()
  {
    text("Bombs: " + bombs, width/5*4, 50);
  }
  
  public void drawSpawnNumber()
  {
    text("Spawn Number: " + spawn.getSpawnNumber(), width/2, height-50);
  }
   
}
