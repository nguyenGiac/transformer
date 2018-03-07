class Shape{
  float inc;
  ArrayList<PVector> vertices;
  Shape(ArrayList<PVector> v){
    vertices = v;
  }
  
  void display(){
    inc += .1;
    stroke(map(sin(inc),-1,1,0,255));
    for(int i = 0; i < vertices.size(); i++){
       if(i == vertices.size()-1){
         line(vertices.get(i).x,vertices.get(i).y,vertices.get(0).x,vertices.get(0).y);
       } else {
         line(vertices.get(i).x,vertices.get(i).y,vertices.get(i+1).x,vertices.get(i+1).y);
       }
    }
  }
  
  void spin(){
    for(int i = 0; i < vertices.size(); i++){
      rotate(vertices.get(i),.01);
    }
  }
  
  ArrayList<PVector> getVertices(){
    return vertices;
  }
  
  void rotate(PVector v, float theta) {
    float xTemp = v.x;
    v.x = v.x*cos(theta) - v.y*sin(theta);
    v.y = xTemp*sin(theta) + v.y*cos(theta);
  }
}
