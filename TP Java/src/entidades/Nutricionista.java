package entidades;
import java.util.Date;
import java.util.ArrayList;

public class Nutricionista extends Usuario {
	ArrayList<HorarioAtencion> horariosAtencion;
	String nombre;
	String apellido;
	String email;
	String telefono;
	Direccion direccion;
	
	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellido() {
		return apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

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
}
