class Feromona{

  ArrayList<Recolectora>rec = new ArrayList<Recolectora>();
  
  float fx,fy;
  
  Feromona(float fx, float fy){
  
   this.fx = fx;
   this.fy = fy;
  
  }
  
  void mostrarFeromona(){
  
    fill(240,128,128);
    noStroke();
    ellipse(fx,fy,4,4);
  
  }
  
}
