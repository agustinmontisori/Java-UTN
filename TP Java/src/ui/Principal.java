package ui;
import java.util.LinkedList;
import entidades.*;
import logic.*;

public class Principal {
	public static void main(String[] args) {
		UsuarioLogic ul = new UsuarioLogic();
		LinkedList<Paciente> pacientes = ul.getAll();
		System.out.println(pacientes);
	}
}
	