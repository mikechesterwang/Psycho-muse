class Building{
    
    PImage p;
    
    public Building(){
        p = loadImage("buildings.jpg"); 
        for(int x = 0; x < p.width; x++){
            for(int y = 0; y < p.height; y++){
                color c = p.pixels[y * p.width + x];
                if(blue(c) > 100){
                     p.pixels[y * p.width + x] = color(0, 0, 0, 0);
                }
            }
        }
    }
    
    public void show(){
        image(p, 0, 810 - p.height);
    }
}

Building building;


void building(){
    if(Math.random() > 0.9){
        background(color(122, 122, 0));
    }else{
        background(color(122, 0, 0));
    }
    
    building.show();
}

void building_init(){
    building = new Building();
}
