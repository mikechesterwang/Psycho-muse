class SquareLight{
    int x;
    int r, g, b, a;
    int max;
    int cnt;
    int w = 100;
    int h = 810;
    public SquareLight(int x, color c){
         this.x = x;
         r = (int)red(c);
         g = (int)green(c);
         b = (int)blue(c);
         a = (int)alpha(c);
         max = 20 + (int)(Math.random() * 20);
         cnt = (int)(Math.random() * max);
    }
    
    boolean direction = false;
    public void show(){
        noStroke();
        fill(color(r, g, b, a));
        rect(x, 0, w, h);
        
        if(cnt < 0){
            direction = true;
        }else if(cnt > max){
            direction = false; 
        }
        cnt += direction ? 3 : - 3;
        
        if(direction){
            for(int a = 50, dx = 30; a > 0; a -= 15, dx += 30){
                fill(color(r, g, b, a));
                rect(x - dx, 0, w + 2*dx, h);
            }
        }        
    }
}

class Strings{
     int[] bx = {134, 139, 148, 155, 161, 167};
     int[] by = {546, 560, 572, 585, 597, 615};
     int[] mx = {402, 402, 402, 402, 402, 402};
     int[] my = {462, 477, 489, 502, 516, 529};
     int[] ex = {1223, 1253, 1282, 1316, 1340, 1367};
     int[] ey = {123, 123, 125, 123, 122, 122};
     
     public void static_show(){
         stroke(250);
         strokeWeight(2);
         for(int i = 0; i < 6; ++i){
             line(bx[i], by[i], ex[i], ey[i]);
         }
     }
     
     public void dynamic_show(){
         stroke(250);
         strokeWeight(2);
         for(int i = 0; i < 6; ++i){
             line(bx[i], by[i], mx[i], my[i]);
             line(mx[i], my[i], ex[i], ey[i]);
         }
     }
}

class Guitar{
    PImage p;
    PImage left;
    PImage right;
    Strings s;
    public boolean playing = false;
    public Guitar(){
        p = loadImage("guitar.png");
        left = loadImage("lefthand.png");
        right = loadImage("righthand.png");
        s = new Strings();
    }
    
    public void show(){
        image(p, 0, 0); 
        
        if(playing){
            s.dynamic_show();
            image(right, 0, 100);
        }else{
            s.static_show();
            image(right, 0, 0);
        }
        image(left, 0, 0);  
    }
}

Guitar guitar;
SquareLight[] slights;

void guitar_drop(){
    guitar.playing = false;
}

void guitar_pop(){
    guitar.playing = true;
}

void guitar(){
    background(0);
    for(SquareLight s : slights){
        s.show(); 
    }
    guitar.show();
}

void guitar_init(){
    
    guitar = new Guitar();
    slights = new SquareLight[16];
    int cnt = 0;
    for(int x = -30; x < 1500; x+=100){
        slights[cnt++] = new SquareLight(x, color((int)(Math.random() * 60) + 194, 167 + (int)(Math.random() * 80), 120 + (int)(Math.random() * 110), 50));
    }
}
