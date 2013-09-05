import java.util.Random;

public class Enemy extends Sprite
{
  protected Random r = new Random();
  private int velocity = 2;
  private int jump;
  public float x2, y2;
  public float xV;
  public float yV;
  public float angle;

  public Enemy(float x, float y)
  {
    super(x, y);
  }

  public void setAngle(float angle)
  {
    this.angle = angle;
  }

  public float getEnemyAngle()
  {  
    float enemyX = getX();
    float enemyY = getY();
    float newX = (player.getX() - (player.getPlayerWidth() / 2)) - enemyX;
    float newY = (player.getY() - (player.getPlayerHeight() / 2)) - enemyY;
    float eTheta = atan2(newY, newX);
    return eTheta;
  }

  public void moveToPlayer(float speed)
  {
    yV = sin(angle) * speed;
    xV = cos(angle) * speed;
    setY(getY() + yV);
    setX(getX() + xV);
  }

  public void avoidBullets()
  {
    ArrayList<Bullet> bullets = GeoWars.getBulletArray();
    float[] xy = player.getPlayerLocation();
    for (int i = 0; i < bullets.size(); i++)
    {
      if (r.nextInt(3) == 0)
        jump = 5;
      else if (r.nextInt(3) == 1)
        jump = 10;
      else if (r.nextInt(3) == 2)
        jump = 15;

      Bullet a = bullets.get(i);
      if (!a.isRemoved())
      {
        int tempX = 0;
        int tempY = 0;

        if ((Math.abs(getX() - xy[0]) > 75 || Math.abs(getY() - xy[1]) > 75) && 
          Math.abs(getX() - a.getX()) < 100 && Math.abs(getY() - a.getY()) < 100)
        {
          if (getX() < a.getX()  && getX() > 4)
          {
            tempX = (int)getX() - jump;
            setX(tempX);
          }
          else if (getX() < width-40)
          {
            tempX = (int)getX() + jump;
            setX(tempX);
          }
          if (getY() < a.getY() && getY() > 4)
          {
            tempY = (int)getY() - jump;
            setY(tempY);
          }
          else if (getY() < height-40)
          {
            tempY = (int)getY() + jump;
            setY(tempY);
          }
        }
      }
    }
  }
}

