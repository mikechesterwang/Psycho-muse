class Crowd{
    float x;
    float step;
    public Crowd(int x){
       step = 5 + (float)(Math.random() * 20);
       this.x = x;
    }
    
    public void show(){
        
        x -= step;
        
        image(crowd, x, (int)(Math.random() * 3) + 1); 
        
    }
}

int walk_cnt = 0;
void walk(){
    //walk_cnt = walk_cnt + 1;
    //if(walk_cnt == 10){
    //    walk_cnt = 0; 
    //}
    
    background(color(122, 0, 0));
    for(int i = 0; i < 10; i++){
       cs[i].show(); 
    }
    image(white, 0, 0);
    for(int i = 10; i < 20; i++){
        cs[i].show(); 
    }
    
}

PImage crowd;
PImage white;
Crowd[] cs;

void walk_init(){
    crowd = loadImage("walk_crowd.png");
    white = loadImage("walk_white.png");
    cs = new Crowd[20];
    int cnt = 0;
    for(int x = 0; x < 3000; x += 300){
        cs[cnt++] = new Crowd(x); 
    }
    
    for(int x = 0; x < 3000; x += 300){
        cs[cnt++] = new Crowd(x); 
    }
}
