//here is where I am collecting methods to create and transform shapes.
//eventually, i'd like this program to be able to 'fractalize' any shape we feed it.
//so, i used the flexible ArrayList to hold the vertices, now I can build shapes with any amount of corners.

//the constructor here takes an ArrayList of vectors (PVectors), these define the shape.
//the display() method colors the stroke using a sine wave (the sin() function outputs values -1 to 1) 
//mapped from black to white-- so it creates a nice smooth repeating 
//transition from black to white and back over and over

//the rotateAndScale() method uses IFS codes (IFS is "iterated function systems" -- i have more to learn about IFS codes)
//to rotate and scale from an origin of (0,0)

//the rotateFromPoint() method allows me to rotate from one of the corners-- i use the first vertex that was assigned to the shape for this,
//so depending on how the shape was built, it will rotate differently. 

//the shrinkL() function does shrink the shape BUT! i'm not exactly sure what is going on. it is the result of my experimenting. i figured that I could 
//take two points, subtract one vector from another, then i should have a vector that points from one to the other, i figured that if I then reduced the 
//magnitude of that vector and reassigned the position of the relevant vector to be the end of this vector which now has a reduced magnitude,
//that this would scale the entire shape. and it works! but! the scaling doesn't work as expected. when i reduce the magnitude of
//the vector which points from the origin to each of the other corners by half, the new shape shrinks by a lot more than half! so, instead of reducing 
//the magnitude by half, i multiply it by a very small number like .0009

class Shape{
  float inc;
  ArrayList<PVector> vertices;
  
  Shape(ArrayList<PVector> v){
    vertices = new ArrayList<PVector>();
    for(int i = 0;i < v.size();i++){
      PVector p = v.get(i);
      vertices.add(p);
    }
  }
  
  
  void display(){
    inc += .1;
    stroke(map(sin(inc),-1,1,0,255),30);
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
       //then reduce the velocity by multiplying it by some small number
       //and then i will change each of the vertices by subtracting the 'velocity'
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