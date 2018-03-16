//i was having trouble keeping track of recursion so I figured I would try to separate some of the code into a new class, like a meta meta class--
//it helps me take care of PTrees which take care of Shapes.
//I'm trying to think about how to organize best because i see that it helps me to understand what exactly is happening.

class TreeManager{
  ArrayList<PTree> treeArray;
  
  float count;
  ArrayList<PVector> sA;
  
  TreeManager(Shape iS){
    ArrayList s = new ArrayList<PVector>();
    for(int i = 0;i < iS.vertices.size();i++){
      s.add(iS.vertices.get(i).copy());
    }
    treeArray = new ArrayList<PTree>();
    Shape square,square2;
    square = new Shape(s);
    square2 = flipFlop(iS);
    
    PTree pTree;
    pTree = new PTree(square.vertices,square2.vertices);
    treeArray.add(pTree);
  }
  
  
  Shape flipFlop(Shape s){
    
    sA = new ArrayList<PVector>();
    sA.add(s.vertices.get(1).copy());
    sA.add(s.vertices.get(0).copy());
    sA.add(s.vertices.get(3).copy());
    sA.add(s.vertices.get(2).copy());
    
    return new Shape(sA);
  }
  
  void live(){
    //every ... steps, add 2 new PTrees to the list
    count++;
    if(count % 20 == 0){
      ArrayList<PVector> s = new ArrayList<PVector>();
      for(int i = 0;i < treeArray.get(treeArray.size()-1).square.vertices.size();i++){
        s.add(treeArray.get(treeArray.size()-1).square.vertices.get(i).copy());
      }
      treeArray.add(new PTree(new Shape(s).vertices,flipFlop(new Shape(s)).vertices));
    }
    
    //go through each PTree instance, make it spin, shrink and display its square
    for(int i = 0;i < treeArray.size();i++){
      if(i % 2 == 0){
       treeArray.get(i).rotateL();
      } else {
       treeArray.get(i).rotateL();
      }
       treeArray.get(i).shrinkL();
       treeArray.get(i).display();
    }
  }
  
}