boolean paused;
Player player;

void setup()
{

  frameRate(70);
  size(1000, 800, P3D);
  background(40, 210, 100);
  
  player = new Player(width/2, height/2, 0, 0, 3, 3);
}

void draw()
{

  background(40, 210, 100);
  
  

  paused = false;
  
  if (paused == false)
  {
    player.playerize();
  }
}

void keyPressed() 
  {
    if(key == 's' || key == 'S') {
      player.moveDown = true;
    }
    if(key == 'a' || key == 'A') {
      player.moveLeft = true;
    }
    if(key == 'w' || key == 'W') {
      player.moveUp = true;
    }
    if(key == 'd' || key == 'D') {
      player.moveRight = true;
    }
    if(key == 'r' || key == 'R') {
      player.gun.doRecarga = true;
    }
    
  }
  
  void keyReleased() 
  {
     if(key == 's' || key == 'S') {
      player.moveDown = false;
    }
    if(key == 'a' || key == 'A') {
      player.moveLeft = false;
    }
    if(key == 'w' || key == 'W') {
      player.moveUp = false;
    }
    if(key == 'd' || key == 'D') {
      player.moveRight = false;
    }
  }
