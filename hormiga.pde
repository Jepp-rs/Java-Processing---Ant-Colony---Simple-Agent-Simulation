class Hormiga{

  float hx,hy, direccion;
  color col;
  
  Hormiga(float hx, float hy, color col){
  
    this.hx = hx;
    this.hy = hy;
    this.col = col;
  
  }
  
  void mover(){
  
    direccion += random(-0.2,0.2);
    
    float velocidad = 2;
    
    hx += cos(direccion) * velocidad;
    hy += sin(direccion) * velocidad;
    
    if (hx < 0 || hx >= width){
    
      direccion = PI - direccion;
    
    }
    
    if (hy < 0 || hy >= height){
    
      direccion = -direccion;
    
    }
    
  }
  
  void mostrar(){
  
    fill(col);
    noStroke();
    ellipse(hx,hy,6,6);
  
  }
  
  float calcularDistancia (float x1, float y1, float x2, float y2) { // Función para calcular la distancia al cuadrado entre dos puntos
    float dx = x2 - x1;
    float dy = y2 - y1;
    return dx * dx + dy * dy;
  }   

}
