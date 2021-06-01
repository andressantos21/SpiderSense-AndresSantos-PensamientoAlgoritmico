//SpiderSense Andrés Santos 201923160 - Pensamiento Algorítmico 
//libreria sonido
import processing.sound.*;
SoundFile miCancion;

int Scr;
int PosX = 0;
int PosY = 0;
int Points = 0;
int ReDraw = 1;
int Size = 25;

Obj[] bolasfalsas;
int numbf = 1;
Obj[] bolasreales;
int numbr = 1;

Table puntaje;

Screens main, how, over;

void setup (){
  size (720, 720);
  background(0);
  
  miCancion = new SoundFile(this, "Spiderman.mp3");
  miCancion.play();
  miCancion.loop();
  
  PImage  imagenmenu = loadImage("mainmenu.jpg");
  PImage imagenhow = loadImage("howtoplay.jpg");
  PImage imagenover = loadImage("gameover.png");
  
   main = new Screens (imagenmenu);
   how = new Screens(imagenhow);
   over = new Screens(imagenover);
 
 Scr = 0;
 
 bolasfalsas = new Obj[numbf];
 for (int i = 0; i < numbf; i++){
 bolasfalsas[i] = new Obj(floor(random(0,width)), floor(random(0,height)), floor(random(25,25)));
 } 
 
 bolasreales = new Obj[numbr];
 for (int i = 0; i < numbr; i++){
 bolasreales[i] = new Obj(int(random(0,width)), int(random(0,height)), int(random(25,25)));
 }
 
 //puntaje=new Table();
 //puntaje.addColumn("Fecha");
 //puntaje.addColumn("Puntaje");
 
 puntaje = loadTable("data/Puntajes.csv", "header");
 
 
}

void draw (){
  
  // Cambios de estado
  if (Scr == 0) {    
    main.pintarScreen();
  }
  
  if ((Scr == 1) && (ReDraw == 1))
  {
    for (int i = 0; i < numbf; i++) {
    bolasfalsas[i].DrawShapes();
    }
    for(int i = 0; i < numbr; i++) {
    bolasreales[i].DrawShapes();
    }
    
//Puntaje
 fill(255,0,0);
 textAlign(CENTER);
 textSize(21);
 text("SCORE: " + (Points), 70, 30);
 
//Tiempo
 fill(0,0,255);
 textSize(21);
 text( "TIME: " + millis()/1000, 650, 30);
 
 ReDraw = 0;
  }
  
  if (Scr == 2) {    
    how.pintarScreen();
  }
  
  if (Scr == 3) {    
    over.pintarScreen();    
  }
}

void keyReleased() {
  
  //Instrucciones tecla I
  if (key == 'i'){
    if (Scr == 0){
    Scr = 2;
  }
 }
 //Volver de instrucciones
 if (key == 'b'){
    if (Scr == 2){
    Scr = 0;
  }
 }
 //Iniciar juego
 if (key == 'x'){
    if (Scr == 0){
    Scr = 1;
  }
 }
 //Reintentar
 if (key == 'r'){
    if (Scr == 3){
    Scr = 1;
  }
 }
 //Salir
 if (key == 'q'){
    if (Scr == 3){
    Scr = 0;
  }
 }
}

//Función del mouse
void mouseClicked(){
  if (Scr == 1)
  {
  if (ReDraw == 0)
  {
  ReDraw = 1; 
  }
  if ((mouseX > PosX-Size) && (mouseX < PosX+Size) && (mouseY < PosY+Size))
  {
  Points+= 1;
  }
  else
  {
  Scr = 3;
  fill(255);
  textAlign(RIGHT);
  text("FINAL SCORE: " + Points + " TIME: " + millis()/1000 + "s", 480, 30);
  
  //Tabla datos
    int mes= month();         
    int dia= day();         
    int hora= hour();         
    int minuto= minute(); 
                   
    String fecha_juego = mes+"-"+ dia+" " + hora+" : " +minuto;                  
    TableRow nuevaFila = puntaje. addRow();                  
    nuevaFila.setInt ("Puntaje", Points);         
    nuevaFila.setString ("Fecha", fecha_juego);  
    nuevaFila.setString ("Tiempo",  millis()/1000 + "s");  
    saveTable(puntaje,  "data/Puntajes.csv");
  
  }
 } 
}
