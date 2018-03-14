ArrayList<PVector> s, s2, s3, s4, t;
Shape square, square2, square3, square4, triangle;
PTree pTree, pTree2, pTree3, pTree4;

void setup(){
  size(500,500);
  s = new ArrayList<PVector>();
  s2 = new ArrayList<PVector>();
  s3 = new ArrayList<PVector>();
  s4 = new ArrayList<PVector>();
  t = new ArrayList<PVector>();
  fill(0);
  rect(0,0,width,height);
  s.add(new PVector(width/4,height/2-height/4));
  s.add(new PVector(width/2+width/4,height/2-height/4));
  s.add(new PVector(width/2+width/4,height/2+height/4));
  s.add(new PVector(width/4,height/2+height/4));
  
  s2.add(new PVector(width/2+width/4,height/2-height/4));
  s2.add(new PVector(width/4,height/2-height/4));
  s2.add(new PVector(width/4,height/2+height/4));
  s2.add(new PVector(width/2+width/4,height/2+height/4));
  
  s3.add(new PVector(width/2,0));
  s3.add(new PVector(0,0));
  s3.add(new PVector(0,height/2));
  s3.add(new PVector(width/2,height/2));
  
  s4.add(new PVector(width/2,height/2));
  s4.add(new PVector(0,height/2));
  s4.add(new PVector(0,height));
  s4.add(new PVector(width/2,height));
  
  square = new Shape(s);
  square2 = new Shape(s2);
  square3 = new Shape(s3);
  square4 = new Shape(s4);
  
  pTree = new PTree(square);
  pTree2 = new PTree(square2);
  pTree3 = new PTree(square3);
  pTree4 = new PTree(square4);

  
  t.add(new PVector(width/2, 10));
  t.add(new PVector(width, height-10));
  t.add(new PVector(10, height-10));
  triangle = new Shape(t);
}

void draw(){
  //square.display();
  //square.spin();
  pTree.display();
  pTree2.display();
  pTree3.display();
  pTree4.display();
  
  pTree.rotateL();
  pTree2.rotateL();
  pTree3.rotateL();
  pTree4.rotateL();
  
  
  //pTree.rotateL();
  pTree.shrinkL();
  pTree2.shrinkL();
  pTree3.shrinkL();
  pTree4.shrinkL();
 
  saveFrame("new12/####.jpg");
  
}