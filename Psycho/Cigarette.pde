PImage cigaretteman_img;
PImage wall_img;
PImage houses_img;
PImage tree_img;
Wall wall;
Tree tree;
CigaretteMan man;
Houses houses;
Fire[] fires;
Fire[] fires_back;
Fire[] fires_front;

class Tree extends PngObject{
    public Tree(){
        super(0, 0, tree_img); 
    }
}

class Houses extends PngObject{
    public Houses(double x, double y){
        super(x, y, houses_img); 
    }
}

class CigaretteMan extends PngObject{

    public CigaretteMan(double x, double y){
        super(x, y, cigaretteman_img);
    }
    
    @Override
    public void show(){
        super.show(); 
        double r = Math.random();
        if(r > 0.33){
            fill(color(200, 120, 0));
        }else if(r > 0.66){
            fill(color(122, 200, 0));   
        }else{
            fill(color(240, 80, 0));  
        }
        circle(super.x + 922, super.y + 598, 13);
    }
   
}

class Wall extends PngObject{
    public Wall(double x, double y){
        super(x, y, wall_img);
    }
}

int dx = 0;
int dy = 0;

void cigarette_init(){
    noStroke();
    cigaretteman_img = loadImage("cigaretteman.png");
    wall_img = loadImage("brick.jpg");
    houses_img = loadImage("houses.png");
    tree_img = loadImage("tree.png");
    wall = new Wall(900, 0);
    man = new CigaretteMan(0, 0);
    houses = new Houses(0, 0);
    fires = new Fire[4];
    tree = new Tree();
    int cnt=0;
    for(int i = 0; i < 400; i += 100){
        fires[cnt++] = new Fire(i, height, 5);
    }
    
    fires_back = new Fire[5];
    cnt = 0;
    for(int i = 0; i < 1000; i += 200){
        fires_back[cnt++] = new Fire(i, height/2, 10);
    }
    
    fires_front = new Fire[2];
    fires_front[0] = new Fire(500, height, 5);
    fires_front[1] = new Fire(600, height, 5);
    for(int i = 0; i < 50; i++){
        for(Fire f : fires_back){
            f.step(); 
        }
        for(Fire f : fires_front){
            f.step(); 
        }
        for(Fire f : fires){
            f.step(); 
        }
    }
    
}

boolean houses_drop = false;

void cigarette(){
    
    if(Math.random() > 0.92){
        background(color(122, 122, 0));
        houses.move(2, 0);
        houses_drop = true;
    }else{
        background(color(122, 0, 0)); 
    }
    
    for(Fire f : fires_back){
        f.step(); 
    }
    
    houses.show();
    if(houses_drop){
        houses.move(-2, 0);
        houses_drop = false;
    }
    
    wall.move(-0.3, 0);
    wall.show();
    man.show();
    for(Fire f : fires){
        f.step(); 
    }
    tree.show();
    
    for(Fire f : fires_front){
        f.step(); 
    }
    
}
