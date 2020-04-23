static final int show_guitar = -1;
static final int show_statup = 0; 
static final int show_divein = 1; 
static final int show_bomber = 2; 
static final int show_cigarette = 3; 
static final int show_network = 4;
static final int show_computer = 5;
static final int show_robot = 6;
static final int show_dommsday = 7;
static final int show_subway = 8;
static final int show_building = 9;
static final int show_gunman = 10;
static final int show_walk = 11;

void pop(){
  if(show == show_robot){
        robot_pop(); 
  }else if(show == show_guitar){
        guitar_pop(); 
  }
}

void drop(){
    if(show == show_bomber){
        bomber_drop(); 
    }else if(show == show_robot){
        robot_drop(); 
    }else if(show == show_guitar){
        guitar_drop(); 
    }
}

class PngObject{
    
    public float x;
    public float y;
    private PImage p;
    public PngObject(double x, double y, PImage p){
        this.x = (float)x;
        this.y = (float)y;
        this.p = p;
    }
    
    public void move(float dx, float dy){
        this.x += dx;
        this.y += dy;
    }
    
    public void show(){
        image(p, x, y);
    }
}

class Particle{
    public static final float g = 98; 
    public float x;
    public float y;
    public float vx;
    public float vy;
    public float ax;
    public float timeslot;
    private float radius;
    private color core;
    private color shell;
    private boolean die = false;
    public Particle(float x, float y){
        this.x = x;
        this.y = y;
        if(Math.random() > 0.66){
            this.vx = 230 - (float)Math.random()* 70;
            if(Math.random() > 0.33){
                this.vx *= -1;
            }
            
            this.ax = this.vx < 0 ? 2 * g : -2 * g;
        }else{
            this.vx = (float)Math.random() * 40 - 20;
            this.ax = 0;
        }
        
        this.vy = (float)Math.random() * 200;
        this.radius = 50;
        
        this.timeslot = 0.03;
        this.core = color(232, (int)(Math.random() * 140), 10, (int)(Math.random() * 255));
        this.shell = color(232, (int)(Math.random() * 140), 10, (int)(Math.random() * 255));
    }
    
    public void move(){
        radius -= 0.5;
      
        vy += timeslot * g;
        vx += timeslot * ax;
        
        x += timeslot * vx;
        y += -1 * timeslot * vy;
    }
    
    public void show(){
      
        if(radius < 3){
            die = true;
            return; 
        }
        
        if(radius < 35){
            if(Math.random() > 0.8){
                int gray = (int)(Math.random() * 200);
                core = color(gray, gray, gray, (int)(Math.random() * 255)); 
                gray = (int)(Math.random() * 200);
                shell = color(gray, gray, gray, (int)(Math.random() * 255)); 
            }else{
                core = color(232, (int)(Math.random() * 140), 10, (int)(Math.random() * 255));
                shell = color(232, (int)(Math.random() * 140), 10, (int)(Math.random() * 255));
            }
        }

        fill(core);
        circle(x, y, radius);
        fill(shell);
        circle(x, y, radius/2);
    }
}

class Flame{
    public float x;
    public float y;
    public float size;
    public boolean die = false;
    private Particle[] ps;
    public Flame(float x, float y){
        ps = new Particle[30];
        for(int i = 0; i < ps.length; i++){
            ps[i] = new Particle(x, y);   
        }
    }
    
    public void step(){
         for(Particle p : ps){
             p.move();
             p.show();
             if(p.die){
                  die = true;
                  break;
             }
         }
    }
}

class Fire{
    private Flame[] flames;
    private final int max;
    private int cnt;
    private float x;
    private float y;
    private final int dense;
    public Fire(float x, float y, int size){
         this.x = x;
         this.y = y;
         dense = 100 / size;
         max = size * dense;
         cnt = 0;
         flames =  new Flame[size];
         for(int i = 0; i < flames.length; i++){
             flames[i] = new Flame(x, y); 
         }
    }
    
    public void step(){
        cnt = (cnt + 1) % max;
        if(cnt % dense == 0){
            flames[cnt/dense] = new Flame(x, y);
        }
        for(Flame f : flames){
            f.step(); 
        }
    }
    
}
