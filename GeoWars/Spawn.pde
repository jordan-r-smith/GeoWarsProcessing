class Spawn
{
  private float spawnNumber; 
  private ArrayList<Enemy> enemies = new ArrayList<Enemy>();
  private boolean canSpawn = true;
  private int spawnRate = 60;

  public void updateSpawnNumber(float amount)
  {
    spawnNumber += amount;
  }

  public float getSpawnNumber()
  {
    return spawnNumber;
  }

  public void spawn()
  {
    if (spawnNumber > 2)
    {
      spawnRate = 10;
      //make boolean arraylist for types of enmies
    }
    if (frameCount % spawnRate == 0 && canSpawn)
    {
      //randomly select enemy enemy from true array
      
      //enemies.add(new PinwheelEnemy((int)random(width), (int)random(height)));
      enemies.add(new GruntEnemy((int)random(width), (int)random(height)));
      enemies.add(new WeaverEnemy((int)random(width), (int)random(height)));
    }
  }

  public ArrayList<Enemy> getEnemies()
  {
    return enemies;
  }

  public void resetEnemies()
  {
    enemies = new ArrayList<Enemy>();
  }
}

