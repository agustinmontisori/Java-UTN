package data;

import java.util.LinkedList;
import java.sql.*;
import entidades.*;

public class DataEjercicio {

	public void add(Ejercicio eje) {
		PreparedStatement stmt= null;
		ResultSet rs=null;
		
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement(
					"insert into ejercicio(id_ejercicio, nombre, gasto_energetico) values(?,?,?)"
					);
			stmt.setInt(1, eje.getId_ejercicio());
			stmt.setString(2, eje.getNombre());
			stmt.setInt(3, eje.getGasto_energetico());

			stmt.executeUpdate();
			
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				if (rs != null) { rs.close(); }
				if (stmt != null) { stmt.close(); }
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}
	
	public void remove(Ejercicio eje) {
		PreparedStatement stmt= null;
		ResultSet rs=null;
			
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement(
					"delete from ejercicio where id_ejercicio = ?"
					);
		
			stmt.setInt(1, eje.getId_ejercicio());
			stmt.executeUpdate();
				
	
		}  catch (SQLException e) {
        e.printStackTrace();

			} finally {
        try {
            if(rs!=null)rs.close();
            if(stmt!=null)stmt.close();
            DbConnector.getInstancia().releaseConn();
	        	
        } catch (SQLException e) {
        	e.printStackTrace();
        	}	
		}

	}

	public void update(Ejercicio eje) {
		PreparedStatement stmt= null;
		ResultSet rs=null;
		
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement(
					"update ejercicio set nombre=?, gasto_energetico=? where id_ejercicio = ?"
					);
			
			stmt.setString(1, eje.getNombre());
			stmt.setInt(2, eje.getGasto_energetico());
			stmt.setInt(3, eje.getId_ejercicio());
			stmt.executeUpdate();
			
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				if (rs != null) { rs.close(); }
				if (stmt != null) { stmt.close(); }
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}		
	
	public LinkedList<Ejercicio> getAll() {
		Statement stmt = null;
		ResultSet rs = null;
		LinkedList<Ejercicio> ejs = new LinkedList<>();
		Ejercicio eje;
		
		try {
			stmt = DbConnector.getInstancia().getConn().createStatement();
			rs = stmt.executeQuery("select id_ejercicio, nombre, gasto_energetico " + 
					"from ejercicio"
					);

			if(rs != null) {
				while(rs.next()) {
					eje = new Ejercicio();
					eje.setId_ejercicio(rs.getInt("id_ejercicio"));
					eje.setNombre(rs.getString("nombre"));
					eje.setGasto_energetico(rs.getInt("gasto_energetico"));
					ejs.add(eje);
				}
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				if (rs != null) { rs.close(); }
				if (stmt != null) { stmt.close(); }
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return ejs;
		
	}
	
}
