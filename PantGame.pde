//Módulo PantGame 
//elaborado por: Angel Palacios Mirafuentes
//fecha de creación: 30 de septiembre de 2022
//fecha de ultima modificación: 20 de octubre de 2022
//comentario: Implementa la clase PantGame, la cual controla las acciones del 
//juego.
class PantGame{
  Punto2D bg[];
  Punto2D fg[];
  SpriteSet ssbg;
  SpriteSet ssfg;
  Punto2D per;
  boolean dir;
  
  PantGame(){
    bg=new Punto2D[2];
    creaP2DArray(bg,400,400,800,0);
    fg=new Punto2D[2];
    creaP2DArray(fg,50,700,200,0);
    ssbg=new SpriteSet("sprites/bg/","bg",".png",2,6,false,0);
    ssfg=new SpriteSet("sprites/fg/","fg",".png",2,6,false,0);
    per=new Punto2D(240,600);
    dir=true;
  }
  
  void display(){
    planoFondo();
    planoNivel();
    planoFrente();
    planoHUD();
    gameProgress();
  }
  
  void planoFondo(){
    rectMode(CENTER);
    imageMode(CENTER);
    stroke(0);
    fill(128,128,0);
    graficaPlano(bg,ssbg,800,800);
  }
  
  void planoNivel(){
    ellipseMode(RADIUS);
    stroke(0,120,0);
    fill(0,200,0);
    circle(per.getX(),per.getY(),75);
  }
  
  void planoFrente(){
    rectMode(CENTER);
    imageMode(CENTER);
    stroke(0);
    fill(200,200,0);
    graficaPlano(fg,ssfg,100,200);
  }
  
  void planoHUD(){
    rectMode(CENTER);
    stroke(0);
    fill(220,220,220);
    rect(400,60,800,120);
  }
  
  void gameProgress(){
    muevePlano(bg,cf.bgdx,cf.bgdy,-400,1200);  
    muevePlano(fg,cf.fgdx,cf.fgdy,-100,900); 
    per.move(((dir)?cf.prdxu:cf.prdxd),((dir)?cf.prdyu:cf.prdyd));
    if(per.getY()==500 || per.getY()==700) dir=!dir;  
  }
  
  void creaP2DArray(Punto2D p[],int xi,int yi,int dx,int dy){
    for(int i=0;i<p.length;i++)
      p[i]=new Punto2D(xi+i*dx,yi+i*dy);
  }
  
  void muevePlano(Punto2D p[],int dx,int dy,int li,int ld){
    for(int i=0;i<p.length;i++){
      p[i].move(dx,dy);
      if(p[i].getX()<li) p[i].setX(ld);
    }
  }
  
  void graficaPlano(Punto2D p[],SpriteSet s,int x,int y){
    for(int i=0;i<p.length;i++){
      image(s.getSprite(i),p[i].getX(),p[i].getY());
      //rect(p[i].getX(),p[i].getY(),x,y);
    }  
  }
}
