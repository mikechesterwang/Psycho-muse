class Subway{
    PImage p;
    PImage mask;
    PImage p_light;
    public Subway(){
        p = loadImage("subway.png");
        p_light = loadImage("subway_light.png");
        mask = createImage(1440, 810, ARGB);
        for(int x = 0; x < 1440; x++){
            for(int y = 0; y < 810; y++){
                mask.pixels[y * mask.width + x] = color(255, 255, 255, 20);
            }
        }
 
    }
    int light_x = -7000;
    public void show_subway(int x, int y){
        light_x = light_x + 250;
        if(light_x > 4000) light_x = -7000;
        if(200 < light_x && light_x < 1400){
            image(mask, 0, 0);
            image(p_light, x, y);
        }else{
            image(p, x, y);
        }
    }
    
    boolean up = false;
    int upstep = 50;
    int upcnt = 0;
    boolean left = false;
    int leftstep = 50;
    int leftcnt = 0;
    public void show(){
        
        for(int repeat = 0; repeat < 5; repeat++){
            for(int i = 255, dr = 0; i > 0; i-= 80, dr+=40){
                fill(color(255, 255, 255, i));
                circle(light_x + repeat*40, 200, 10+dr);
            }
            fill(color(255, 255, 255, 10));
            circle(light_x + repeat*40, 200, 2000);
        }
        
        int x = 0;
        
        if(!left && Math.random() > 0.5){
            left = true;
            leftcnt = 0;
            leftstep = 20 + (int)Math.random() * 30;
        }
        if(left){
           if(leftcnt == leftstep){
               left = false; 
               x = 0;
           }else{
               x = -4;
               leftcnt++;
           }
        }else{
              x = 0;
        }
        
        
        if(!up && Math.random() > 0.5){
            up = true;
            upcnt = 0;
            upstep = 20 + (int)Math.random() * 30;
        }
        if(up){
           if(upcnt == upstep){
               up = false; 
               show_subway(x, 0);
           }else{
               show_subway(x, 7);
               upcnt++;
           }
        }else{
              show_subway(x, 0);
        }
        
        
        
        
       
        
    }
}

Subway subway;

void subway_init(){
    subway = new Subway();
}

void subway(){
    noStroke();
    background(0);
    subway.show();
}
