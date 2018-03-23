//i was having trouble keeping track of recursion so I figured I would try to separate some of the code into a new class, like a meta meta class--
//it helps me take care of PTrees which take care of Shapes.
//I'm trying to think about how to organize best because i see that it helps me to understand what exactly is happening.

class TreeManager{
  ArrayList<PTree> treeArray;
 
  float count,rotateAmt,scaleAmt,rWalk,sWalk;
  ArrayList<PVector> sA;
  
  TreeManager(Shape iS){
    ArrayList s = new ArrayList<PVector>();
    for(int i = 0;i < iS.vertices.size();i++){
      s.add(iS.vertices.get(i).copy());
    }
    treeArray = new ArrayList<PTree>();
    Shape square,square2,square3,square4;
    square = new Shape(s);
    rotateAmt = .05;
    scaleAmt = .0005;
    square2 = topLeft(new Shape(iS.getVertices()));
    square3 = bottomLeft(new Shape(iS.getVertices()));
    square4 = bottomRight(new Shape(iS.getVertices()));
    
    PTree pTree;
    pTree = new PTree(square.getVertices(),
                      square2.getVertices(),
                      square3.getVertices(),
                      square4.getVertices(),
                      rotateAmt,scaleAmt);
    treeArray.add(pTree);
  }
  
  
  void addPTree(PTree p){
    treeArray.add(p);
  }
  
  
  Shape topLeft(Shape s){
    
    sA = new ArrayList<PVector>();
    sA.add(s.vertices.get(1).copy());
    sA.add(s.vertices.get(0).copy());
    sA.add(s.vertices.get(3).copy());
    sA.add(s.vertices.get(2).copy());
    
    return new Shape(sA);
  }
  
  Shape bottomRight(Shape s){
    
    sA = new ArrayList<PVector>();
    sA.add(s.vertices.get(2).copy());
    sA.add(s.vertices.get(1).copy());
    sA.add(s.vertices.get(0).copy());
    sA.add(s.vertices.get(3).copy());
    
    return new Shape(sA);
  }
  
  Shape bottomLeft(Shape s){
    
    sA = new ArrayList<PVector>();
    sA.add(s.vertices.get(3).copy());
    sA.add(s.vertices.get(2).copy());
    sA.add(s.vertices.get(1).copy());
    sA.add(s.vertices.get(0).copy());
    
    return new Shape(sA);
  }
  
  void live(){
    //every ... steps, add 2 new PTrees to the list
    count++;
    rWalk += .01;
    sWalk += .04;
    rotateAmt += sin(rWalk);
    scaleAmt += sin(sWalk);
    
    if(count % 20 == 0){
      ArrayList<PVector> s = new ArrayList<PVector>();
      for(int i = 0;i < treeArray.get(0).square.vertices.size();i++){
        s.add(treeArray.get(treeArray.size()-1).square.vertices.get(i).copy());
        //s.add(treeArray.get(treeArray.size()-1).square2.vertices.get(i).copy());
        //s.add(treeArray.get(treeArray.size()-1).square3.vertices.get(i).copy());
        //s.add(treeArray.get(treeArray.size()-1).square4.vertices.get(i).copy());
      }
      treeArray.add(new PTree(
                      new Shape(s).getVertices(),
                      topLeft(new Shape(s)).getVertices(),
                      bottomRight(new Shape(s)).getVertices(),
                      bottomLeft(new Shape(s)).getVertices(),
                      rotateAmt,scaleAmt));
    }
    
    //go through each PTree instance, make it spin, shrink and display its square
    for(int i = 0;i < treeArray.size();i++){
      treeArray.get(i).rotateL();
      treeArray.get(i).shrinkL();
      treeArray.get(i).moveUpAndDown(sin(rWalk)/50);
      treeArray.get(i).moveSideToSide(cos(rWalk)/50);
      treeArray.get(i).display();
      if(treeArray.get(i).isTooSmall()){
         treeArray.get(i).scaleAmt *= -1;
         treeArray.get(i).rotateAmt *= -1;
      }  else if(treeArray.get(i).isTooBig()){
         treeArray.get(i).scaleAmt *= -1;
         treeArray.get(i).rotateAmt *= -1;
      }  
    }
  
  }
}