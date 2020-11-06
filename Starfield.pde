Particle[] peepopo = new Particle[150];
//your code here
void setup()
{
  size(1000,1000);
  background(0);
  for(int i = 0; i < 5; i++){
    peepopo[i] = new OddballParticle();
  }
  for(int i = 5; i < peepopo.length; i++){
    peepopo[i] = new Particle();
  }
  frameRate(60);
}
void draw()
{
  fill(0, 0, 0, 50);
  rect(0, 0, 1000, 1000);
  for(int i = 0; i < peepopo.length; i++){
      peepopo[i].move();
      peepopo[i].show();
      peepopo[i].reset();
  }

}
class Particle
{
  float myX, myY, mySize;
  double mySpeed, myAngle;
  color myColor;
  
  
  Particle(){
    myX = 500;
    myY = 500;
    myAngle = Math.random() * 360;
    mySpeed = Math.random() * 7 + 2;
    mySize = (float)(Math.random() + 1);
    myColor = color((int)(Math.random()*256), (int)(Math.random()*200) + 56, (int)(Math.random()*256));
  }
  
  void show(){
    fill(myColor);
    noStroke();
    float size = (float)mySize * dist(500, 500, myX, myY)/60;
    ellipse(myX, myY, size, size);
  }
  
  void move(){
    
    myX += Math.cos(radians((float)myAngle)) * mySpeed;
    myY += Math.sin(radians((float)myAngle)) * mySpeed;
    
  }
  void reset(){
    if(myX > 1050 || myY > 1050 || myX < 0 || myY < 0){
      
      myX = 500;
      myY = 500;
      myAngle = Math.random() * 360;
      mySpeed = Math.random() * 7 + 2;
    
    }
  }
}

class OddballParticle extends Particle
{
   float spinAngle, spinSpeed, respawnTime;
   
  OddballParticle(){
    super();
    spinAngle = (float)(Math.random() * 360);
    spinSpeed = (float)(Math.random() * 0.005) + 0.001; 
    respawnTime = (float)Math.random();
  }
  
  void show(){
    float size = (float)mySize * dist(500, 500, myX, myY)/40;
    
    pushMatrix();
    translate(myX, myY);
    rotate(degrees(spinAngle));
    noStroke();
    fill(0,255,0);
    ellipse(-size, -size, size * 2, size * (65/25.0));
    ellipse(size, -size, size * 2, size * (65/25.0));
    
    fill(255);
    ellipse(-size, -size, size * (37/25.0), size * (52/25.0));
    ellipse(size, -size, size * (37/25.0), size * (52/25.0));
    
    fill(0);
    ellipse(-size * (26/25.0), size * (-39/25.0), size * (13/25.0), size * (13/25.0));
    ellipse(+size * (26/25.0), size * (-39/25.0), size * (13/25.0), size * (13/25.0));
    
    fill(0,255,0);  
    ellipse(0, 0, size * (140/25.0), size * (70/25.0));
    
    fill(0);
    stroke(0);
    strokeWeight(size * (4/25.0));
    line(-size, size * (15/25.0), size, size * (15/25.0));
    
    popMatrix();

    spinAngle += spinSpeed;
  }
  
    void reset(){
    if(myX > 1050 + respawnTime * 1000|| myY > 1050 + respawnTime * 1000|| myX < 0 - respawnTime * 1000|| myY < 0 - respawnTime * 1000){
      
      myX = 500;
      myY = 500;
      myAngle = Math.random() * 360;
      mySpeed = Math.random() * 7 + 2;
      spinAngle = (float)(Math.random() * 360);
      spinSpeed = (float)(Math.random() * 0.005) + 0.001; 
      respawnTime = (float)Math.random();
    
    }
  }
}
