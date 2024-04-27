class Player 
{
  boolean moveUp, moveDown;
  boolean moveLeft, moveRight;
  boolean rotated;
  int rotator, rotatorControler;
  float xpos, ypos;
  float h, w;
  float speedx, speedy, baseSpeedx, baseSpeedy;
  int state; //um tipo de controlador de sprite
  PImage idle, movingFront, movingBack, movingLeft, movingRight, dead;
  Arma gun;
  
   public Player(float xpos, float ypos, float h, float w, int speedx, int speedy) 
  {
    this.xpos = xpos;
    this.ypos = ypos;
    this.h = h;
    this.w = w;
    this.baseSpeedx = speedx;
    this.baseSpeedy = speedy;
    this.speedx = baseSpeedx;
    this.speedy = baseSpeedy;
    this.state = 1;
    this.rotated = false;
    this.rotator = 0;
    this.rotatorControler = 0;
    this.moveUp = false;
    this.moveDown = false;
    this.moveLeft = false;
    this.moveRight = false;
    this.idle  = loadImage("AEDES-trabalho1/PlayerSprites/Sprite5.png");
    this.movingRight = loadImage("AEDES-trabalho1/PlayerSprites/Sprite2.png");
    this.movingLeft = loadImage("AEDES-trabalho1/PlayerSprites/Sprite6.png");
    this.movingBack = loadImage("AEDES-trabalho1/PlayerSprites/Sprite3.png");
    this.movingFront = loadImage("AEDES-trabalho1/PlayerSprites/Sprite1.png");
    this.dead = loadImage("AEDES-trabalho1/PlayerSprites/Sprite4.png");
    gun = new Arma(xpos, ypos);
    
  } //end of constructor
  
  void playerDraw() 
  {
    if(state == 1) 
    { //estado idle
      image(idle, -50, -70, 100, 100);
      
    } else if(state == 2 || state == 5 ) {
      
      if(rotatorControler == 1) {
        image(movingLeft, -50, -70, 100, 100);
        //estado movendo lado ai
      } else {
        image(movingRight, -50, -70, 100, 100);
        //estado movendo outro lado ai
      }
      
    } else if(state == 3) {
      image(movingFront, -50, -70, 100, 100);
      //estado movendo pra frente
    } else if(state == 4) {
      image(movingBack, -50, -70, 100, 100);
      //estado movendo pra tras
    } else if(state == 6) {
      image(movingLeft, -50, -70, 100, 100);
       //outro esse lado ai
    } else if(state == 7) 
    { //ta morta
      image(dead, -50, -70, 100, 100);
    }
    
  } //playerDraw end
  
  void makePlayer() 
  {
    
    pushMatrix();
    translate(xpos, ypos);
    
    if (rotated == true) {
      rotateY(PI);
    } else {
      rotateY(0);
    }
  
    playerDraw();
  
    popMatrix();
    
  }//end of makePlayer
  
  void checkRotate() 
  {
    //esses ifs sao para mudar girar os sprite de forma basica
    if(state == 1) 
    {
      rotated = true;
    }
    if(state == 2) 
    {
      rotated = true;
    }
    if(state == 3) 
    {
      rotated = true;
    }
    if(state == 4) 
    {
      rotated = true;
    }
    if(state == 5) 
    {
      rotated = false;
    }
    
    //rotator vai ser pra fazer uma animacaozinha
    if(state != 1) 
    {
       rotator += 12; 
    } else {
      rotator = 0;
    }
    
    if(rotator >= 2*frameRate) 
    {
      if(state != 2) 
      {
        rotated = false;
      }
      rotatorControler = 1;
    }
    
    if(rotator >= 4*frameRate) 
    {
      rotatorControler = 0;
      rotator = 0; 
    }
    //Comentario explicando esse codigo caso seja confuso
    //primeiro ele serve pra animações no player
    //o rotated = false ali serve pra fazer as animações de andar pra cima ou baixo
    //e o rotatorcontroler cuida das animações dos lados :D
    //alem disso o rotator cuido do tempo das animações
    
  } //end of checkRotate
  
  void speedController() 
  {
    //serve pra ajustar o movimento ja que podemso andar na diagonal nao queremos andar nela com o dobro de velocidade
    if((moveRight == true && (moveUp == true || moveDown == true) || moveLeft == true && (moveUp == true || moveDown == true))) 
    {
      speedx = baseSpeedx/1.414f;
      speedy = baseSpeedy/1.414f;
      
    } else {
      speedx = baseSpeedx;
      speedy = baseSpeedy;
    }
    
  } //end of speedContrller
  
  void checkInput() 
  {
    state = 1;
    speedController();
    
    if(moveUp == true) 
    {
      ypos -= speedy;
      state = 4;
    }
    if(moveDown == true) 
    {
      ypos += speedy;
      state = 3;
    }
    if(moveLeft == true) 
    {
      xpos -= speedx;
      state = 5;
    }
    if(moveRight == true) 
    {
      xpos += speedx;
      state = 2;
    }
    checkRotate();
    
  } //end of checkInput
  
   //draw for player
  void playerize() 
  {
    if(moveUp || moveLeft || moveRight) {
      checkInput();
      gun.playerShot();
      if(rotated) {
        gun.makeGun(30, xpos, ypos);
        
      } else {
        gun.makeGun(-30, xpos ,ypos);
        
      }
      makePlayer();
    
    } else {
      checkInput();
      makePlayer();
      gun.playerShot();
      if(rotated) {
        gun.makeGun(30, xpos, ypos);
        
      } else {
        gun.makeGun(-30, xpos ,ypos);
        
      }
    }
    
    
    
  } //playerize end
  
} //class end
