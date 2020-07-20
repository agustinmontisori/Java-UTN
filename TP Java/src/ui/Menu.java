package ui;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.Scanner;

import entidades.*;
import logic.*;

public class Menu {
	Scanner s=null;
	AbmcDireccion abmcDireccion = new AbmcDireccion();
	AbmcNutricionista abmcNutricionista = new AbmcNutricionista();
	UsuarioLogic usuarioLogic = new UsuarioLogic();

	public void start() {
		s = new Scanner(System.in);
		
		System.out.println("----------------------------------");
		System.out.println();
		
		String command;
		do {
			System.out.println("--------------------------------- ABMC ---------------------------------------------");
			command = getCommand();
			executeCommand(command);
			System.out.println();
		} while(!command.equalsIgnoreCase("exit"));
		
		s.close();
	}

	private void executeCommand(String command) {
		switch (command) {
		case "1":
			mostrarNutricionistas();
			break;
		case "2":
			buscarNutricionista();
			break;
		case "3":
			buscarNutricionistaLocalidad();
			break;
		case "4":
			agregarNutricionista();
			break;
		case "5":
			updateNutricionista();
			break;
		case "6":
			removeNutricionista();
			break;
		default:
			break;
		}
	}

	private String getCommand() {
		System.out.println("Ingrese el comando según la opción que desee realizar");
		System.out.println("1 nutricionista-getAll");
		System.out.println("2 nutricionista-getByDni"); 
		System.out.println("3 nutricionista-getByLocalidad");
		System.out.println("4 nutricionista-add");
		System.out.println("5 nutricionista-update");
		System.out.println("6 nutricionista-remove");

		System.out.print("\nComando: ");
		return s.nextLine();
	}
	
	private void mostrarNutricionistas() {
		LinkedList<Nutricionista> nuts = abmcNutricionista.getAll();
		for (Nutricionista nut : nuts) {
			System.out.println(nut);
		}
	}
	
	private void buscarNutricionista() {
		System.out.println();
		Nutricionista nut = new Nutricionista();
		System.out.print("DNI: ");
		nut.setDni(s.nextLine());
		nut = abmcNutricionista.getByDni(nut);
		System.out.println(nut);
	}
	
	public void buscarNutricionistaLocalidad() {
		System.out.println();
		Localidad loc = new Localidad();
		System.out.print("Localidad: ");
		loc.setDenominacion(s.nextLine());
		LinkedList<Nutricionista> nuts = abmcNutricionista.getByLocalidad(loc);
		if(nuts.isEmpty()) {
			System.out.println("No existen nutricionitas registrados en esa localidad");
		} else {
			System.out.println(nuts);
		}
	}
	public void agregarNutricionista() {
		Nutricionista n = new Nutricionista();
		Localidad l = new Localidad();
		Direccion d = new Direccion();
		System.out.print("nombre: ");
		n.setNombre(s.nextLine());
		System.out.print("apellido:");
		n.setApellido(s.nextLine());
		System.out.print("dni: ");
		n.setDni(s.nextLine());
		System.out.print("email: ");
		n.setEmail(s.nextLine());
		System.out.print("telefono: ");
		n.setTelefono(s.nextLine());
		System.out.print("password: ");
		n.setPassword(s.nextLine());
		
		System.out.println("-----Datos direccion----");
		System.out.print("localidad: ");
		l.setDenominacion(s.nextLine());
		System.out.print("codigo postal: ");
		l.setCodPostal(Integer.parseInt(s.nextLine()));
		System.out.print("calle: ");
		d.setCalle(s.nextLine());
		System.out.print("altura: ");
		d.setAltura(Integer.parseInt(s.nextLine()));
		System.out.print("piso: ");
		d.setPiso(Integer.parseInt(s.nextLine()));
		System.out.print("departamento: ");
		d.setDepto(s.nextLine());
		
		ArrayList<Horario> horarios = new ArrayList<>();
		do {
			Horario h = new Horario();
			System.out.println("-----Horario----");
			System.out.print("dia: ");
			h.setDia(s.nextLine());
			System.out.print("hora desde: ");
			h.setHoraDesde(LocalTime.parse(s.nextLine()));
			System.out.print("hora hasta: ");
			h.setHoraHasta(LocalTime.parse(s.nextLine()));
			horarios.add(h);
			System.out.print("continua?(si/no): ");
		} while(s.nextLine().equalsIgnoreCase("si"));
	
		d.setLocalidad(l);
		n.setDireccion(d);
		n.setHorarios(horarios);
		abmcNutricionista.add(n);
	}
	
	public void updateNutricionista() {
		
	}
	
	public void removeNutricionista() {
		
	}
	
//	
//	private ArrayList<Persona> search() {
//		System.out.println();
//		Persona p = new Persona();
//		System.out.print("apellido: ");
//		p.setApellido(s.nextLine());
//		return ctrlLogin.getByApellido(p);
//	}
//	
//	private void inicializePersona(Persona p) {
//		Documento d = new Documento();
//		System.out.print("tipo documento: ");
//		String tipo = s.nextLine();
//		while(!tipo.equalsIgnoreCase("dni") && !tipo.equalsIgnoreCase("cuit")) {
//			System.out.print("tipo documento: ");
//			tipo = s.nextLine();
//		}
//		d.setTipo(tipo);
//		System.out.print("nro documento: ");
//		d.setNro(s.nextLine());
//		p.setDocumento(d);
//		System.out.print("nombre: ");
//		p.setNombre(s.nextLine());
//		System.out.print("apellido: ");
//		p.setApellido(s.nextLine());
//		System.out.print("email: ");
//		p.setEmail(s.nextLine());
//		System.out.print("contraseña: ");		
//		p.setPassword(s.nextLine());
//		System.out.print("telefono: ");		
//		p.setTel(s.nextLine());
//		System.out.print("habilitado: ");				
//		if(s.nextLine().equalsIgnoreCase("si")) {
//			p.setHabilitado(true);
//		} else {
//			p.setHabilitado(false);
//		}
//		ctrlLogin.add(p);
//	}
//
//	private void assignRol(Persona p) {
//		System.out.println("\n--------------Roles disponibles: ");
//		LinkedList<Rol> roles = ctrlLogin.getRoles();
//		for (Rol rol : roles) {
//			System.out.println(rol);
//		}
//		Rol selectedRol = new Rol();
//		
//		System.out.print("rol: ");
//		selectedRol.setDescripcion(s.nextLine());
//		ctrlLogin.assignRol(p, selectedRol);
//	}
//	
//	private void editPerson(){
//		Documento d = new Documento();
//		Persona p = null;
//		do {
//			p = new Persona();
//			System.out.print("tipo documento: ");
//			String tipo = s.nextLine();
//			while(!tipo.equalsIgnoreCase("dni") && !tipo.equalsIgnoreCase("cuit")) {
//				System.out.print("tipo documento: ");
//				tipo = s.nextLine();
//			}
//			d.setTipo(tipo);
//			System.out.print("nro documento: ");
//			d.setNro(s.nextLine());
//			p.setDocumento(d);
//			
//			p = ctrlLogin.getByDocumento(p);
//			if(p == null) System.out.println("Datos ingresados incorrectos\n----------------");
//		} while (p == null);
//		System.out.println("\nPersona seleccionada: ");
//		System.out.println(p);
//		System.out.println("\n--------Nuevos datos:");
//		
//		System.out.print("nombre: ");
//		p.setNombre(s.nextLine());
//		System.out.print("apellido: ");
//		p.setApellido(s.nextLine());
//		System.out.print("email: ");
//		p.setEmail(s.nextLine());
//		System.out.print("contraseña: ");		
//		p.setPassword(s.nextLine());
//		System.out.print("telefono: ");		
//		p.setTel(s.nextLine());
//		System.out.print("habilitado: ");				
//		if(s.nextLine().equalsIgnoreCase("si")) {
//			p.setHabilitado(true);
//		} else {
//			p.setHabilitado(false);
//		}
//		ctrlLogin.updatePerson(p);
//	}	
//	private void deletePerson() {
//		
//		Documento d = new Documento();
//		Persona p = null;
//		do {
//			p = new Persona();
//			System.out.print("tipo documento: ");
//			String tipo = s.nextLine();
//			while(!tipo.equalsIgnoreCase("dni") && !tipo.equalsIgnoreCase("cuit")) {
//				System.out.print("tipo documento: ");
//				tipo = s.nextLine();
//			}
//			d.setTipo(tipo);
//			System.out.print("nro documento: ");
//			d.setNro(s.nextLine());
//			p.setDocumento(d);
//			
//			p = ctrlLogin.getByDocumento(p);
//			if (p != null) {
//				System.out.print("\nPersona seleccionada: ");
//				System.out.println(p);
//			} else {
//				System.out.println("Datos ingresados incorrectos");
//			}
//		} while (p == null);
//		
//		System.out.print("\nEstas seguro? (si/no): ");
//		if (s.nextLine().equalsIgnoreCase("si")) {
//			ctrlLogin.deletePerson(p);
//		} else {
//			System.out.println("\n 	OK. No se eliminó nada.");
//		}
//	}
}
