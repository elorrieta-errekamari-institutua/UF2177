package com.elorrieta.clase;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class DaoAlumno {

	//executeQuery: ResultSet
	private static final String SQL_GET_ALL = "SELECT id_alumno, nombre, email FROM alumno ORDER BY id_alumno DESC LIMIT 500;";
	private static final String SQL_GET_BY_ID = "SELECT id_alumno, nombre, email FROM alumno WHERE  id_alumno = ?;";
	
	//executeUpdate: int
	private static final String SQL_GET_DELETE = "DELETE FROM alumno WHERE id_alumno = ?; ";
	private static final String SQL_GET_INSERT = "INSERT INTO alumno (`nombre`, `email`) VALUES ( ?, ?);";
	private static final String SQL_GET_UPDATE = "UPDATE alumno SET `nombre` = ?, `email` = ? WHERE id_alumno = ?);";

	/**
	 * Listado de todos los alumnos
	 * 
	 * @return
	 */
	ArrayList<Alumno> getAll() {

		ArrayList<Alumno> listado = new ArrayList<Alumno>();
		try (Connection con = Conexion.getConnection();
				PreparedStatement pst = con.prepareStatement(SQL_GET_ALL);
				ResultSet rs = pst.executeQuery();

		) {

			Alumno a = null;
			while (rs.next()) {

				a = new Alumno();
				a.setId(rs.getInt("id_alumno"));
				a.setNombre(rs.getString("nombre"));
				a.setEmail(rs.getString("email"));

				listado.add(a);

			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return listado;
	}

	/**
	 * 
	 * @param id
	 * @return
	 */
	Alumno getById(int id) {
		Alumno a = null;
		try (Connection con = Conexion.getConnection(); PreparedStatement pst = con.prepareStatement(SQL_GET_BY_ID);

		) {

			pst.setInt(1, id);

			try (ResultSet rs = pst.executeQuery()) {

				if (rs.next()) {

					a = new Alumno();
					a.setId(rs.getInt("id_alumno"));
					a.setNombre(rs.getString("nombre"));
					a.setEmail(rs.getString("email"));

				}

			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return a;

	}

	boolean delete(int id) throws SQLException {
		return true;
	}

	Alumno update(Alumno a, int id) throws SQLException {
		return null;
	}

	Alumno insert(Alumno a) throws SQLException {
		
		try (Connection con = Conexion.getConnection();
              PreparedStatement pst = con.prepareStatement(SQL_GET_INSERT, Statement.RETURN_GENERATED_KEYS);

		) {

			pst.setString(1, a.getNombre());
			pst.setString(2, a.getEmail());

			if ( pst.executeUpdate() == 1) {
					
				ResultSet rs = pst.getGeneratedKeys();
				if (rs.next()) {
					int idNuevo = rs.getInt(1);
					a.setId(idNuevo);
				}				

			}

		} catch (SQLException e) {

			e.printStackTrace();
		}
		
		return a;

	}

}
