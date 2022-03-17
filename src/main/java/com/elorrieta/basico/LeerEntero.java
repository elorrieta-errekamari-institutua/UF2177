package com.elorrieta.basico;

import java.util.Scanner;

/**
 * Ejemplo basico para leer un numero entero (int) por teclado
 * 
 * @author infauraga
 *
 */
public class LeerEntero {

	public static void main(String[] args) {
		System.out.println("dime un numero:");

		Scanner sc = new Scanner(System.in);

		// decalramos una variable de tipo entero
		int numero = 0;

		// leemos por pantalla y lo guaradmos en la variable
		try {
			numero = Integer.parseInt(sc.nextLine());
			System.out.println("El numero es " + numero);
			
		}catch (Exception e) {

			System.err.println("Hemos tenido una excepcion " + e.getMessage());
			e.printStackTrace(); // muestra la traza de la Exception
			
		}finally {
			System.out.println("Termina programa");
			sc.close();
		}

	}

}
