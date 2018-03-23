Controller c;

void setup(){
  size(800,600);
  fill(0);
  rect(0,0,width,height);
  c = new Controller();
}

void draw(){
  c.run();
 //saveFrame("galax13/####.jpg");
}