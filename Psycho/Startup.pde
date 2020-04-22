PImage statrup_back;

void startup_init(){
  statrup_back = loadImage("back.jpg");
  fill(0);
}

void startup(){
  background(0);
  if(frameCount % 7 == 0)
    image(statrup_back, -10 + (float)Math.random() * 20, (float)Math.random() * 10);
  else
    image(statrup_back, 0, 0);
  
  if(frameCount % 3 == 0){
    float dy = (float)Math.random() * 15;
    float y = (float)Math.random() * (height - dy);
    fill(0);
    rect(0, y, width, y + dy);
    
    dy = (float)Math.random() * 15;
    y = (float)Math.random() * (height - dy);
    rect(0, y, width, y + dy);
  }
  
  if(Math.random() > 0.91){
     int fmod = frameCount % 3;
     if(fmod% 3 == 0){
         background(color(50, 0, 0)); 
     }else if(fmod % 3 == 1){
         background(color(0, 50, 0)); 
     }else{
         background(color(0, 0, 50)); 
     }
     
  }
}
