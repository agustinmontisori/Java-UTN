package entidades;
import java.util.ArrayList;

public class Nutricionista extends Usuario {
	ArrayList<Horario> horarios;
	Direccion direccion;

	public Direccion getDireccion() {
		return direccion;
	}

	public void setDireccion(Direccion direccion) {
		this.direccion = direccion;
	}
	
	public void setHorarios(ArrayList<Horario> horarios) {
		this.horarios = horarios;
	}
	public ArrayList<Horario> getHorariosAtencion() {
		return horarios;
	}
	@Override
	public String toString() {
		return "\nNutricionista [dni="+ dni + ", nombre=" + nombre + ", apellido=" + apellido
				+ ", email=" + email + ", tel=" + telefono + "]";
	}
}
