package ui;
import java.util.LinkedList;
import entidades.*;
import logic.*;

public class pruebasNutricionista {
	public static void main(String[] args) {
		AbmcNutricionista abmcNut = new AbmcNutricionista();
		LinkedList<Nutricionista> nuts = abmcNut.getAll();
		System.out.println(nuts);
	}
}
	