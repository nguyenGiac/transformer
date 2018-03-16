TreeManager t;

void setup(){
  size(500,500);
  fill(0);
  rect(0,0,width,height);
  ArrayList<PVector> s1;
  s1 = new ArrayList<PVector>();
  s1.add(new PVector(width/4,height/2-height/4));
  s1.add(new PVector(width/2+width/4,height/2-height/4));
  s1.add(new PVector(width/2+width/4,height/2+height/4));
  s1.add(new PVector(width/4,height/2+height/4));
  t = new TreeManager(new Shape(s1));
}

void draw(){
  t.live();
  //saveFrame("weave/####.jpg");
}