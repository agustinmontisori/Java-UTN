package ui;
import java.util.LinkedList;
import entidades.*;
import logic.*;

public class Principal {
	public static void main(String[] args) {
//		UsuarioLogic ul = new UsuarioLogic();
		AbmcNutricionista abmcN = new AbmcNutricionista();
//		LinkedList<Paciente> pacientes = ul.getAll();
//		System.out.println(pacientes);
		
		Nutricionista nut = new Nutricionista();
		nut.setDni("22222225");
		nut.setApellido("Martin");
		nut.setNombre("Moreli");
		nut.setEmail("martin@gmail.com");
		nut.setTelefono("3460 3331233");
		nut.setPassword("martin");
	
		abmcN.add(nut);
		
		Nutricionista n2 = abmcN.getByDni(nut);
		System.out.println(n2);
	}
}
	