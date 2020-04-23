int startRecordFrame = 0;
boolean record = false;


int last_show = 0;
int show = 0;
//int show = show_walk;

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
  subway_init();
  guitar_init();
  building_init();
  gunman_init();
  walk_init();
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
  }else if(show == show_subway){
      subway(); 
  }else if(show == show_guitar){
      guitar(); 
  }else if(show == show_building){
      building(); 
  }else if(show == show_gunman){
      gunman(); 
  }else if(show == show_walk){
      walk(); 
  }
   
}

boolean tempMode = false;

void keyPressed(){
   if(key == 'w' || key == 'W'){
       pop();
   }
   
   if(key == 'n' || key == 'N'){
        last_show = show;
        show = show_robot; 
   }
   
   if(key == 'm' || key == 'M'){
        last_show = show;
        show = show_guitar;  
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
   if('0' <= key && key <= '9'){
        last_show = show;
        show = key - '0';
   }
   
   if(key == 'R' || key == 'r'){
        show = last_show;
   }
   
   if(key == 'n' || key == 'N' || key == 'm' || key == 'M'){
        show = last_show;
   }
   
}
