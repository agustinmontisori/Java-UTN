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
		Localidad loc = new Localidad();
		loc.setDenominacion("Rosario");
		LinkedList<Nutricionista> nutricionistas = abmcN.getByLocalidad(loc);
		System.out.println(nutricionistas);
	}
}
	