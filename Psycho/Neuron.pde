class Neuron{
    public PImage neuron;
    public int r1 = 342425;
    public int r2 = 0;
    public Neuron(){
        neuron = loadImage("neuron.png");
        for(int x = 0; x < neuron.width; x++){
            for(int y = 0; y < neuron.height; y++){
                color c = neuron.pixels[y * neuron.width + x];
                if(alpha(c) == 0) continue;
                float ratio = ((x - 720)*(x - 720) + (y - 405)*(y - 405))*1.0/(720*720 + 405*405);
                if(Math.random() > 0.7)
                    neuron.pixels[y * neuron.width + x] = color(0,0,0,0);
                else
                    neuron.pixels[y * neuron.width + x] = color(0, 255 - 255 * ratio, 0, 255);
            }  
        }
    }
    
    public void pulse(int counter){
        for(int x = 0; x < width; x++){
            for(int y = 0; y < height; y++){
                color c = neuron.pixels[y * neuron.width + x];
                if(alpha(c) == 0) continue;
                float r = (x - 720)*(x - 720) + (y - 405)*(y - 405);
                if(counter< r && r < counter + 10000){
                   set(x, y, color(255, 255, 255, 255));
                }
            }    
        }
    }
    
    public void show(){
        image(neuron, 0, 0); 
        r1 = (r1 + 7000) % 682425;
        r2 = (r2 + 7000) % 682425;
        pulse(r1);
        pulse(r2);
        
    }
}

Neuron neuron;

int neuron_count = 0;

void neuron(){
    neuron_count = (neuron_count + 1) % 120;
    if(neuron_count < 30){
        background(0);
    }else if(neuron_count < 60){
        background(10);
    }else if(neuron_count < 90){
        background(20);
    }else{
        background(10);
    }
    
    neuron.show();
}

void neuron_init(){
    neuron = new Neuron(); 
}
