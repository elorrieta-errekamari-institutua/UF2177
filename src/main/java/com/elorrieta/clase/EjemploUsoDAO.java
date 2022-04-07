package com.elorrieta.clase;

import java.sql.SQLException;
import java.util.ArrayList;

public class EjemploUsoDAO {

	public static void main(String[] args) throws SQLException {

		DaoAlumno dao = new DaoAlumno();
		
		Alumno aJon = dao.getById(5);		
		System.out.println(aJon);
		
		
		
		
		Alumno a1 = new Alumno();
		
		a1.setNombre("Espinete");
		a1.setEmail("espinete@email.com");
		
		dao.insert(a1);
		
		
		
		System.out.println(a1.toString());
		
		
		
		
		ArrayList<Alumno> alumnos = dao.getAll();
		
		
		System.out.println(alumnos);
		
		

	}

}
