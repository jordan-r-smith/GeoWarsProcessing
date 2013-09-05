public class PinwheelEnemy extends Enemy
{

  private int path = r.nextInt(8);
  private int velocity = 2;
  private PImage pinwheelImg;

  public PinwheelEnemy(int x, int y)
  {
    super(x, y);
    //pinwheelImg = loadImage("pinwheel.png");
    fill(#9933CC);
    rect(getX(),getY(),40,40);
  }

  public void draw()
  {
    image(pinwheelImg, getX(), getY());
    move();
  }

  public void move()
  {

    int tempX, tempY;
    if (path == 0) //SE
    {
      if (getX() >= width-40)
      {
        path = 2;
      }
      else if (getY() >= height-40)
      {
        path = 1;
      }
      else
      {
        tempX = (int) (getX() + velocity);
        tempY = (int) (getY() + velocity);
        setX(tempX);
        setY(tempY);
      }
    }
    else if (path == 1) //NE
    {
      if (getX() >= width-40)
      {
        path = 3;
      }
      else if (getY() <= 0)
      {
        path = 0;
      }
      else
      {
        tempX = (int) (getX() + velocity);
        tempY = (int) (getY() - velocity);
        setX(tempX);
        setY(tempY);
      }
    }
    else if (path == 2) //SW
    {
      if (getX() <= 0)
      {
        path = 0;
      }
      else if (getY() >= height-40)
      {
        path = 3;
      }
      else
      {
        tempX = (int) (getX() - velocity);
        tempY = (int) (getY() + velocity);
        setX(tempX);
        setY(tempY);
      }
    }
    else if (path == 3) //NW
    {
      if (getX() <= 0)
      {
        path = 0;
      }
      else if (getY() <= 0)
      {
        path = 2;
      }
      else
      {
        tempX = (int) (getX() - velocity);
        tempY = (int) (getY() - velocity);
        setX(tempX);
        setY(tempY);
      }
    }
    else if (path == 4) //N
    {
      if (getY() <= 0)
      {
        path = 6;
      }
      else
      {
        tempY = (int) (getY() - velocity);
        setY(tempY);
      }
    }
    else if (path == 5) //E
    {
      if ( getX() >= width-40)
      {
        path = 7;
      }
      else
      {
        tempX = (int) (getX() + velocity);
        setX(tempX);
      }
    }
    else if (path == 6) //S
    {
      if (getY() >= height-40)
      {
        path = 4;
      }
      else
      {
        tempY = (int) (getY() + velocity);
        setY(tempY);
      }
    }
    else if (path == 7) //W
    {
      if (getX() <= 0)
      {
        path = 5;
      }
      else
      {
        tempX = (int) (getX() - velocity);
        setX(tempX);
      }
    }
  }
}

