public class Input {

  public static final int aLEFT = 0;
  public static final int aRIGHT = 1;
  public static final int aUP = 2;
  public static final int aDOWN = 3;
  public static final int aESC = 4;
  public static final int aF = 5;

  public boolean[] buttons = new boolean[6];
  
  public float angle;

  public void set(int key, boolean down) 
  {
    int button = -1;
    if (keyCode == LEFT || key == 'A')
      button = 0;
    if (keyCode == RIGHT || key == 'D')
      button = 1;
    if (keyCode == UP || key == 'W')
      button = 2;
    if (keyCode == DOWN || key == 'S')
      button = 3;
    if (keyCode == ESC)
      button = 4;
    if (key == 'F')
      button = 5;
    if (button >= 0)
      buttons[button] = down;
  }

  public float getMouseAngle()
  {
    angle = atan2(mouseY - player.getY(), mouseX - player.getX())+radians(90);
    return angle;
  }
}

