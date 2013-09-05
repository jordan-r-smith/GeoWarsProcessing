import java.io.IOException;

public class Player extends Sprite
{
  private int velocity = 4;
  private PImage playerImg;

  public Player(int x, int y)
  {
    super(x, y);
    playerImg = loadImage("player.png");
  }

  public int getPlayerWidth()
  {
    return playerImg.width;
  }

  public int getPlayerHeight()
  {
    return playerImg.height;
  }

  public float[] getPlayerLocation()
  {
    float[] xy = new float[2];
    xy[0] = getX();
    xy[1] = getY();
    return xy;
  }

  public void draw(Float angle)
  {
    pushMatrix();
    translate(getX(), getY());
    rotate(angle);
    image(playerImg, -getPlayerWidth()/2, -getPlayerHeight()/2);
    popMatrix();
  }

  public void move()
  {
    if (input.buttons[Input.aLEFT] && getX()-getPlayerWidth()/2 > 185)
      setX(getX() - velocity);
    if (input.buttons[Input.aRIGHT] && getX()+getPlayerWidth()/2 < width-185)
      setX(getX() + velocity);
    if (input.buttons[Input.aUP] && getY()-getPlayerHeight()/2 > 100)
      setY(getY() - velocity);
    if (input.buttons[Input.aDOWN] && getY()+getPlayerHeight()/2 < height-100)
      setY(getY() + velocity);
  }
}

