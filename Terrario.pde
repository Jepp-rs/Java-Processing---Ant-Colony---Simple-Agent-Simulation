/*
Ant Colony Simulation
---------------------

Un proyecto de aprendizaje realizado en Processing (Java).

Simula hormigas recolectoras que buscan comida y regresan a su colonia.
La colonia aumenta su número de hormigas según los suministros recolectados.

El sistema es intencionalmente simple y carece de mecánicas más avanzadas
como feromonas, enemigos o comportamiento colectivo complejo.

El objetivo del proyecto fue practicar:

- Programación orientada a objetos
- Movimiento basado en vectores
- Simulación de agentes simples

¡¡¡Haga click para invocar comida!!!
*/

Colonia col;
Recolectora rec;
ArrayList<Colonia> colonia;
ArrayList<Gestor> gestor;

void mousePressed(){
 
   Gestor nuevoGestor = new Gestor(mouseX,mouseY,100);
   
   nuevoGestor.invocarComida();
   gestor.add(nuevoGestor);
  
}

void setup(){
  
  size(800,600);
    
  colonia = new ArrayList<Colonia>();
  gestor = new ArrayList<Gestor>();
  
  int cantidadHormigas = 5;
  
  colonia.add(new Colonia (400,300,cantidadHormigas,color(50,50,50)));
  
  for (Colonia c : colonia){
  
    c.invocarColonia();
  
  }

}

void draw(){

  background(255);
  
  
  
  fill(0);
  textSize(17);
  textAlign(RIGHT);
  text("Suministros: " + colonia.get(0).suministrosTotales,width - 40, height - 60); //Cantidad de comida que fue recolectada
  fill(0);
  textSize(17);
  textAlign(RIGHT);
  text("Hormigas: " + colonia.get(0).hormigas.size(), width - 40,height - 90);
  fill(0);
  textSize(17);
  textAlign(RIGHT);
  text("Meta: " + colonia.get(0).valorActual,width - 40,height - 30);
  
  for (Colonia c : colonia){ //Actualizamos los estados de la colonia
   
    c.actualizarColonia();
    c.aumentarHormiga();
    c.mostrarColonia();
  
  }
  
  for (Gestor g : gestor){ //mostramos la comida
  
    g.mostrarComida();
  
  }

}
