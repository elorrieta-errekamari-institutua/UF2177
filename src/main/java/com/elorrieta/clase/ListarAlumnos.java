package com.elorrieta.clase;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ListarAlumnos {

	public static void main(String[] args) {

		System.out.println("Empieza el programa");
		
		try {
		
			
			Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/clase", "root", "root");
			String sql = "SELECT id_alumno, nombre, email FROM clase.alumno ORDER BY id_alumno DESC;";
			PreparedStatement pst = conexion.prepareStatement(sql);
			ResultSet rs = pst.executeQuery(); // ejecuto como si pulsara el rayo en workbench y recibo unos resultados "rs"
			while( rs.next() ) {
				
				int id = rs.getInt("id_alumno");
				String nombre = rs.getString("nombre");								
				System.out.println( id  + " " + nombre );				
				
			}// while
			
	
		}catch (Exception e) {
			
			System.out.println("Hemos tenido un problema");
			e.printStackTrace();
		}	
		

		System.out.println("Termina el programa");
		
	}// main

}// clase
