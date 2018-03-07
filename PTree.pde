class PTree{
  Shape square;
  PVector v;
  PTree(){
    ArrayList<PVector> s = new ArrayList<PVector>();
    PVector a = new PVector(width/2-100,height/2-100);
    PVector b = new PVector(width/2+100,height/2-100);
    PVector c = new PVector(width/2+100,height/2+100);
    PVector d = new PVector(width/2-100,height/2+100);
    v = new PVector();
    s.add(a);
    s.add(b);
    s.add(c);
    s.add(d);
    square = new Shape(s);
  }
  
  void rightAngle(){
     PVector n = new PVector();
     n = 
  }
  
  void display(){
    square.display();
  }
}
