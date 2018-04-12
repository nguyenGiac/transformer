//i was having trouble keeping track of recursion so I figured I would try to separate some of the code into a new class, like a meta meta class--
//it helps me take care of Trees which take care of Shapes.
//I'm trying to think about how to organize best because i see that it helps me to understand what exactly is happening.

class TreeManager{
  ArrayList<Tree> treeArray;
 
  float count,rotateAmt,scaleAmt,rWalk,sWalk;
  ArrayList<PVector> sA;
  
  TreeManager(Shape iS){
    ArrayList s = new ArrayList<PVector>();
    
    for(int i = 0;i < iS.vertices.size();i++){
      s.add(iS.vertices.get(i).copy());
    }
    
    treeArray = new ArrayList<Tree>();
    Shape square,square2,square3,square4;
    square = new Shape(s);
    rotateAmt = 333;
    scaleAmt = .3333;
    square2 = topLeft(new Shape(iS.getVertices()));
    square3 = bottomLeft(new Shape(iS.getVertices()));
    square4 = bottomRight(new Shape(iS.getVertices()));
    
    Tree pTree;
    pTree = new Tree(square.getVertices(),
                      square2.getVertices(),
                      square3.getVertices(),
                      square4.getVertices(),
                      rotateAmt,scaleAmt);
    treeArray.add(pTree);
  }
  
  void addTree(Tree p){
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
  
  void live(int linesOrDots){
    //every ... steps, add 2 new Trees to the list
    count++;
    //rWalk += .1;
    //sWalk += .4;
    //rotateAmt += sin(rWalk);
    //scaleAmt += sin(sWalk);
    if(count % 2 == 0){
      ArrayList<PVector> s = new ArrayList<PVector>();
      for(int i = 0;i < treeArray.get(0).square.vertices.size();i++){
        s.add(treeArray.get(treeArray.size()-1).square.getVertices().get(i).copy());
      }
      
      treeArray.add(new Tree(
                      new Shape(s).getVertices(),
                      topLeft(new Shape(s)).getVertices(),
                      bottomRight(new Shape(s)).getVertices(),
                      bottomLeft(new Shape(s)).getVertices(),
                      rotateAmt,scaleAmt));
                     
      ArrayList<PVector> s2 = new ArrayList<PVector>();
       for(int i = 0;i < treeArray.get(0).square2.vertices.size();i++){
        s2.add(treeArray.get(treeArray.size()-1).square.getVertices().get(i).copy());
      }
      
      treeArray.add(new Tree(
                      new Shape(s2).getVertices(),
                      topLeft(new Shape(s2)).getVertices(),
                      bottomRight(new Shape(s2)).getVertices(),
                      bottomLeft(new Shape(s2)).getVertices(),
                      rotateAmt,scaleAmt));
                      
       ArrayList<PVector> s3 = new ArrayList<PVector>();
       for(int i = 0;i < treeArray.get(0).square3.vertices.size();i++){
        s3.add(treeArray.get(treeArray.size()-1).square.getVertices().get(i).copy());
      }
      
      treeArray.add(new Tree(
                      new Shape(s3).getVertices(),
                      topLeft(new Shape(s3)).getVertices(),
                      bottomRight(new Shape(s3)).getVertices(),
                      bottomLeft(new Shape(s3)).getVertices(),
                      rotateAmt,scaleAmt));
                      
       ArrayList<PVector> s4 = new ArrayList<PVector>();
       for(int i = 0;i < treeArray.get(0).square4.vertices.size();i++){
        s4.add(treeArray.get(treeArray.size()-1).square.getVertices().get(i).copy());
      }
      
      treeArray.add(new Tree(
                      new Shape(s4).getVertices(),
                      topLeft(new Shape(s4)).getVertices(),
                      bottomRight(new Shape(s4)).getVertices(),
                      bottomLeft(new Shape(s4)).getVertices(),
                      rotateAmt,scaleAmt));
      
    
    }
    //go through each Tree instance, make it spin, shrink and display its square
    for(int i = 0;i < treeArray.size();i++){
      if(treeArray.get(i).isTooSmall()){
         treeArray.get(i).scaleAmt *= -1;
         treeArray.get(i).rotateAmt *= -1;
      }  if(treeArray.get(i).isTooBig()){
         treeArray.get(i).scaleAmt *= -1;
         treeArray.get(i).rotateAmt *= -1;
      }  
      treeArray.get(i).rotater();
      treeArray.get(i).scaler();
      //treeArray.get(i).changeScaler(-.00000013);
      //treeArray.get(i).changeRotater(.0000041);
      //treeArray.get(i).moveUpAndDown(sin(rWalk)/10);
      //treeArray.get(i).moveSideToSide(cos(rWalk)/10);
      treeArray.get(i).display(linesOrDots);
      
    }
  
  }
}