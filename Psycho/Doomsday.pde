class Doomsday{
    PImage normal;
    PImage burn;
    PImage mask;
    public Doomsday(){
        normal = loadImage("world_normal.jpg"); 
        burn = loadImage("world_burn.jpg");
        mask = createImage(1440, 810, ARGB);
        for(int x = 0; x < mask.width; x++){
            for(int y = 0; y < mask.height; y++){
                if((x - 720)*(x - 720) + (y - 405)*(y - 405) < 400*400){
                    mask.pixels[y * mask.width + x] = color(0, 0, 0, 0); 
                }else{
                    mask.pixels[y * mask.width + x] = color(0, 0, 0, 255); 
                }
            }
        }

        for(int x = 0; x < burn.width; x++){
            for(int y = 0; y < burn.height; y++){
                color c = burn.pixels[y * burn.width + x];
                if(red(c) + blue(c) + green(c) > 253 * 3){
                     burn.pixels[y * burn.width + x] = color(200, 200, 0);
                }else{
                     burn.pixels[y * burn.width + x] = color(122, 0, 0);
                }
            }
        }
        burn.updatePixels();
    }
    
    int x = 0;
    int cnt = -10;
    boolean clockwise = true;
    public void show(){
        image(normal, x, 0);
        image(burn, 170 + x - normal.width, 0);
        image(mask, 0, 0);
        x += 3;
        pushMatrix();
        fill(0);
        translate(720, 405);
        circle(0, -300, 100);
        rotate(-1 * PI/8);
        circle(0, -300, 100);
        rotate(-1 * PI/8);
        circle(0, -300, 100);
        rotate(-1 * PI/8);
        circle(0, -300, 100);
        popMatrix();
        
        pushMatrix();
        fill(255);
        translate(720, 405);
        circle(0, 0, 50);
        rotate(cnt * PI/72);
        rect(0, -10, 350, 10);
        popMatrix();
        
        if(cnt == -60){
            clockwise = true; 
        }else if(cnt == -10){
            clockwise = false; 
        }
        cnt += clockwise ? 1 : -1;
    }
  
}

Doomsday d;

void doomsday_init(){
    d = new Doomsday();
}

void doomsday(){
    d.show();
}
