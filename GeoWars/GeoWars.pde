/* @pjs preload="bg.png"; */
/* @pjs preload="bulletImg.png"; */
/* @pjs preload="pinwheel.png"; */

private Background background;
private Input input;
private Player player;
private UX ux;
private Spawn spawn;

private int fireRate = 8;
private int spawnTimer;
private int respawnTime = 60;
private int fpsTimer = 0;
private static int multiplier = 1;

private static ArrayList<Bullet> bullets = new ArrayList<Bullet>();

private boolean canSpawn;
private boolean toggleFPS = true;

void setup() 
{
  size(displayWidth, displayHeight);
  //size(800, 600);
  //background = new Background(-1*(3000-width)/2, -1*(2000-height)/2);
  background = new Background(width/2, height/2);
  input = new Input();
  player = new Player(width/2, height/2);
  ux = new UX();
  spawn = new Spawn();
  thread("drawFPS");
  println(displayWidth/2);
}

void draw() 
{
  if (ux.getLives() > 0)
  {
    processBackground();
    processPlayer();
    processBullets();
    processEnemies();
    drawFPS();
    ux.draw();
    spawn.updateSpawnNumber(0.001);
  }
}

boolean sketchFullScreen() 
{
  return true;
}

public void drawFPS()
{
  if (input.buttons[Input.aF] && frameCount - fpsTimer > 10)
  {
    toggleFPS = !toggleFPS;
    fpsTimer = frameCount;
  }
  if (toggleFPS)
  {
    fill(255);
    textSize(30);
    textAlign(CENTER);
    text("" + (int)frameRate, width-50, height-50);
  }
}

private void processBackground()
{
  background.draw();
  background.move();
}

private void processPlayer()
{
  player.draw(input.getMouseAngle());
  player.move();
}

private void processBullets()
{
  boolean stop = true;
  for (int i = 0; i < bullets.size(); i++)
  {
    if (!bullets.get(i).isRemoved())
    {
      bullets.get(i).draw();
      for (int j = 0; j < spawn.getEnemies().size() && stop; j++)
      {
        if (abs(spawn.getEnemies().get(j).getX() + 20 - bullets.get(i).getX() + 5) < 30
          && abs(spawn.getEnemies().get(j).getY() + 20 - bullets.get(i).getY() + 5) < 30)
        {
          //          if (spawn.getEnemies().get(j).getClass().equals(PinwheelEnemy.class))
          //            updateScore(25);
          //          else if (spawn.getEnemies().get(j).getClass().equals(GruntEnemy.class))
          //            updateScore(50);
          //          else
          //            updateScore(100);

          bullets.remove(i);
          spawn.getEnemies().remove(j);
          spawn.updateSpawnNumber(0.1);
          j--;
          stop = false;
        }
      }
    }
    else
    {
      bullets.remove(i);
      i--;
    }
    stop = true;
  }

  if (frameCount % fireRate == 0)
  {
    bullets.add(new Bullet(player.getX() + (player.getPlayerWidth() / 2), player.getY() 
      + (player.getPlayerHeight() / 2), input.getMouseAngle()));
  }
}

public static ArrayList<Bullet> getBulletArray()
{
  return bullets;
}

private void processEnemies()
{
  for (int i = 0; i < spawn.getEnemies().size(); i++)
  {
    if (!spawn.getEnemies().get(i).isRemoved())
    {
      if (spawn.getEnemies().get(i).getClass().equals(PinwheelEnemy.class))
      {
        PinwheelEnemy temp = (PinwheelEnemy) spawn.getEnemies().get(i);
        temp.draw();
      }
      if (spawn.getEnemies().get(i).getClass().equals(GruntEnemy.class))
      {
        GruntEnemy temp = (GruntEnemy) spawn.getEnemies().get(i);
        temp.setAngle(temp.getEnemyAngle());
        temp.draw();
      }
      if (spawn.getEnemies().get(i).getClass().equals(WeaverEnemy.class))
      {
        WeaverEnemy temp = (WeaverEnemy) spawn.getEnemies().get(i);
        temp.setAngle(temp.getEnemyAngle());
        temp.draw();
      }

      if ((abs(spawn.getEnemies().get(i).getX() - player.getX()) < 30
        && abs(spawn.getEnemies().get(i).getY() - player.getY()) < 30))
      {
        //death();
      }
    }
  }

  if (!canSpawn)
  {
    if (frameCount - spawnTimer == respawnTime)
      canSpawn = true;
  }
  spawn.spawn();
}

public void death()
{
  player.setX(width / 2);
  player.setY(height / 2);
  background.setX(-1*(3000-width)/2);
  background.setY(-1*(2000-height)/2);

  bullets = new ArrayList<Bullet>();
  spawn.resetEnemies();
  canSpawn = false;
  spawnTimer = frameCount;

  ux.updateLives(-1);
}

public static int getMultiplier()
{
  return multiplier;
}

public void keyPressed(KeyEvent e)
{
  input.set(e.getKeyCode(), true);
}

public void keyReleased(KeyEvent e)
{
  input.set(e.getKeyCode(), false);
}

