Network network;

class Joint{
     private float x;
     private float y;
     private color core;
     private color shell;
     private float vx;
     private float vy;
     private float ax;
     private float ay;
     private float timeslot = 0.5;
     public Joint(int x, int y){
          this.x = x;
          this.y = y;
          core = color(13, (int)(Math.random() * 190) + 60,232);
          shell = color(13, (int)(Math.random() * 190) + 60,232, (int)(Math.random() * 150));
          this.vx = (float)Math.random() - 0.5;
          this.vy = (float)Math.random() - 0.5;
          this.ax = (float)Math.random() - 0.5;
          this.ay = (float)Math.random() - 0.5;
     }
     
     
     public void show(){
          this.ax = (float)Math.random() - 0.5;
          this.ay = (float)Math.random() - 0.5;
         
          vx += timeslot * ax;
          vy += timeslot * ay;
          
          x += timeslot * vx;
          y += timeslot * vy;
       
          fill(core);
          circle(x, y, 30);
          fill(shell);
          circle(x, y, 50);
     }
     
     
}

class Network{
     private Joint[][] js;
     public final static int mx = 25;
     public final static int my = 25;
     
     public Network(){
         js = new Joint[mx][my];
         for(int x = 0; x < mx; x++){
             for(int y = 0; y < my; y++){
                 js[x][y] = new Joint(-400 + x*90, -400 + y*80);     
             }
         }
     }
     
     public void step(){
          for(Joint[] jl : js){
              for(Joint j : jl){
                  j.show();
              }
          }
          stroke(color(255, 255, 255, 50));
          strokeWeight(2);
          for(int x = 0; x < mx; x++){
              for(int y = 0; y < my; y++){
                  Joint p = js[x][y];
                  Joint n; // neighbor
                  if(x > 0){
                      n = js[x-1][y];
                      fill(color(13, (int)(Math.random() * 190) + 60,232));
                      line(n.x, n.y, p.x, p.y); 
                  }
                  if(y > 0){
                      n = js[x][y-1];
                      fill(color(13, (int)(Math.random() * 190) + 60,232));
                      line(n.x, n.y, p.x, p.y); 
                  }
                  if(x < mx - 1){
                      n = js[x+1][y];
                      fill(color(13, (int)(Math.random() * 190) + 60,232));
                      line(n.x, n.y, p.x, p.y); 
                  }
                  if(y < my - 1){
                      n = js[x][y+1];
                      fill(color(13, (int)(Math.random() * 190) + 60,232));
                      line(n.x, n.y, p.x, p.y); 
                  }
              }
          }
     }

}

void network_init(){
    background(0);
    network = new Network();
}

void network(){
    if(Math.random() > 0.95){
        background(20); 
    }else{
        background(0);
    }
    
    network.step();
}
