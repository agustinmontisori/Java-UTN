package data;
import entidades.*;

import java.sql.*;
import java.util.LinkedList;

public class DataNutricionista {
	
	public LinkedList<Nutricionista> getAll(){
		Statement stmt = null;
		ResultSet rs = null;
		LinkedList<Nutricionista> nuts = new LinkedList<>();
		try {
			stmt = DbConnector.getInstancia().getConn().createStatement();
			rs = stmt.executeQuery("select n.dni, n.nombre, n.apellido, n.email, n.telefono, d.cod_postal, d.calle, l.denominacion, d.altura, d.piso, d.depto " + 
					"from nutricionista n " + 
					"inner join direccion d on d.id_nutricionista = n.dni " + 
					"inner join localidad l on d.cod_postal = l.cod_postal");
			//intencionalmente no se recupera la password
			if(rs != null) {
				while(rs.next()) {
					Nutricionista n = new Nutricionista();
					Direccion d = new Direccion();
					Localidad l = new Localidad();
					
					l.setCodPostal(rs.getInt("cod_postal"));
					l.setDenominacion(rs.getString("denominacion"));
					
					d.setCalle(rs.getString("calle"));
					d.setAltura(rs.getInt("altura"));
					d.setPiso(rs.getInt("piso"));
					d.setDepto(rs.getString("depto"));
					d.setLocalidad(l);
					
					n.setDireccion(new Direccion());
					n.setDni(rs.getString("dni"));
					n.setNombre(rs.getString("nombre"));
					n.setApellido(rs.getString("apellido"));
					n.setEmail(rs.getString("email"));
					n.setTelefono(rs.getString("telefono"));
					n.setDireccion(d);

					nuts.add(n);
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			try {
				if(rs != null) {rs.close();}
				if(stmt != null) {stmt.close();}
				DbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return nuts;
	}
	
	public Nutricionista getByDni(Nutricionista nut) {
		Nutricionista n = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement(
					"select dni,nombre,apellido from nutricionista where dni = ?"
					);
			stmt.setString(1, nut.getDni());
			rs = stmt.executeQuery();
			if(rs != null && rs.next()) {
				n = new Nutricionista();
				n.setApellido(rs.getString("apellido"));
				n.setNombre(rs.getString("nombre"));
				n.setDni(nut.getDni());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				DbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return n;
	}
	
	public LinkedList<Nutricionista> getByLocalidad(Localidad loc){
		
		// recibe una localidad, devuelve todos los nutricionistas registrados en esa localidad.
		
		PreparedStatement stmt = null;
		ResultSet rs = null;
		LinkedList<Nutricionista> nuts = new LinkedList<>();
		
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement(
					"select n.dni, n.nombre, n.apellido, l.cod_postal, l.denominacion, d.calle, d.altura " +
					"from localidad l " + 
					"inner join direccion d on d.cod_postal = l.cod_postal " + 
					"inner join nutricionista n on n.dni = d.id_nutricionista " + 
					"where l.denominacion = ?"
					);
			stmt.setString(1, loc.getDenominacion());
			rs = stmt.executeQuery();
			
			if(rs != null) {
				while(rs.next()) {
					Nutricionista n = new Nutricionista();
					Direccion d = new Direccion();
					Localidad l = new Localidad();
					
					l.setCodPostal(rs.getInt("cod_postal"));
					l.setDenominacion(rs.getString("denominacion"));
					
					d.setCalle(rs.getString("calle"));
					d.setAltura(rs.getInt("altura"));
					d.setLocalidad(l);
										
					n.setDireccion(new Direccion());
					n.setDni(rs.getString("dni"));
					n.setNombre(rs.getString("nombre"));
					n.setApellido(rs.getString("apellido"));
					n.setDireccion(d);

					nuts.add(n);
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			try {
				if(rs != null) {rs.close();}
				if(stmt != null) {stmt.close();}
				DbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return nuts;
	}
	
	public void add(Nutricionista nut) {
		PreparedStatement stmt = null;
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement(
					"insert into nutricionista (dni,nombre,apellido,password,telefono,email) values (?,?,?,?,?,?)"
					);
			stmt.setString(1, nut.getDni());
			stmt.setString(2, nut.getNombre());
			stmt.setString(3, nut.getApellido());
			stmt.setString(4, nut.getPassword());
			stmt.setString(5, nut.getTelefono());
			stmt.setString(6, nut.getEmail());
			stmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(stmt!=null) stmt.close();
				DbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public void update(Nutricionista nut) {
		PreparedStatement stmt = null;
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement(
					"update nutricionista "
					+ "set nombre=?, apellido=?, email=?, telefono=?, password=? "
					+ "where dni = ?" 
					);
			stmt.setString(1, nut.getNombre());
			stmt.setString(2, nut.getApellido());
			stmt.setString(3, nut.getEmail());
			stmt.setString(4, nut.getTelefono());
			stmt.setString(5, nut.getPassword());
			stmt.setString(6, nut.getDni());
			stmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(stmt!=null) stmt.close();
				DbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
		
	public void remove(Nutricionista nut) {
		PreparedStatement stmt = null;
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement(
					"delete from nutricionista where dni = ?"
					);
			stmt.setString(1, nut.getDni());
			stmt.execute();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(stmt!=null) stmt.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
}
