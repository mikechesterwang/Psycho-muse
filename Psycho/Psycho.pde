int startRecordFrame = 0;
boolean record = false;

//int show = show_dommsday;
int show = 0;
boolean debug = true;

void setup(){
  frameRate(30);
  size(1440, 810); 
  startup_init();
  divein_init();
  bomber_init();
  cigarette_init();
  network_init();
  computer_init();
  robot_init();
  neuron_init();
  doomsday_init();
}

void nextShow(int nextShowNumber){
     if(show < nextShowNumber) show = nextShowNumber;
}

void draw(){
  
  if(show == show_statup){
      startup(); 
  }else if(show == show_divein){
      divein();
  }else if(show == show_bomber){
      bomber(); 
  }else if(show == show_cigarette){
      cigarette();
  }else if(show == show_network){
      network(); 
  }else if(show == show_computer){
      computer(); 
  }else if(show == show_robot){
      robot_neuron(); 
  }else if(show == show_dommsday){
      doomsday(); 
  }
   
}

void keyPressed(){
    if(key == 'w' || key == 'W'){
       pop();
   }
}

void keyReleased(){
   if(key == 'S' || key == 's'){
      record =! record; 
      if(record){
         startRecordFrame = frameCount; 
         println("Start to record.");
      }
   }
   if(key == 'e' || key == 'E'){
       show++;
   }
   if(key == 'q' || key == 'Q'){
       show--; 
   }
   if(key == 'w' || key == 'W'){
       drop();
   }
}
