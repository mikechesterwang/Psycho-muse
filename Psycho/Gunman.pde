PImage gunman_mask;
class Gunman{
    PImage man;
    PImage fire;
    int x;
    int y;
    public Gunman(int x, int y){
        man = loadImage("gunman.png");
        fire = loadImage("gunman_fire.png");
        this.x = x;
        this.y = y;
    }

    
    public void fire(){
        image(fire, x, y);
    }
    
    public void show(){
        image(man, x, y);
    }
}


Gunman[] gunmen;
PImage gunman_back;


int gunman_cnt = 0;
int gunman_max = 3;

void gunman(){
    background(color(122, 0, 0));
    image(gunman_back, 0, 0);
    if(Math.random() > 0.5){
        image(gunman_mask, 0, 0);
        for(Gunman m : gunmen){
            m.fire(); 
        }
    }else{
        for(Gunman m : gunmen){
            m.show(); 
        }  
    }

}

void gunman_init(){
    
    gunmen = new Gunman[3];
    gunmen[0] = new Gunman(200, -100); 
    gunmen[1] = new Gunman(0, 0); 
    gunmen[2] = new Gunman(300, 120); 
    gunman_back = loadImage("gunman_back.png");
    
    gunman_mask = createImage(1440, 810, ARGB);
    for(int i = 0; i < gunman_mask.pixels.length; i++) gunman_mask.pixels[i] = color(122, 122, 0, 50);
    gunman_mask.updatePixels();
}
