package entidades;
import java.util.ArrayList;

public class Nutricionista extends Usuario {
	ArrayList<HorarioAtencion> horariosAtencion;
	Direccion direccion;

	public Direccion getDireccion() {
		return direccion;
	}

	public void setDireccion(Direccion direccion) {
		this.direccion = direccion;
	}
	
	public void setHorariosAtencion(ArrayList<HorarioAtencion> horarios) {
		this.horariosAtencion = horarios;
	}
	public ArrayList<HorarioAtencion> getHorariosAtencion() {
		return horariosAtencion;
	}
	@Override
	public String toString() {
		return "Nutricionista [dni="+ dni + ", nombre=" + nombre + ", apellido=" + apellido
				+ ", email=" + email + ", tel=" + telefono + "]";
	}
}
