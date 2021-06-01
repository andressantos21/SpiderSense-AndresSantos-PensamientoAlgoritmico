class Screens 
{
  
 PImage image;
 
  Screens(PImage pImagen)
  {
    image = pImagen;
  }
  
  void pintarScreen()
  {
  image(image, 0,0);
  }
   
}
