public abstract class Sprite
{
  private float x;
  private float y;
  private boolean removed;

  public Sprite(float x, float y)
  {
    this.x = x;
    this.y = y;
    removed = false;
  }

  public float getX()
  {
    return x;
  }

  public float getY()
  {
    return y;
  }

  public void setX(float x)
  {
    this.x = x;
  }

  public void setY(float y)
  {
    this.y = y;
  }

  public boolean isRemoved()
  {
    return removed;
  }

  public void remove()
  {
    removed = true;
  }

}

