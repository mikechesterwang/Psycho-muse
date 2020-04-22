
class Robot{
    PImage head;
    PImage mouth;
    private int y = -16;
    public Robot(){
        head = loadImage("robot_head.png");
        mouth = loadImage("robot_mouth.png");
        for(int x = 0; x < head.width; x++){
            for(int y = 0; y < head.height; y++){
                 
                 color c = head.pixels[y * head.width + x];
                 if(alpha(c) == 0) continue;
                 head.pixels[y * head.width + x] = color(red(c),green(c), blue(c), 240);
                 
            }
        }
        
        for(int x = 0; x < mouth.width; x++){
            for(int y = 0; y < mouth.height; y++){
                 color c = mouth.pixels[y * mouth.width + x];
                 if(alpha(c) == 0) continue;
                 head.pixels[y * mouth.width + x] = color(red(c),green(c), blue(c), 240);
            }
        }
    }
    
    public void show(){
        image(head, 0, 0);
        image(mouth, 0, y);
    }
}

Robot robot;

void robot_pop(){
    robot.y = 30; 
}

void robot_drop(){
    robot.y = -16;
}

void robot_init(){
    robot = new Robot();
}

void robot_neuron(){
    neuron();
    robot.show();
}

void robot_network(){
    //network();
    robot.show();
}
