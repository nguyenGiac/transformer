class Shape{
  float inc;
  ArrayList<PVector> vertices;
  
  Shape(ArrayList<PVector> v){
    vertices = v;
  }
  
  void display(){
    inc += .1;
    stroke(map(sin(inc),-1,1,0,255),50);
    for(int i = 0; i < vertices.size(); i++){
       if(i == vertices.size()-1){
         line(vertices.get(i).x,vertices.get(i).y,vertices.get(0).x,vertices.get(0).y);
       } else {
         line(vertices.get(i).x,vertices.get(i).y,vertices.get(i+1).x,vertices.get(i+1).y);
       }
    }
  }
  
  void rotateAndScale(float p, float q,float r,float s){
    float a = r*cos(p);
    float b = -s*sin(q);
    float c = r*sin(p);
    float d = s*cos(q);
      for(int i = 0; i < vertices.size(); i++){
        PVector temp = vertices.get(i).copy();
        vertices.get(i).x =  (a*temp.x)+(b*temp.y);
        vertices.get(i).y =  (c*temp.x)+(d*temp.y);
      }
  }
  
  void shrink(PVector origin){
     for(int i = 0; i < vertices.size()-1; i++){
       PVector temp = vertices.get(i).copy();
       vertices.get(i).x = (origin.x + temp.x)*.5;
       vertices.get(i).y = (origin.y + temp.y)*.5;
     }
  }
  
  void spin(){
    for(int i = 0; i < vertices.size(); i++){
      rotateFromPoint(vertices.get(0),-45);
    }
  }
  
  void rotateFromPoint(PVector p, float theta) {
    for(int i = 0; i < vertices.size(); i++){
       PVector v = vertices.get(i).copy();
       vertices.get(i).x = (p.copy().x - v.x)*cos(theta) - (p.copy().y - v.y)*sin(theta)+p.copy().x;
       vertices.get(i).y = (p.copy().x - v.x)*sin(theta) + (p.copy().y - v.y)*cos(theta)+p.copy().y;
    }
  }
  
  ArrayList<PVector> getVertices(){
    return vertices;
  }
}
