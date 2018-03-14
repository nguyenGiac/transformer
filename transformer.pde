ArrayList<PVector> s,t;
Shape square, triangle;
PTree pTree;

void setup(){
  size(500,500);
  s = new ArrayList<PVector>();
  t = new ArrayList<PVector>();
  fill(0);
  rect(0,0,width,height);
  s.add(new PVector(0,0));
  s.add(new PVector(width, 0));
  s.add(new PVector(width,height));
  s.add(new PVector(0,height));
  
  square = new Shape(s);
  pTree = new PTree(square);
  
  t.add(new PVector(width/2, 10));
  t.add(new PVector(width, height-10));
  t.add(new PVector(10, height-10));
  triangle = new Shape(t);
}

void draw(){
  //square.display();
  //square.spin();
  pTree.display();
  pTree.rS();
  //pTree.shrinkL();
  //pTree.rotateL();
  //saveFrame("new7/####.jpg");
  
}
