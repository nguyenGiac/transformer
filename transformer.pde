TreeManager t;
ArrayList<TreeManager> trees;
float incr;

void setup(){
  size(600,600);
  fill(0);
  rect(0,0,width,height);
  ArrayList<PVector> s1;
  s1 = new ArrayList<PVector>();
  s1.add(new PVector(width/4,height/2));
  s1.add(new PVector(width/2+width/4,height/2));
  s1.add(new PVector(width/2+width/4,height));
  s1.add(new PVector(width/4,height));
  t = new TreeManager(new Shape(s1));
  trees = new ArrayList<TreeManager>();
  trees.add(t);
}

void draw(){
  incr++;
  //here i create two more trees every so often by checking incr % ...
  if(incr % 20 == 0){
    trees.add(new TreeManager(new Shape(trees.get(trees.size()-1).treeArray.get( 0).square.getVertices())));
    trees.add(new TreeManager(new Shape(trees.get(trees.size()-1).treeArray.get(0).square2.getVertices())));
  }
  for(int i = 0;i < trees.size();i++){
      trees.get(i).live();
  }
  saveFrame("starfish/####.jpg");
}