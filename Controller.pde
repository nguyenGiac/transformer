class Controller{
  TreeManager t,t2,t3,t4;
  ArrayList<TreeManager> trees;
  float incr;
  ArrayList<PVector> s1,s2,s3,s4;
  
  Controller(){
    s1 = new ArrayList<PVector>();
    s1.add(new PVector(width/3,height/3));
    s1.add(new PVector(width*.66666666,height/3));
    s1.add(new PVector(width*.66666666,height*.6666666));
    s1.add(new PVector(width/3,height*.6666666));
    
    s2 = new ArrayList<PVector>();
    
    s2.add(new PVector(width*.66666666,height*.6666666));
    s2.add(new PVector(width/3,height*.6666666));
    s2.add(new PVector(width/3,height/3));
    s2.add(new PVector(width*.66666666,height/3));
    
    s3 = new ArrayList<PVector>();
    
    s3.add(new PVector(width*.66666666,height/3));
    s3.add(new PVector(width/3,height/3));
    s3.add(new PVector(width*.66666666,height/3));
    s3.add(new PVector(width*.66666666,height*.6666666));
    
    s3 = new ArrayList<PVector>();
    
    s3.add(new PVector(width/3,height*.6666666));
    s3.add(new PVector(width/3,height/3));
    s3.add(new PVector(width*.66666666,height/3));
    s3.add(new PVector(width*.66666666,height*.6666666));
    
    s4 = new ArrayList<PVector>();
    
    s4.add(new PVector(width*.66666666,height/3));
    s4.add(new PVector(width*.66666666,height*.6666666));
    s4.add(new PVector(width/3,height*.6666666));
    s4.add(new PVector(width/3,height/3));
    
    t = new TreeManager(new Shape(s1));
    t2 = new TreeManager(new Shape(s2));
    t3 = new TreeManager(new Shape(s3));
    t4 = new TreeManager(new Shape(s4));
    trees = new ArrayList<TreeManager>();
    trees.add(t);
    trees.add(t2);
    trees.add(t3);
    trees.add(t4);
  }
  
  void run(){
    incr++;
    if(checkLoc(trees.get(trees.size()-1))){
      trees.add(new TreeManager(new Shape(trees.get(trees.size()-1).treeArray.get(0).square.getVertices())));
      trees.add(new TreeManager(new Shape(trees.get(trees.size()-1).treeArray.get(0).square2.getVertices())));
      trees.add(new TreeManager(new Shape(trees.get(trees.size()-1).treeArray.get(0).square3.getVertices())));
      trees.add(new TreeManager(new Shape(trees.get(trees.size()-1).treeArray.get(0).square4.getVertices())));
    }
    for(int i = 0; i < trees.size();i++){
     trees.get(i).live();
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