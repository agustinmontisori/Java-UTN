package entidades;
import java.sql.Time;
public class HorarioAtencion {
	private Time horaDesde;
	private Time horaHasta;
	private String dia;
	
	public Time getHoraDesde() {
		return horaDesde;
	}
	public void setHoraDesde(Time horaDesde) {
		this.horaDesde = horaDesde;
	}
	public Time getHoraHasta() {
		return horaHasta;
	}
	public void setHoraHasta(Time horaHasta) {
		this.horaHasta = horaHasta;
	}
	public String getDia() {
		return dia;
	}
	public void setDia(String dia) {
		this.dia = dia;
	}
	
	
	
}
