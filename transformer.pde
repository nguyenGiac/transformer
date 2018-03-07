ArrayList<PVector> s,t;
Shape square, triangle;
PTree pTree;

void setup(){
  size(500,500);
  s = new ArrayList<PVector>();
  t = new ArrayList<PVector>();
  pTree = new PTree();
  s.add(new PVector(10,10));
  s.add(new PVector(width-10,10));
  s.add(new PVector(width-10,height-10));
  s.add(new PVector(10,height-10));
  
  square = new Shape(s);
  
  t.add(new PVector(width/2, 10));
  t.add(new PVector(width, height-10));
  t.add(new PVector(10, height-10));
  triangle = new Shape(t);
}

void draw(){
  square.display();
  square.spin();
  pTree.display();
  triangle.display();
  triangle.spin();
}
