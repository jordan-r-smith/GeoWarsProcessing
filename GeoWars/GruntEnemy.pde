public class GruntEnemy extends Enemy
{
  private float speed = 4;
  private PImage gruntImg;

  public GruntEnemy(int x, int y)
  {
    super(x, y);
    //gruntImg = loadImage("grunt.png");
  }

  public void draw()
  {
    fill(#33B5E5);
    rect(getX(),getY(),40,40);
    //image(gruntImg, getX(), getY());
    moveToPlayer(speed);
  }
}

