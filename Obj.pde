class Obj{

  int Px;
  int Py;
  int Sz;
  
  public Obj(int Pxb, int Pyb, int Sb){
 
    Px = Pxb;
    Py = Pyb;
    Sz = Sb; 
 } 


void DrawShapes(){
  
  background(0);
  
//Fake obj
  for (int i = 0; i <= Points*4; i++)
  {
     fill (int (random (0,175)), int (random (0,255)), int (random (0,255)));
     ellipse (int (random (50,width-(Size/2))), int(random (50,height-(Size/2))), Sz, Sz);
     
 }
 
 //Real obj
 PosX = int (random (Size, width-Size));
 PosY = int(random (Size+Size, height-Size));
 fill (255,0,0);
 ellipse(PosX,PosY,Size,Size);
 
 
}

}
