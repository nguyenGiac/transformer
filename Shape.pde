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
      //this draws lines between all the vertices, 
      //and at the end draws a line back to the first in the list
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
  
  void shrink(PVector o){
     PVector velocity;
     for(int i = 0; i < vertices.size(); i++){
       PVector origin = o.copy();
       PVector temp = vertices.get(i).copy();
       
       //i'm going to reduce my shapes by selecting an origin vertex,
       //calculating a 'velocity' vector by subtracting the origin and each of the vertices
       //then reduce the velocity by multiplying it by .75
       //and then change each of the vertices by subtracting my 'velocity'
       velocity = temp.sub(origin);
       velocity.setMag(velocity.mag()*.0005);
       vertices.get(i).sub(velocity);
       
       //i was previously getting the midpoint by averaging the two x and y positions
       //vertices.get(i).x = (origin.x + temp.x)*.5;
       //vertices.get(i).y = (origin.y + temp.y)*.5;
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
       vertices.get(i).x = (p.x - v.x)*cos(theta) - (p.y - v.y)*sin(theta)+p.x;
       vertices.get(i).y = (p.x - v.x)*sin(theta) + (p.y - v.y)*cos(theta)+p.y;
    }
  }
  
  ArrayList<PVector> getVertices(){
    return vertices;
  }
}