class Colonia{

  float coloniaX, coloniaY;
  color col;
  int cantidad, suministrosTotales = 0;
  int valorActual = 2;
  
  ArrayList<Recolectora>hormigas = new ArrayList<Recolectora>();
  
  Colonia (float coloniaX, float coloniaY, int cantidad, color col){
  
    this.coloniaX = coloniaX;
    this.coloniaY = coloniaY;
    this.cantidad = cantidad;
    this.col = col;
    
  }

  void invocarColonia(){
  
    for (int i = 0; i < cantidad; i++){
    
      hormigas.add(new Recolectora(coloniaX,coloniaY,col,gestor));
    
    }
  
  }
  
  void aumentarHormiga(){
    
    if (suministrosTotales > (valorActual * 2) && suministrosTotales > 1){
    
      hormigas.add(new Recolectora(coloniaX,coloniaY,col,gestor));
      valorActual = suministrosTotales;
    
    }
  
  }
  
  void actualizarColonia(){
  
    for (Recolectora r : hormigas){
  
      r.mover();
      r.mostrar();
      r.recolectar();
      r.detectarCargarComida();
      
    }
  
  }
  
  void mostrarColonia(){
  
    fill(col);
    noStroke();
    ellipse(coloniaX,coloniaY,30,30);
    fill(80);
    ellipse(coloniaX, coloniaY, 20,20);
    fill(40);
    ellipse(coloniaX, coloniaY, 10,10);
    
  }

}
