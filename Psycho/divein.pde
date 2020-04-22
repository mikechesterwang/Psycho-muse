color divein_back = color(122, 0, 0);
int divein_border = 20;
//int divein_x = -1 * (width/2) + 20;
//int divein_y = -1 * (height/2) + 20;;
int divein_x = 100;
int divein_y = 100;
void divein_init(){
    background(divein_back);
}

int i = 0;

void divein(){
    if(divein_x > width/2){
       return; 
    }
    i++;
    fill(0);
    pushMatrix();
    translate(width/2, height/2);
    rotate(i * PI/((float)Math.random()*100));
    rect(divein_x, divein_y, width - 2 * divein_x, height - 2 * divein_y);
    
    if(Math.random() < 0.33){
        fill(divein_back);
    }else if(Math.random() < 0.66){
        fill(color(0, 122, 0));
    }else{
      fill(color(0, 0, 122));
    }
    rect(divein_x + divein_border, divein_y + divein_border, 
        width - 2 * divein_x - 2 * divein_border, height - 2 * divein_y - 2 * divein_border);
    popMatrix();
    divein_x -= 3;
    divein_y -= 3;
}
