class Gestor{

  ArrayList<Comida> com = new ArrayList<Comida>();
  
  float gx,gy,dispersion;
  int cantidad,yacimientos;
  
  Gestor(float gx, float gy, int cantidad){
  
    this.gx = gx;
    this.gy = gy;
    this.cantidad = cantidad;
}  

  void invocarComida(){
  
    for (int i = 0; i < cantidad; i++){
    
      dispersion = 30; //Si cambias este numero aumenta la distancia entre las comidas
      
      com.add(new Comida(gx,gy,dispersion));
    
    }
    
  }
  
  void mostrarComida(){
  
    for (Comida c : com){
    
      c.mostrar();
    
    }
  
  }

}
