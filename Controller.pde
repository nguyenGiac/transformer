class Controller{
  TreeManager t,t2,t3,t4;
  ArrayList<TreeManager> trees;
  float incr;
  ArrayList<PVector> s1,s2,s3,s4;
  
  Controller(){
    s1 = new ArrayList<PVector>();
    s1.add(new PVector(width/2-10,height/2-10));
    s1.add(new PVector(width/2+10,height/2-10));
    s1.add(new PVector(width/2+10,height/2+10));
    s1.add(new PVector(width/2-10,height/2+10));
    
    t = new TreeManager(new Shape(s1));
    trees = new ArrayList<TreeManager>();
    trees.add(t);
  }
  
  void run(int linesOrDots){
    incr++;
    if(trees.size() > 1){
      trees.add(new TreeManager(new Shape(trees.get(trees.size()-1).treeArray.get(trees.size()-1).square.getVertices())));
      //trees.add(new TreeManager(new Shape(trees.get(trees.size()-1).treeArray.get(trees.size()-1).square2.getVertices())));
      //trees.add(new TreeManager(new Shape(trees.get(trees.size()-1).treeArray.get(trees.size()-1).square3.getVertices())));
      //trees.add(new TreeManager(new Shape(trees.get(trees.size()-1).treeArray.get(trees.size()-1).square4.getVertices())));
    }
    for(int i = 0; i < trees.size();i++){
      trees.get(i).live(linesOrDots);
    }
  }
  
  boolean checkLoc(TreeManager t){
      if(t.treeArray.get(0).square.getVertices().get(0).x > width ||
         t.treeArray.get(0).square.getVertices().get(0).x < 0 ||
         t.treeArray.get(0).square.getVertices().get(0).y < 0 ||
         t.treeArray.get(0).square.getVertices().get(0).y > height){
            return true;
         } else return false;
}
  
}