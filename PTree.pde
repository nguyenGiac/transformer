class PTree{
  Shape square;
  float angle,incr;
  
  PTree(Shape s){
    square = s;
  }
  
  
  void rS(){
      square.rotateAndScale(.001,.001,.9991,.9991);
  }
 
   void rotateL(){
       for(int i = 1; i < square.getVertices().size();i++){
         square.rotateFromPoint(square.vertices.get(0).copy(),radians(-225));
       }
    }
    
    void shrinkL(){
       for(int i = 1; i < square.getVertices().size();i++){
         square.shrink(square.getVertices().get(0));
       }
    }
  
  void display(){
    square.display();
  }
}
