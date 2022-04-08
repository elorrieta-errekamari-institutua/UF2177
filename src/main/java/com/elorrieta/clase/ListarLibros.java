package com.elorrieta.clase;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ListarLibros {

	public static void main(String[] args) {

		System.out.println("Empieza el programa");
		
		try {
		
			
			Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/gravity_books", "root", "root");
			String sql = "SELECT book_id, title FROM book ORDER BY book_id DESC;";
			PreparedStatement pst = conexion.prepareStatement(sql);
			ResultSet rs = pst.executeQuery(); // ejecuto como si pulsara el rayo en workbench y recibo unos resultados "rs"
			while( rs.next() ) {
				
				int id = rs.getInt("book_id");
				String titulo = rs.getString("title");				
				System.out.printf(" %5s %-25s \n", id , titulo);				
				
			}// while
			
	
		}catch (Exception e) {
			
			System.out.println("Hemos tenido un problema");
			e.printStackTrace();
		}	
		

		System.out.println("Termina el programa");
		
	}// main

}// clase
