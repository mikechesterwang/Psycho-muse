PImage bomber_img;
PImage bomb_img;
Bomber[] bombers;
Bomb[] bombs;

class Bomber extends PngObject{
    public Bomber(double x, double y){
        super(x, y, bomber_img);
    }
}

class Bomb extends PngObject{
    public Bomb(double x, double y){
        super(x, y, bomb_img); 
    }
    public void move(float dy){
        super.move(0, dy); 
    }
}

void bomber_init(){
    bomber_img = loadImage("bomber.png");
    for(int x = 0; x < bomber_img.width; x++){
        for(int y = 0; y < bomber_img.height; y++){
            color c = bomber_img.pixels[y * bomber_img.width + x];
            if(alpha(c) == 0){
                bomber_img.pixels[y * bomber_img.width + x] = 0x00000000; 
            }else{
                int neighbor = 0;
                if(x > 0)
                    if(alpha(bomber_img.pixels[y * bomber_img.width + x - 1]) != 0) neighbor += 1;
                if(y > 0)
                    if(alpha(bomber_img.pixels[(y - 1) * bomber_img.width + x]) != 0) neighbor += 1;
                if(x < width - 1)
                    if(alpha(bomber_img.pixels[y * bomber_img.width + (x + 1)]) != 0) neighbor += 1;
                if(y < height - 1)
                    if(alpha(bomber_img.pixels[(y + 1) * bomber_img.width + x]) != 0) neighbor += 1;
                    
                if(neighbor > 3)
                    bomber_img.pixels[y * bomber_img.width + x] = 0xff000000;
            }
        }
    }
    bomber_img.updatePixels();
    
    bomb_img = loadImage("bomb.png");
    for(int x = 0; x < bomb_img.width; x++){
        for(int y = 0; y < bomb_img.height; y++){
            color c = bomb_img.pixels[y * bomb_img.width + x];
            if(alpha(c) == 0){
                bomb_img.pixels[y * bomb_img.width + x] = 0x00000000; 
            }else{
                bomb_img.pixels[y * bomb_img.width + x] = 0xff000000; 
            }
        }
    }
    bomb_img.updatePixels();
    bombers = new Bomber[8];
    // ↙ -550, +300
    // ↘ +650, +300
    bombers[0] = new Bomber(400, -300);
    bombers[1] = new Bomber(-150, 0);
    bombers[2] = new Bomber(400, 300); 
    bombers[3] = new Bomber(-800, -300);
    bombers[4] = new Bomber(-700, 300);
    bombers[5] = new Bomber(150, 600);
    bombers[6] = new Bomber(-1350, 0);
    bombers[7] = new Bomber(-1250, 600); 
    bombs = new Bomb[88];
    int i = 0;
    for(int x = 0; x < 1440; x+=200){ // 8
        for(int y = -800; y < 810; y += 150, i++){ //
            bombs[i] = new Bomb(x, y); 
        }
    }
    background(0);
}

boolean bomber_bomb = false;

void bomber_drop(){
    bomber_bomb = true;
}

void bomber(){
    
    if(bomber_bomb){
        background(color(122, 122, 0));
        bomber_bomb = false;
    }else{
        if(Math.random() > 0.9){
            background(color(122, 122, 0));
        }else{
            background(color(122, 0, 0));
        }
    }
    
    
    for(Bomber b : bombers){
        b.move(2.75, -1.5);
        b.show();
    }
    for(Bomb b : bombs){
        b.move(5);
        b.show();
    }
    
}

void bomber_deinit(){
    bomber_img = null;
    bombers = null;
    bomb_img = null;
    bombs = null;
}
