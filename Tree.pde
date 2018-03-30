//this class is my attempt to collect the rules neccessary for building fractals from shapes
//it began with my desire to reproduce what I saw being called a 'pythagoras tree'-- just a tree made of squares.

//so, I wanted to draw a square, then draw two more squares that rotate 45 degrees and -45 degrees from
//both vertices of the top of the square.

//I have methods that allow me to do a similarity transformation, or 'rotate and spin' all in one swoop,
///I learned that a similarity transformation is a special kind of affine transformation that has no 'shear'
//but i also split the rotate and scale transformations into two methods so that it is easy for me to 
//choose from where the shape will rotate

//one of the ways I rotate and scale is with rotater() and scaler()

//I learned how to rotate a shape from one of its vertices, I found a description of a formula to do this 
//in the one of the books on fractals i read this quarter.
//so the rotater() method rotates the shape from 
//the first vertex assigned. to make a shape that rotates on a different corner, we just build it in a different order

//the second way I rotate and scale my shape uses a formula that involve what I saw called "IFS codes".
//i translated the formula into the "Shape" class so that we just supply two values for rotation of x and y
//and two values for scaling of x and y
//this then rotates the shape using (0,0) as origin (i wasn't sure how to select the origin using this technique!)

//i'm in the process of trying to make recursion properly so that each time the square rotates and shrinks,
//it produces two more squares that rotate, shrink, then produce two more...
//i'm getting so close but I have to wrap things and be sure that I explain what I have learned this quarter!

class Tree{
  Shape square,square2,square3,square4;
  float angle,incr,scaleAmt,rotateAmt;
  ArrayList<PVector> sA;
  
  Tree(ArrayList<PVector> s,
        ArrayList<PVector> s2,
        ArrayList<PVector> s3,
        ArrayList<PVector> s4,
        float rA,
        float sA){
    ArrayList<PVector> shapeArray1 = new ArrayList<PVector>();
    ArrayList<PVector> shapeArray2 = new ArrayList<PVector>();
    ArrayList<PVector> shapeArray3 = new ArrayList<PVector>();
    ArrayList<PVector> shapeArray4 = new ArrayList<PVector>();
    for(int i = 0; i < s.size();i++){
      shapeArray1.add(s.get(i).copy());
    }
    for(int i = 0; i < s2.size();i++){
      shapeArray2.add(s2.get(i).copy());
    }
    for(int i = 0; i < s3.size();i++){
      shapeArray3.add(s3.get(i).copy());
    }
    for(int i = 0; i < s4.size();i++){
      shapeArray4.add(s4.get(i).copy());
    }
    square = new Shape(shapeArray1);
    square2 = new Shape(shapeArray2);
    square3 = new Shape(shapeArray3);
    square4 = new Shape(shapeArray4);
    scaleAmt = sA;
    rotateAmt = rA;
  }
  
  //i use this to check if we should continue processing this particular Tree
  //i check the magnitude of the vector resulting from subtracting the top two vertices
  //from each other. i had to use the PVector copy() method or else i would actually
  //move the vector if i simply used '
  boolean isTooSmall(){
    if(square.vertices.get(0).copy().sub(square.vertices.get(1)).mag() < 5){
       return true; 
    } else {
      return false;
    }
  }
  
   boolean isTooBig(){
    if(square.vertices.get(0).copy().sub(square.vertices.get(1)).mag() > width/3){
       return true; 
    } else {
      return false;
    }
  }
  
  ArrayList<Shape> returnShapes(){
     ArrayList<Shape> shapes = new ArrayList<Shape>();
     shapes.add(square);
     shapes.add(square2);
     shapes.add(square3);
     shapes.add(square4);
     return shapes;
  }
  
  void rS(){
      square.rotateAndScale(.001,.001,.9991,.9991);
  }
    
    void changeScaler(float s){
      scaleAmt += s;
    }
    
     void changeRotater(float s){
      rotateAmt += s;
    }
    
    //rotate from the first vertex
    void rotater(){
       for(int i = 0; i < square.getVertices().size();i++){
         square.rotateFromPoint(square.vertices.get(0).copy(),rotateAmt);
         square2.rotateFromPoint(square2.vertices.get(0).copy(),-rotateAmt);
         square3.rotateFromPoint(square3.vertices.get(0).copy(),-rotateAmt);
         square4.rotateFromPoint(square4.vertices.get(0).copy(),rotateAmt);
       }
    }
    
    //scale from the first vertex
    void scaler(){
       for(int i = 1; i < square.getVertices().size();i++){
         square.scaler(square.getVertices().get(0).copy(),-scaleAmt);
         square2.scaler(square2.getVertices().get(0).copy(),-scaleAmt);
         square3.scaler(square3.getVertices().get(0).copy(),-scaleAmt);
         square4.scaler(square4.getVertices().get(0).copy(),-scaleAmt);
       }
    }
    
    void moveUpAndDown(float yAmt){
      for(int i = 0; i < square.getVertices().size();i++){
         square.moveUpAndDown(yAmt);
         square2.moveUpAndDown(yAmt);
         square3.moveUpAndDown(yAmt);
         square.moveUpAndDown(yAmt);
       }
    }
    
    void moveSideToSide(float xAmt){
      for(int i = 0; i < square.getVertices().size();i++){
         square.moveSideToSide(xAmt);
         square2.moveSideToSide(xAmt);
         square3.moveSideToSide(xAmt);
         square4.moveSideToSide(xAmt);
       }
    }
 
  
  void display(int linesOrDots){
    square.display(linesOrDots);
    square2.display(linesOrDots);
    square3.display(linesOrDots);
    square4.display(linesOrDots);
  }
}