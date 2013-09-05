public class Bullet extends Sprite 
{
  public float x2, y2;
  public float xV;
  public float yV;
  public float angle;
  public float speed = 8;
  private PImage bulletImg;

  public Bullet(float x, float y, float angle) 
  {
    super(x, y);
    this.angle = angle;
    x = getX() + cos(angle - radians(90)) * 20;
    y = getY() + sin(angle - radians(90)) * 20;
    x2 = x;
    y2 = y;
    xV = cos(angle - radians(90)) * speed;
    yV = sin(angle - radians(90)) * speed;
    bulletImg = loadImage("bullet.gif");
  }

  public void draw()
  {
    setY(y2);
    setX(x2);
    x2 = getX() + xV;
    y2 = getY() + yV;
    image(bulletImg, getX()-player.getPlayerWidth()/2, getY()-player.getPlayerHeight()/2);
    if (x2 > width || x2 < 0 || y2 > height || y2 < 0)
    {  
      this.remove();
    }
  }
}

