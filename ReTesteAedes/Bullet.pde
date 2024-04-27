class Bullet 
{
  float xpos, ypos;
  float speedx, speedy;
  float baseSpeedx, baseSpeedy;
  float targetx, targety;
  float totalx, totaly;
  float duration;
  boolean type;
  PImage bullet;
  
  public Bullet(float xpos, float ypos, float baseSpeedx, float baseSpeedy, int targetx, int targety) 
  {
    this.xpos = xpos;
    this.ypos = ypos;
    this.baseSpeedx = baseSpeedx;
    this.baseSpeedy = baseSpeedy;
    this.speedx = baseSpeedx/50;
    this.speedy = baseSpeedy/50;
    this.targetx = targetx;
    this.targety = targety;
    this.bullet = loadImage("AEDES-trabalho1/ItemSprite/Item13.png");
    this.duration = 5;
    if(mouseX < xpos) {
      this.type = true;  
    } else {
      this.type = false;  
    }
    
    move();
  } // end of bullet constructor
  
  
  void desenha() 
  {
    pushMatrix();
    translate(xpos, ypos);
  
    if(type) {
      rotateY(PI);  
      rotateZ(-atan2(targety - ypos + totaly, targetx - xpos + totalx) + PI);
    } else {
      rotateZ(atan2(targety - ypos + totaly, targetx - xpos + totalx));  
    }
    
    image(bullet, 0, -20, 40, 40);
    
    popMatrix();
    
    
  } // end of desenha
  
  void move() 
  {
    totalx += speedx;
    totaly += speedy;
    xpos += speedx;
    ypos += speedy;
    duration -= 1/frameRate;
    
    if(duration > 0) {
      desenha();
    }
  } //end of move
  
  float durationGetter() 
  {
    return duration;
    
  } //end of durationgetter
  
}//end of bullet
