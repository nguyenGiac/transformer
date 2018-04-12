Controller c;

void setup(){
  size(800,800);
  fill(0);
  rect(0,0,width,height);
  c = new Controller();
 
}

void draw(){
   c.run(1);
  //saveFrame("mandalaGrow4/####.jpg");
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      saveFrame("snapshots/####.jpg");
    }
  }
}