public class Background extends Sprite
{
  private int velocity = 1;
  private PImage bgImage;

  public Background(float x, float y)  
  {
    super(x, y);
    bgImage = loadImage("bg.png");
    bgImage.resize(width, height);
  }

  public void draw()
  {
    background(0);
    imageMode(CENTER);
    image(bgImage, getX(), getY());
    imageMode(CORNER);
  }

  public void move()
  {
    float[] xy = player.getPlayerLocation();
    if (input.buttons[Input.aLEFT] && xy[0]-player.getPlayerWidth()/2 > 185)
      setX(getX() + velocity);
    if (input.buttons[Input.aRIGHT] && xy[0]+player.getPlayerWidth()/2 < width-185)
      setX(getX() - velocity);
    if (input.buttons[Input.aUP] && xy[1]-player.getPlayerHeight()/2 > 100)
      setY(getY() + velocity);
    if (input.buttons[Input.aDOWN] && xy[1]+player.getPlayerHeight()/2 < height-100)
      setY(getY() - velocity);
  }
}

