class PTree{
  Shape square;
  float angle,incr;
  
  PTree(Shape s){
    square = s;
  }
  
  
  void rS(){
      square.rotateAndScale(.001,.001,.9991,.9991);
  }
 
   void rotateR(){
       for(int i = 0; i < square.getVertices().size();i++){
         square.rotateFromPoint(square.vertices.get(1),.1);
       }
    }
    
    void rotateL(){
       for(int i = 0; i < square.getVertices().size();i++){
         square.rotateFromPoint(square.vertices.get(0),.001);
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