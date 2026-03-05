class Recolectora extends Hormiga {

  ArrayList<Gestor> gestorRecolectora;
  
  ArrayList<Feromona>fer = new ArrayList<Feromona>();
  
  boolean recolectando = false;
  Comida comidaRecolectada = null;
  
  float coloniaX, coloniaY;
  
  int Suministros = 0;

  Recolectora(float hx, float hy, color col, ArrayList<Gestor> gestores) {
    super(hx, hy, col);
    this.gestorRecolectora = gestores;
    this.coloniaX = hx; // Guardamos el punto de origen
    this.coloniaY = hy;
  }

  void recolectar() {
    if (!recolectando) {
      for (Gestor g : gestorRecolectora) {
        for (int i = g.com.size() - 1; i >= 0; i--) {
          Comida comidaActual = g.com.get(i);
          if (calcularDistancia(hx, hy, comidaActual.cx, comidaActual.cy) < 400) { //"calcularDistancia" devuelve un resultado al cuadrado de la distancia (20*20)
            comidaRecolectada = comidaActual;
            g.com.remove(i);
            recolectando = true;
            break;
          }
        }
      }
    }
  }

  @Override
  void mover() {
    if (recolectando) { // Si ya tiene comida, solo ejecuta la lógica de volver
      volverColonia();
    } else { // Si no tiene comida, busca
      boolean objetivoEncontrado = false;
      for (Gestor g : gestorRecolectora) {
        for (Comida comidaActual : g.com) {
          if (calcularDistancia(hx, hy, comidaActual.cx, comidaActual.cy) < 10000) { //Lo mismo que arriba
            float dx = comidaActual.cx - hx;
            float dy = comidaActual.cy - hy;
            direccion = atan2(dy, dx);
            objetivoEncontrado = true;
            break;
          }
        }
        if (objetivoEncontrado) break;
      }

      if (!objetivoEncontrado) {
        super.mover(); // Movimiento aleatorio
      } else {
        float velocidad = 2;
        hx += cos(direccion) * velocidad;
        hy += sin(direccion) * velocidad;
      }
    }
  }

  void detectarCargarComida() {
    if (recolectando && comidaRecolectada != null) {
      comidaRecolectada.cx = hx;
      comidaRecolectada.cy = hy - 5;
      comidaRecolectada.mostrar();
    }
  }

  void volverColonia() {
    float dx = coloniaX - hx;
    float dy = coloniaY - hy;

    direccion = atan2(dy, dx);
    float variacion = random(-0.2,0.2);
    
    if (variacion < direccion){
    
      direccion += 0.2;
    
    }else{
    
      direccion -= 0.2;
    
    }
    

    float velocidad = 2;
    hx += cos(direccion) * velocidad;
    hy += sin(direccion) * velocidad;

    if (calcularDistancia(hx, hy, coloniaX, coloniaY) < 25) {
      recolectando = false;
      comidaRecolectada = null; // Hizo todo el recorrido :D
      
      colonia.get(0).suministrosTotales++;
      
    }
  }
}
