//this class is my attempt to collect the rules neccessary for building fractals from shapes
//it began with my desire to reproduce what I saw being called a 'pythagoras tree'-- just a tree made of squares.

//so, I wanted to draw a square, then draw two more squares that rotate 45 degrees and -45 degrees from
//both vertices of the top of the square.

//I have methods that allow me to do a similarity transformation, or 'rotate and spin' all in one swoop,
///I learned that a similarity transformation is a special kind of affine transformation that has no 'shear'
//but i also split the rotate and scale transformations into two methods so that it is easy for me to 
//choose from where the shape will rotate

//one of the ways I rotate and scale is with rotateL() and shrinkL()

//I learned how to rotate a shape from one of its vertices, I found a description of a formula to do this 
//in the one of the books on fractals i read this quarter.
//so the rotateL() method rotates the shape from 
//the first vertex assigned. to make a shape that rotates on a different corner, we just build it in a different order

//the second way I rotate and scale my shape uses a formula that involve what I saw called "IFS codes".
//i translated the formula into the "Shape" class so that we just supply two values for rotation of x and y
//and two values for scaling of x and y
//this then rotates the shape using (0,0) as origin (i wasn't sure how to select the origin using this technique!)

//i'm in the process of trying to make recursion properly so that each time the square rotates and shrinks,
//it produces two more squares that rotate, shrink, then produce two more...
//i'm getting so close but I have to wrap things and be sure that I explain what I have learned this quarter!

class PTree{
  Shape square,square2;
  float angle,incr;
  ArrayList<PVector> sA;
  
  PTree(ArrayList<PVector> s,ArrayList<PVector> s2){
    ArrayList<PVector> shapeArray1 = new ArrayList<PVector>();
    ArrayList<PVector> shapeArray2 = new ArrayList<PVector>();
    for(int i = 0; i < s.size();i++){
      shapeArray1.add(s.get(i).copy());
      shapeArray2.add(s2.get(i).copy());
    }
    square = new Shape(shapeArray1);
    square2 = new Shape(shapeArray2);
  }
  
  //i use this to check if we should continue processing this particular PTree
  //i check the magnitude of the vector resulting from subtracting the top two vertices
  //from each other. i had to use the PVector copy() method or else i would actually
  //move the vector if i simply used '
  boolean isTooSmall(){
    if(square.vertices.get(0).copy().sub(square.vertices.get(1)).mag() < 3){
       return true; 
    } else {
      return false;
    }
  }
  
  ArrayList<Shape> returnShapes(){
     ArrayList<Shape> shapes = new ArrayList<Shape>();
     shapes.add(square);
     shapes.add(square2);
     return shapes;
  }
  
  void rS(){
      square.rotateAndScale(.001,.001,.9991,.9991);
  }
    
    //rotate from the first vertex
    void rotateL(){
       for(int i = 0; i < square.getVertices().size();i++){
         square.rotateFromPoint(square.vertices.get(0),-.008);
         square2.rotateFromPoint(square2.vertices.get(0),.008);
       }
    }
    
    //shrink from the first vertex
    void shrinkL(){
       for(int i = 1; i < square.getVertices().size();i++){
         square.shrink(square.getVertices().get(0),.0008);
         square2.shrink(square2.getVertices().get(0),.0008);
       }
    }
  
  void display(){
    square.display();
    square2.display();
  }
}