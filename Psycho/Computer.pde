class Fan{
    private float x;
    private float y;
    private float angle;
    private float da;
    private color backcolor;
    private float size;
    public Fan(float x, float y, int size){
        this.x = x;
        this.y = y;
        this.angle = 0;
        this.size = size;
        this.da = (float)(Math.random() * PI/10);
        this.backcolor = color(255);
    }
    
    public void backcolor(color backcolor){
        this.backcolor = backcolor;
    }
    
    public void step(){
        pushMatrix();
        translate(x, y);
        angle += da;
        rotate(angle);
        fill(backcolor);
        circle(0, 0, size);
        fill(0);
        rect(0, 0, size, size / 4.5);
        rect(0, 0, size / 4.5, -size);
        rect(0, 0, -size, -size / 4.5);
        rect(0, 0, -size / 4.5, size);
        popMatrix();
    }
}

class Computer{
    private float x;
    private float y;
    private float w;
    private float h;
    private String[] content;
    private int cnt = 0;
     
    public Computer(float x, float y){
        this.x = x;
        this.y = y;
        this.w = 800;
        this.h = 600;
        this.cnt = 0;
        content = new String[15];
        content[0] = "> def finalize(contrylist):";
        content[1] = ">     assert contrylist = ALL";
        content[2] = ">     new_products = [populism(c, True) for c in contrylist]";
        content[3] = ">     profit = simulator(new_products).start()";
        content[4] = ">     getProfit(profit)";
        content[5] = ">";
        content[6] = "/home/user_capatalist/simulator> python warr.py";
        content[7] = "Permission denied.";
        content[8] = "/home/user_capatalist/simulator> sudo python warr.py";
        content[9] = "[INFO] [15%] Initialize world... ";
        content[10] = "[INFO] [17%] Attach to real time system.";
        content[11] = "[INFO] [19%] Begin.";
        content[12] = "[WARN] Failed to run simulation.";
        content[13] = "[ERROR] Failed to activate save mode.";
        content[14] = "[FATAL] System down.";
        textSize(16);
        textAlign(LEFT);
    }
    
    public void step(){
        
        
        fill(color(42, 48, 128));
        rect(x, y, w, h);
        fill(color(21, 24, 64));
        rect(x + 50, y + 50, w - 100, h - 100);
        fill(color(0, 255, 0));
        
        if(Math.random() > 0.9)
            return;
        
        for(int i = 0; i <= cnt && i<1500; i+=100){           
            fill(color(0, 255, 0));
            text(content[i/100], x + 60, y + 90 + (i/100)*30);
        }
        
        cnt += 7;
    }
   
}

Computer c;
PImage light;
int maxalpha = 155;
Fan[] fans;

void computer_init(){
    noStroke();
    c = new Computer(320, 20);
    light = createImage(1440, 810, ARGB);
    
    for(int x = 0; x < 1440; x++){
        for(int y = 0; y < 810; y++){
            light.pixels[y * light.width + x] = color(255, 252, 79, 10);
        }
    }
      
    for(int x = 0; x < 800; x++){
        for(int y = 0; y < 800; y++){
             int alpha = 255;
             if(x + y <= 800){
                 alpha = maxalpha - (int)((x + y)*1.0 / 800.0 * maxalpha) + 10; 
                 light.pixels[y * light.width + x] = color(255, 252, 79, alpha);
             }
        }
    }
    light.updatePixels();
    
    fans = new Fan[12];
    int cnt = 0;
    for(int x = 0; x < 1600; x+=300){ // 0 300 600 900 1200 1500
        for(int y = 100; y < 600; y+=300){ // 2
             fans[cnt++] = new Fan(x, y, 200);
        }
    }
}

void computer(){
    background(0);
    for(Fan f : fans){
        if(Math.random() > 0.9){
            f.backcolor(color(122, 122, 0));
        }else{
            f.backcolor(color(122, 0, 0));
        }
        f.step(); 
    }
    c.step();
    
    if(Math.random() > 0.05){
        maxalpha = (int)(Math.random() * 235);
        image(light, 0, 0);
    }
    
}
