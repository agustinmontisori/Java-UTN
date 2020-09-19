package entidades;

public class Ejercicio {

	int id_ejercicio;
	String nombre;
	int gasto_energetico;	

	
	public int getId_ejercicio() {
		return id_ejercicio;
	}




	public void setId_ejercicio(int id_ejercicio) {
		this.id_ejercicio = id_ejercicio;
	}




	public String getNombre() {
		return nombre;
	}




	public void setNombre(String nombre) {
		this.nombre = nombre;
	}




	public int getGasto_energetico() {
		return gasto_energetico;
	}




	public void setGasto_energetico(int gasto_energetico) {
		this.gasto_energetico = gasto_energetico;
	}




	@Override
	public String toString() {
		String s = "\nEjercicio [id ejercicio= " + id_ejercicio + ", nombre= " + nombre + ", Gasto energetico= " + gasto_energetico +"] ";
		return s;
	}
	
}


