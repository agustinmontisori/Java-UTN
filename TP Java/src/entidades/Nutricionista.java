package entidades;
import java.util.Date;

public class Nutricionista extends Usuario {
	Date horarioAtencion;

	public Date getHorarioAtencion() {
		return horarioAtencion;
	}

	public void setHorarioAtencion(Date horarioAtencion) {
		this.horarioAtencion = horarioAtencion;
	}
	
}
