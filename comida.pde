class Comida{

  float cx,cy;
  
  Comida(float centroX, float centroY, float radioMax){
  
    float angulo = random(TWO_PI); //esto es necesario para una dispersion circular
    float r = random(radioMax);
    
    this.cx = centroX + cos(angulo) * r;
    this.cy = centroY + sin(angulo) * r;
    
  }
  
  float colhorr = random(164,216);
  float volumen = random(3,8);
  
  void mostrar(){
  
    fill(255,colhorr,0);
    noStroke();
    rect(cx,cy,volumen,volumen);
  
  }

}
