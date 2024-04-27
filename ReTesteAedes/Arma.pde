class Arma {
  
  float xpos, ypos;
  float h, w;
  //os adds são para ajustar os sprites e fazer eles sairem no lugar exato que eu quero
  float add, addx, addy, rotacao;
  float shotCd, cdShot;
  float maxammo, myammo, recarga, recargaCd;
  boolean canShot, doRecarga;
  PImage gun;
  ArrayList<Bullet> bullet = new ArrayList<>();
  Bullet tiro;
  int tiros;
  
  public Arma(float xpos, float ypos) 
  {
      this.xpos = xpos;
      this.ypos = ypos;
      this.shotCd = 1;
      this.cdShot = 1;
      this.gun = loadImage("AEDES-trabalho1/ItemSprite/Item12.png");
      this.tiros = 0;
      this.recargaCd = 15;
      this.maxammo = 16;
      this.myammo = maxammo;
      this.canShot = true;
      this.doRecarga = false;
  }
  
  void makeGun(float adder, float x, float y) 
  {
    textSize(48);
    text(myammo + "/" + maxammo, 12, 48); 
    xpos = x;
    ypos = y;
    add = adder;
    pushMatrix();
    translate(xpos + adder, ypos);
    
    
    if(mouseX < xpos) {
      rotateY(PI);  
      rotateZ(-atan2(mouseY - ypos, mouseX - xpos) + PI);
      rotacao = -atan2(mouseY - ypos, mouseX - xpos) + PI;
      
      addx = -cos(rotacao);
      addy = sin(rotacao);
      
    } else {
      rotateZ(atan2(mouseY - ypos, mouseX - xpos));  
      rotacao = atan2(mouseY - ypos, mouseX - xpos);
      
      addx = cos(rotacao);
      addy = sin(rotacao);
      
    }
     
    
    image(gun, 0, -30, 50, 50);
      
    popMatrix();
    
  } // end of makeGun
  
  void ammo() 
  {
      if(myammo <= 0 || doRecarga) {
        recarga += 10/frameRate;
        
        if(recarga >= recargaCd) {
          recarga = 0;
          doRecarga = false;
          myammo = maxammo;
        }
      }
  }
  
  void playerShot() 
  {
    for(Bullet tiro : bullet) 
    {
      tiro.move();  
    }
    
    shotCd += 7/frameRate;
    
    if(shotCd > cdShot && mousePressed == true && canShot && myammo > 0) { 
      tiros++;
      myammo--;
      doRecarga = false;
      Bullet tiro = new Bullet(xpos + add, ypos, addx * 500, addy * 500,  mouseX, mouseY);
      bullet.add(tiro);
    
      shotCd = 0;
    }
    ammo();
    
  } //end of playershot
  
  
  
} //end of class
