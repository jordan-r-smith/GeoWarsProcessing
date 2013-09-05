public class WeaverEnemy extends Enemy
{
  private float speed = 5;
  private PImage weaverImg;

  public WeaverEnemy(int x, int y)
  {
    super(x,y);
    //weaverImg = loadImage("weaver.png");
  }

  public void draw()
  {
    //image(weaverImg, getX(), getY());
    fill(#99CC00);
    rect(getX(),getY(),40,40);
    moveToPlayer(speed);
    avoidBullets();
  }
}

